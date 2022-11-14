package id.hikari.learning.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import id.hikari.learning.feign.CLientApi;
import id.hikari.learning.feign.CodexRequest;
import id.hikari.learning.model.Exercise;
import id.hikari.learning.model.ExerciseAnswer;
import id.hikari.learning.model.ExercisePattern;
import id.hikari.learning.payload.ApiResponse;
import id.hikari.learning.payload.ApiResponseData;
import id.hikari.learning.payload.ExerciseForGenerate;
import id.hikari.learning.payload.ExerciseRequest;
import id.hikari.learning.payload.GenerateExerciseResponse;
import id.hikari.learning.repository.ExerciseAnswerRepository;
import id.hikari.learning.repository.ExercisePatternRepository;
import id.hikari.learning.repository.ExerciseRepository;
import id.hikari.learning.repository.PatternRepository;
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

        // private List<Map<String, String>> listPatternGlobal = new ArrayList<>();

        /**
         * @return
         */
        public ResponseEntity generateExerciseFromPattern(Integer id) {

                List<ExerciseForGenerate> exerciseForGenerates = getAllByExercise(id);
                UUID randomUUID = UUID.randomUUID();
                // flat map di gunakan untuk mengubah List list string menjadi list string
                List<GenerateExerciseResponse> result = exerciseForGenerates.stream().map(item -> {
                        return processGeneratePattern(item,randomUUID);
                }).flatMap(List::stream)
                                // artinya return stream dari list
                                // }).flatMap(a -> a.stream())
                                .collect(Collectors.toList());

                return ResponseEntity.ok(new ApiResponseData<>(result));
        }

        private List<GenerateExerciseResponse> processGeneratePattern(ExerciseForGenerate item, UUID randomUUID) {
                String result = "";
                List<String> patternResult = new ArrayList<>();
                for (int i = 0; i < item.getAmount(); i++) {
                        result = item.getPattern();
                        result = GeneralUtil.replace(result, StaticValue.VALUE);
                        result = GeneralUtil.replace(result, StaticValue.COMPARE);
                        result = GeneralUtil.replace(result, StaticValue.OPERATOR);
                        result = GeneralUtil.replace(result, StaticValue.OUTPUT);
                        patternResult.add(result);
                }
               
                List<GenerateExerciseResponse> resultResponse = patternResult.stream().map(i -> {
                        cekAnswer(i,randomUUID);
                        return GenerateExerciseResponse.builder()
                                        .pattern(i)
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
                                .map(Item -> {
                                        return ExerciseForGenerate.builder()
                                                        .amount(Item.getAmount())
                                                        .pattern(Item.getPattern().getPattern())
                                                        .build();
                                }).collect(Collectors.toList());
                return result;
        }

        public ResponseEntity getAllExercise() {
                List<Exercise> exercises = exerciseRepository.findAll();
                return ResponseEntity.ok(new ApiResponseData<>(exercises));
        }

        @Async
        public void cekAnswer(String code, UUID randomUUID) {
                CompletableFuture.supplyAsync(() -> {
                        Map<String, String> compile = cLientApi.compile(
                                        CodexRequest.builder()
                                                        .code(code)
                                                        .input("hallo ")
                                                        .language("java")
                                                        .build());
                        compile.put("code", code);
                        // listPatternGlobal.add(compile);

                        return compile;
                }).thenAccept((item) -> {
                        exerciseAnswerRepository.save(ExerciseAnswer.builder()
                                        .answer(item.get("output"))
                                        .code(code)
                                        .generateId(randomUUID.toString())
                                        .build());
                        log.info("Finish Compile for getting an answer");
                        log.info("output :{}", item.get("output") == null ? item.get("error") : item.get("output"));
                });

        }

        public ResponseEntity getExerciseAnswer() {
                return ResponseEntity.ok(exerciseAnswerRepository.findAll());
        }
}
