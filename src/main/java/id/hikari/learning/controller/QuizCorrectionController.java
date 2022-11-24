package id.hikari.learning.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.payload.ApiResponseData;
import id.hikari.learning.payload.QuizCorrectionRequest;
import id.hikari.learning.repository.QuizCorrectionRepository;
import id.hikari.learning.security.CurrentUser;
import id.hikari.learning.security.UserPrincipal;
import id.hikari.learning.service.QuizService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/quiz_correction")
public class QuizCorrectionController {
    private final QuizService quizService;

    private final QuizCorrectionRepository correctionRepository;

    @PostMapping("")
    public ResponseEntity createQuiz(@RequestBody QuizCorrectionRequest request) {
        return quizService.createQuizCorrection(request);
    }

    @GetMapping("")
    public ResponseEntity findAllQuiz() {
        return ResponseEntity.ok(new ApiResponseData<>(correctionRepository.findAll()));
    }

    @GetMapping("/student_quiz/{studentQuizId}")
    public ResponseEntity findAllQuizCorrectionByStudentQuizId(@PathVariable("studentQuizId") Integer studentQuizId) {
        return ResponseEntity.ok(new ApiResponseData<>(correctionRepository.findByStudentQuizId(studentQuizId)));
    }

    @GetMapping("/quiz/result")
    public ResponseEntity findQuizResult(@CurrentUser UserPrincipal principal) {
        return quizService.getQuizResult(principal.getId());
    }
}
