package id.hikari.learning.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.transaction.Transactional;

import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import id.hikari.learning.feign.CLientApi;
import id.hikari.learning.feign.CodexRequest;
import id.hikari.learning.model.Exercise;
import id.hikari.learning.model.ExerciseAnswer;
import id.hikari.learning.model.ExercisePattern;
import id.hikari.learning.model.StudentExerciseAnswer;
import id.hikari.learning.payload.ApiResponse;
import id.hikari.learning.payload.ApiResponseData;
import id.hikari.learning.payload.CheckAnswerResponse;
import id.hikari.learning.payload.ExerciseAnswerResponse;
import id.hikari.learning.payload.ExerciseForGenerate;
import id.hikari.learning.payload.ExerciseRequest;
import id.hikari.learning.payload.GenerateExerciseResponse;
import id.hikari.learning.payload.ListExerciseCheckDoneResponse;
import id.hikari.learning.payload.ListExerciseResponse;
import id.hikari.learning.payload.PatternResultResponse;
import id.hikari.learning.payload.CheckAnswerResponse.QuestionExercises;
import id.hikari.learning.payload.CheckAnswerResponse.ResultAnswer;
import id.hikari.learning.repository.ExerciseAnswerRepository;
import id.hikari.learning.repository.ExercisePatternRepository;
import id.hikari.learning.repository.ExerciseRepository;
import id.hikari.learning.repository.PatternRepository;
import id.hikari.learning.repository.StudentExerciseAnswerRepository;
import id.hikari.learning.security.UserPrincipal;
import id.hikari.learning.utils.GeneralUtil;
import id.hikari.learning.utils.StaticValue;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Service
@Slf4j
public class ExerciseService {

        private final ExercisePatternRepository exercisePatternRepository;

        private final ExerciseRepository exerciseRepository;

        private final PatternRepository patternRepository;

        private final CLientApi cLientApi;

        private final ExerciseAnswerRepository exerciseAnswerRepository;

        private final StudentExerciseAnswerRepository studentExerciseAnswerRepository;

        /**
         * @return
         */
        public ResponseEntity generateExerciseFromPattern(Integer id) {

                List<ExerciseForGenerate> exerciseForGenerates = getAllByExercise(id);
                UUID randomUUID = UUID.randomUUID();
                AtomicInteger index = new AtomicInteger();
                // flat map di gunakan untuk mengubah List list string menjadi list string
                List<GenerateExerciseResponse> result = exerciseForGenerates.stream().map(item -> {
                        return processGeneratePattern(item, randomUUID);
                })
                                .flatMap(List::stream)
                                .map(item -> {
                                        cekAnswer(item, randomUUID, index.incrementAndGet());
                                        return item;
                                })
                                // artinya return stream dari list
                                // }).flatMap(a -> a.stream())
                                .collect(Collectors.toList());

                return ResponseEntity.ok(new ApiResponseData<>(result));
        }

        private List<GenerateExerciseResponse> processGeneratePattern(ExerciseForGenerate item, UUID randomUUID) {
                String result = "";
                List<PatternResultResponse> patternResult = new ArrayList<>();
                for (int i = 0; i < item.getAmount(); i++) {

                        result = item.getPattern();
                        result = GeneralUtil.replace(result, StaticValue.VALUE);
                        result = GeneralUtil.replace(result, StaticValue.COMPARE);
                        result = GeneralUtil.replace(result, StaticValue.OPERATOR);
                        result = GeneralUtil.replace(result, StaticValue.OUTPUT);
                        result = GeneralUtil.replace(result, StaticValue.LOGIC);

                        patternResult.add(PatternResultResponse.builder()
                                        .patternResult(result)
                                        .build());
                }

                List<GenerateExerciseResponse> resultResponse = patternResult.stream().map(i -> {
                        return GenerateExerciseResponse.builder()
                                        .pattern(i.getPatternResult())
                                        .exerciseId(item.getExerciseId())
                                        .build();
                }).collect(Collectors.toList());

                return resultResponse;
        }

        @Transactional
        public ResponseEntity createExercise(ExerciseRequest exerciseRequest) {
                Exercise saveExercise = exerciseRepository.save(
                                Exercise.builder()
                                                .exerciseName(exerciseRequest.getExerciseName())
                                                .description(exerciseRequest.getDescription())
                                                .build());
                exerciseRequest.getPatterns().forEach((item) -> {
                        exercisePatternRepository.save(
                                        ExercisePattern.builder()
                                                        .amount(item.getAmount())
                                                        .exercise(saveExercise)
                                                        .pattern(patternRepository.findById(item.getPatternId()).get())
                                                        .build());
                });
                return ResponseEntity.ok(new ApiResponse("exercise created!"));
        }

        public List<ExerciseForGenerate> getAllByExercise(Integer id) {
                List<ExerciseForGenerate> result = exercisePatternRepository.findAllByExerciseId(id).stream()
                                .map(item -> {
                                        return ExerciseForGenerate.builder()
                                                        .amount(item.getAmount())
                                                        .pattern(item.getPattern().getPattern())
                                                        .exerciseId(item.getExercise().getId())
                                                        .build();
                                }).collect(Collectors.toList());
                return result;
        }

