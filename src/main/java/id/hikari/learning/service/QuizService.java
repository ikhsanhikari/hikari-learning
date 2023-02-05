package id.hikari.learning.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import id.hikari.learning.model.Quiz;
import id.hikari.learning.model.QuizCorrection;
import id.hikari.learning.model.StudentQuiz;
import id.hikari.learning.payload.ApiResponse;
import id.hikari.learning.payload.ApiResponseData;
import id.hikari.learning.payload.DetailCorrectionDto;
import id.hikari.learning.payload.QuizCorrectionRequest;
import id.hikari.learning.payload.QuizForInstructurResponse;
import id.hikari.learning.payload.QuizRequest;
import id.hikari.learning.payload.QuizResultResponse;
import id.hikari.learning.payload.StudentQuizRequest;
import id.hikari.learning.payload.StudentQuizResponse;
import id.hikari.learning.repository.QuizCorrectionRepository;
import id.hikari.learning.repository.QuizRepository;
import id.hikari.learning.repository.StudentQuizRepository;
import id.hikari.learning.security.UserPrincipal;
import id.hikari.learning.utils.GeneralUtil;
import id.hikari.learning.utils.UtilService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class QuizService {
    private final QuizRepository quizRepository;

    private final StudentQuizRepository studentQuizRepository;

    private final QuizCorrectionRepository correctionRepository;

    private final UtilService utilService;

    public ResponseEntity createQuiz(QuizRequest request) {
        quizRepository.save(Quiz.builder()
                .question(request.getQuestion())
                .quizName(request.getQuizName())
                .description(request.getDescription())
                .longQuizTimer(request.getLongQuizTimer())
                .id(request.getId())
                .build());
        return ResponseEntity.ok(new ApiResponse("Success create quiz"));
    }

    public ResponseEntity createStudentQuiz(StudentQuizRequest request) {
        Optional<StudentQuiz> exist = studentQuizRepository.findByStudentIdAndQuizId(request.getStudentId(),
                request.getQuizId());
        System.out.println(exist.isPresent());
        if (!exist.isPresent()) {
            studentQuizRepository.save(StudentQuiz.builder()
                    .answer(request.getAnswer())
                    .quizId(request.getQuizId())
                    .studentId(request.getStudentId())
                    .build());
            return ResponseEntity.ok(new ApiResponse("Success to answered quiz!"));
        }
        return ResponseEntity.ok(new ApiResponse("Student quiz is exist!"));

    }

    public ResponseEntity createQuizCorrection(QuizCorrectionRequest request) {
        QuizCorrection exist = correctionRepository.findByStudentQuizId(request.getStudentQuizId()).orElse(null);
        System.out.println(exist);
        if (exist != null) {
            exist.setNote(request.getNote());
            exist.setValue(request.getValue());
            correctionRepository.save(exist);
        } else {
            correctionRepository.save(QuizCorrection.builder()
                    .note(request.getNote())
                    .value(request.getValue())
                    .studentQuizId(request.getStudentQuizId())
                    .build());
        }

        return ResponseEntity.ok(new ApiResponse("Success to correction quiz!"));
    }

    public ResponseEntity getStudentQuizByQuizId(Integer quizId) {
        return ResponseEntity.ok(new ApiResponseData<>(studentQuizRepository.findAllByQuizId(quizId)));
    }

    public ResponseEntity getAllQuizForInstructur(UserPrincipal principal) {

        List<QuizForInstructurResponse> collect = quizRepository.findAllByOrderByIdDesc().stream().map(item -> {

            return QuizForInstructurResponse.builder()
                    .quizName(item.getQuizName())
                    .description(item.getDescription())
                    .id(item.getId())
                    .createdBy(item.getCreatedBy())
                    .studentFinish(countStudentFinish(item.getId()).getCountFinishStudent())
                    .corrected(countStudentFinish(item.getId()).getFinishCorrection())
                    .notCorrectedYet(countStudentFinish(item.getId()).getNotFinishYetCorrection())
                    .createdDate(GeneralUtil.getDateFormat(item.getCreationDate()))
                    .build();
        })
                .filter(i -> utilService.onlyOwnInstructur(principal.getId(), i.getCreatedBy()))
                .collect(Collectors.toList());
        return ResponseEntity.ok(new ApiResponseData<>(collect));
    }

    private DetailCorrectionDto countStudentFinish(Integer quzId) {
        List<StudentQuiz> findAllByQuizId = studentQuizRepository.findAllByQuizId(quzId);
        Integer countFinishStudent = findAllByQuizId.size();

        Integer finishCorection = findAllByQuizId.stream().filter(item -> {
            return checkQuizIsCorrection(item.getId());
        }).collect(Collectors.toList()).size();

        return DetailCorrectionDto.builder()
                .finishCorrection(finishCorection)
                .countFinishStudent(countFinishStudent)
                .notFinishYetCorrection(countFinishStudent - finishCorection)
                .build();
    }

    public ResponseEntity getAllQuiz(Integer studentId) {
        List<Quiz> collect = quizRepository.findAll().stream().filter(item -> {
            return checkQuizIsDone(studentId, item.getId());
        }).filter(item -> utilService.validateInstructurOfStudentOnly(studentId, item.getCreatedBy()))
                .collect(Collectors.toList());
        return ResponseEntity.ok(new ApiResponseData<>(collect));
    }

    public ResponseEntity getAllQuizResult(Integer studentId) {
        List<Quiz> collect = quizRepository.findAll().stream().filter(item -> {
            return !checkQuizIsDone(studentId, item.getId());
        }).collect(Collectors.toList());
        return ResponseEntity.ok(new ApiResponseData<>(collect));
    }

    public Boolean checkQuizIsDone(Integer studentId, Integer quizId) {
        Optional<StudentQuiz> exist = studentQuizRepository.findByStudentIdAndQuizId(studentId, quizId);
        if (exist.isPresent()) {
            return false;
        }
        return true;
    }

    public List<StudentQuizResponse> getStudentQuizByQuiz(Integer quizId) {
        return studentQuizRepository.findAllByQuizId(quizId).stream()
                .map((item) -> StudentQuizResponse.builder()
                        .id(item.getId())
                        .quizName(item.getQuiz().getQuizName())
                        .description(item.getQuiz().getDescription())
                        .answer(item.getAnswer())
                        .studentName(item.getUser().getName())
                        .studentEmail(item.getUser().getEmail())
                        .question(item.getQuiz().getQuestion())
                        .doneQuiz(checkQuizIsCorrection(item.getId()))
                        .value(getNoteAndValue(item.getId()).getValue())
                        .note(getNoteAndValue(item.getId()).getNote())
                        .build())
                .collect(Collectors.toList());
    }

    public ResponseEntity findAllStudentQuizByQuiz(Integer quizId) {
        return ResponseEntity.ok(new ApiResponseData<>(
                getStudentQuizByQuiz(quizId)));
    }

    private QuizCorrection getNoteAndValue(Integer id) {
        Optional<QuizCorrection> data = correctionRepository.findByStudentQuizId(id);
        if (data.isPresent()) {
            return data.get();
        }
        return QuizCorrection.builder()
                .value("-")
                .note("-")
                .build();
    }

    private Boolean checkQuizIsCorrection(Integer studentQuizId) {
        Optional<QuizCorrection> exist = correctionRepository.findByStudentQuizId(studentQuizId);
        if (exist.isPresent()) {
            return true;
        }
        return false;
    }

    public ResponseEntity getQuizResult(Long studentId) {
        List<QuizResultResponse> result = correctionRepository.findQuizResult(studentId);
        return ResponseEntity.ok(new ApiResponseData<>(result));
    }
}
