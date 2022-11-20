package id.hikari.learning.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import id.hikari.learning.model.StudentExerciseAnswer;
import id.hikari.learning.payload.AnswerExerciseRequest;
import id.hikari.learning.payload.ApiResponseData;
import id.hikari.learning.payload.StundentResultAnswerResponse;
import id.hikari.learning.repository.StudentExerciseAnswerRepository;
import id.hikari.learning.security.UserPrincipal;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudentExerciseAnswerService {
    private final StudentExerciseAnswerRepository answerRepository;
    private List<StundentResultAnswerResponse> collect;
    // private final ExerciseAnswerRepository exerciseAnswerRepository;

    public ResponseEntity saveAnswer(AnswerExerciseRequest request, UserPrincipal principal) {
        // List<ExerciseAnswer> result =
        // exerciseAnswerRepository.findAllByGenerateIdOrderByNoIndex(generateId);

        StudentExerciseAnswer res = answerRepository.save(StudentExerciseAnswer.builder()
                .answer(request.getAnswer())
                .generateId(request.getGenerateId())
                .studentId(Integer.parseInt(String.valueOf(principal.getId())))
                .build());
        return ResponseEntity.ok(new ApiResponseData<>(res));
    }

    public ResponseEntity findAllResult() {
        List<StudentExerciseAnswer> findAll = answerRepository.findAll();
        List<StundentResultAnswerResponse> list = findAll.stream().map(item -> {
            return StundentResultAnswerResponse.builder()
                    .answer(item.getAnswer())
                    .generateId(item.getGenerateId())
                    .studentName(item.getUser().getName())
                    .id(item.getId())
                    .studentEmail(item.getUser().getEmail())
                    .studentId(item.getStudentId())
                    .build();
        }).collect(Collectors.toList());
        return ResponseEntity.ok(new ApiResponseData<>(list));
    }
}