        public ResponseEntity getAllExercise() {
                List<Exercise> exercises = exerciseRepository.findAllByOrderByIdDesc();
                return ResponseEntity.ok(new ApiResponseData<>(exercises));
        }

        @Async
        public void cekAnswer(GenerateExerciseResponse data, UUID randomUUID, int i) {
                String code = data.getPattern();
                CompletableFuture.supplyAsync(() -> {
                        Map<String, String> compile = cLientApi.compile(
                                        CodexRequest.builder()
                                                        .code(code)
                                                        .input("hallo ")
                                                        .language("java")
                                                        .build());
                        compile.put("code", code);

                        return compile;
                }).thenAccept((item) -> {
                        exerciseAnswerRepository.save(ExerciseAnswer.builder()
                                        .answer(item.get("output"))
                                        .code(code)
                                        .generateId(randomUUID.toString())
                                        .noIndex(i)
                                        .exerciseId(data.getExerciseId())
                                        .build());
                        log.info("Finish Compile for getting an answer");
                        log.info("output :{}", item.get("output") == null ? item.get("error") : item.get("output"));
                });

        }

        public ResponseEntity getExerciseAnswer(UserPrincipal principal) {
                Integer id = Integer.parseInt(String.valueOf(principal.getId()));
                List<ListExerciseResponse> findGroupByGenerateId = exerciseAnswerRepository.findGroupByGenerateId();
                List<ListExerciseCheckDoneResponse> result = findGroupByGenerateId.stream().map(item -> {
                        return ListExerciseCheckDoneResponse.builder()
                                        .amount(item.getAmount())
                                        .description(item.getDescription())
                                        .generateId(item.getGenerateId())
                                        .exerciseName(item.getExerciseName())
                                        .isDone(checkIsDoneExercise(item.getGenerateId(), id))
                                        .build();
                }).collect(Collectors.toList());
                return ResponseEntity.ok(new ApiResponseData<>(result));
        }

        private Boolean checkIsDoneExercise(String generateId, Integer studentId) {
                StudentExerciseAnswer exist = studentExerciseAnswerRepository.findByGenerateIdAndStudentId(generateId,
                                studentId);
                if (exist != null) {
                        return true;
                }
                return false;
        }

        public ResponseEntity getExerciseAnswerByGenerateId(String generateId) {

                List<ExerciseAnswer> result = exerciseAnswerRepository.findAllByGenerateIdOrderByNoIndex(generateId);

                List<ExerciseAnswerResponse> res = result.stream().map(item -> ExerciseAnswerResponse.builder()
                                .noIndex(item.getNoIndex())
                                .question(item.getCode())
                                .generateId(item.getGenerateId())
                                .build())
                                .collect(Collectors.toList());
                return ResponseEntity.ok(new ApiResponseData<>(res));
        }

        public ResponseEntity getAnswer(String generateId,Integer studentId) {
                List<ExerciseAnswer> result = exerciseAnswerRepository.findAllByGenerateIdOrderByNoIndex(generateId);
                StudentExerciseAnswer findByGenerateId = studentExerciseAnswerRepository.findByGenerateIdAndStudentId(generateId,studentId);
                String[] splitAnswer = findByGenerateId.getAnswer().split(",");
                List<String> answers = Arrays.asList(splitAnswer);
                CheckAnswerResponse answerResponses = new CheckAnswerResponse();

                answerResponses.setResultAnswer(ResultAnswer.builder()
                                .rightAnswer(0)
                                .wrongAnswer(0)
                                .build());

                IntStream.range(0, answers.size()).forEach(idx -> {
                        ExerciseAnswer res = result.get(idx);
                        String answer = answers.get(idx);

                        fillAnswerResponse(res, answer, answerResponses.getExercises(),
                                        answerResponses.getResultAnswer());
                });
                return ResponseEntity.ok(new ApiResponseData<>(answerResponses));
        }

        private Boolean checkAnswerStundent(String answer, String yourAnswer, ResultAnswer resultAnswer) {
                answer = answer.replace("\n", "");
                if (answer.trim().equals(yourAnswer.trim())) {
                        resultAnswer.setRightAnswer(resultAnswer.getRightAnswer() + 1);
                        return true;
                } else {
                        resultAnswer.setWrongAnswer(resultAnswer.getWrongAnswer() + 1);
                        return false;
                }
        }

        private void fillAnswerResponse(ExerciseAnswer res, String answer, List<QuestionExercises> answerResponses,
                        ResultAnswer resultAnswer) {
                answerResponses.add(QuestionExercises.builder()
                                .answer(res.getAnswer())
                                .yourAnswer(answer)
                                .noIndex(res.getNoIndex())
                                .generateId(res.getGenerateId())
                                .result(checkAnswerStundent(answer, res.getAnswer(), resultAnswer))
                                .question(res.getCode())
                                .build());
        }
}
