package id.hikari.learning.service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import id.hikari.learning.model.SelfExerciseAnswer;
import id.hikari.learning.model.StudentSelfExerciseAnswer;
import id.hikari.learning.payload.AnswerExerciseRequest;
import id.hikari.learning.payload.ApiResponseData;
import id.hikari.learning.payload.StundentResultAnswerResponse;
import id.hikari.learning.repository.SelfExerciseAnswerRepository;
import id.hikari.learning.repository.StudentSelfExerciseAnswerRepository;
import id.hikari.learning.security.UserPrincipal;
import id.hikari.learning.utils.UtilService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudentSelfExerciseAnswerService {
    private final StudentSelfExerciseAnswerRepository answerRepository;
    private final SelfExerciseAnswerRepository exerciseAnswerRepository;
    private final UtilService utilService;

    public ResponseEntity saveAnswer(AnswerExerciseRequest request, UserPrincipal principal) {
        List<SelfExerciseAnswer> result = exerciseAnswerRepository
                .findAllByGenerateIdOrderByNoIndex(request.getGenerateId());
        String[] splitAnswer = request.getAnswer().split(",");
        List<String> answers = Arrays.asList(splitAnswer);
        int rightAnswer = 0;
        int wrongAnswer = 0;

        for (int i = 0; i < answers.size(); i++) {
            SelfExerciseAnswer res = result.get(i);
            String answer = answers.get(i);
            if (answer.trim().equals(res.getAnswer().trim())) {
                rightAnswer++;
            } else {
                wrongAnswer++;
            }
        }

        StudentSelfExerciseAnswer res = answerRepository.save(StudentSelfExerciseAnswer.builder()
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
        List<StudentSelfExerciseAnswer> findAll = answerRepository.findAll();
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
}
