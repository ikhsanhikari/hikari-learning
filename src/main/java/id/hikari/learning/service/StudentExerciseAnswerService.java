package id.hikari.learning.service;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import id.hikari.learning.model.ExerciseAnswer;
import id.hikari.learning.model.Quiz;
import id.hikari.learning.model.StudentExerciseAnswer;
import id.hikari.learning.model.StudentQuiz;
import id.hikari.learning.model.User;
import id.hikari.learning.payload.AnswerExerciseRequest;
import id.hikari.learning.payload.ApiResponseData;
import id.hikari.learning.payload.CountResponse;
import id.hikari.learning.payload.ListExerciseResponse;
import id.hikari.learning.payload.StudentProfileResponse;
import id.hikari.learning.payload.StundentResultAnswerResponse;
import id.hikari.learning.repository.ExerciseAnswerRepository;
import id.hikari.learning.repository.QuizRepository;
import id.hikari.learning.repository.SelfExerciseAnswerRepository;
import id.hikari.learning.repository.StudentExerciseAnswerRepository;
import id.hikari.learning.repository.StudentQuizRepository;
import id.hikari.learning.repository.StudentSelfExerciseAnswerRepository;
import id.hikari.learning.repository.UserRepository;
import id.hikari.learning.security.UserPrincipal;
import id.hikari.learning.utils.UtilService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudentExerciseAnswerService {
    private final StudentExerciseAnswerRepository answerRepository;
    private final ExerciseAnswerRepository exerciseAnswerRepository;
    private final SelfExerciseAnswerRepository selfExerciseAnswerRepository;
    private final StudentSelfExerciseAnswerRepository studentSelfExerciseAnswerRepository;
    private final UserRepository userRepository;
    private final UtilService utilService;
    private final QuizRepository quizRepository;
    private final StudentQuizRepository studentQuizRepository;

    public ResponseEntity saveAnswer(AnswerExerciseRequest request, UserPrincipal principal) {

        List<ExerciseAnswer> result = exerciseAnswerRepository
                .findAllByGenerateIdOrderByNoIndex(request.getGenerateId());
        String[] splitAnswer = request.getAnswer().split(",");
        List<String> answers = Arrays.asList(splitAnswer);
        int rightAnswer = 0;
        int wrongAnswer = 0;

        for (int i = 0; i < answers.size(); i++) {
            ExerciseAnswer res = result.get(i);
            String answer = answers.get(i);
            if (answer.trim().equals(res.getAnswer().trim())) {
                rightAnswer++;
            } else {
                wrongAnswer++;
            }
        }

        StudentExerciseAnswer res = answerRepository.save(StudentExerciseAnswer.builder()
                .answer(request.getAnswer())
                .generateId(request.getGenerateId())
                .studentId(Integer.parseInt(String.valueOf(principal.getId())))
                .rightAnswer(rightAnswer)
                .wrongAnswer(wrongAnswer)
                .build());
        return ResponseEntity.ok(new ApiResponseData<>(res));
    }

    public ResponseEntity findAllResult(UserPrincipal principal) {
        Integer id = Integer.parseInt(String.valueOf(principal.getId()));
        List<StudentExerciseAnswer> findAll = answerRepository.findAllByOrderByIdDesc();
        List<StundentResultAnswerResponse> list = findAll.stream().map(item -> {
            return StundentResultAnswerResponse.builder()
                    .answer(item.getAnswer())
                    .generateId(item.getGenerateId())
                    .studentName(item.getUser().getName())
                    .id(item.getId())
                    .studentEmail(item.getUser().getEmail())
                    .studentId(item.getStudentId())
                    .createdBy(item.getCreatedBy())
                    .build();
        })
                // .filter(i -> utilService.validateStudentOfInstructurOnly(id,
                // i.getCreatedBy()))
                .collect(Collectors.toList());
        return ResponseEntity.ok(new ApiResponseData<>(list));
    }

    private CountResponse getTotalExercise(Integer studentId) {
        List<ListExerciseResponse> findGroupByGenerateId = exerciseAnswerRepository.findGroupByGenerateId().stream()
                .filter(item -> utilService.validateInstructurOfStudentOnly(studentId, item.getCreatedBy()))
                .collect(Collectors.toList());
        return CountResponse.builder()
                .amount(Long.parseLong(String.valueOf(findGroupByGenerateId.size())))
                .build();
    }

    private CountResponse getTotalSelfExercise() {
        List<ListExerciseResponse> findGroupByGenerateId = selfExerciseAnswerRepository.findGroupByGenerateId();
        return CountResponse.builder()
                .amount(Long.parseLong(String.valueOf(findGroupByGenerateId.size())))
                .build();
    }

    private final CountResponse getQuizFinished(Integer studentId) {
        List<StudentQuiz> findAll = studentQuizRepository.findAllByStudentId(studentId);
        return CountResponse.builder()
                .amount(Long.parseLong(String.valueOf(findAll.size())))
                .build();
    }

    private CountResponse getTotalQuiz(Integer studentId) {
        List<Quiz> collect = quizRepository.findAll().stream()
                .filter(item -> utilService.validateInstructurOfStudentOnly(studentId, item.getCreatedBy()))
                .collect(Collectors.toList());
        return CountResponse.builder()
                .amount(Long.parseLong(String.valueOf(collect.size())))
                .build();
    }

    public ResponseEntity profileForInstructur(Integer studentId) {
        CountResponse countExercise = answerRepository.countExercise(studentId);
        CountResponse countSelfExercise = studentSelfExerciseAnswerRepository.countExercise(studentId);
        Optional<User> userOpt = userRepository.findById(studentId.longValue());
        User user = userOpt.get();

        return ResponseEntity.ok(StudentProfileResponse.builder()
                .exercise(countExercise != null ? countExercise : CountResponse.builder().amount(0L).build())
                .name(user.getName())
                .email(user.getEmail())
                .selfExercise(
                        countSelfExercise != null ? countSelfExercise : CountResponse.builder().amount(0L).build())
                .id(user.getId())
                .totalExercise(getTotalExercise(studentId))
                .totalSelfExercise(getTotalSelfExercise())
                .totalQuiz(getTotalQuiz(studentId))
                .quiz(getQuizFinished(studentId))
                .build());
    }
}
