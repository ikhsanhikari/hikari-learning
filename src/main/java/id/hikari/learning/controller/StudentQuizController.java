package id.hikari.learning.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.payload.ApiResponseData;
import id.hikari.learning.payload.StudentQuizRequest;
import id.hikari.learning.payload.StudentQuizResponse;
import id.hikari.learning.repository.StudentQuizRepository;
import id.hikari.learning.service.QuizService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/student_quiz")
public class StudentQuizController {

    private final QuizService quizService;

    private final StudentQuizRepository studentQuizRepository;

    @PostMapping
    public ResponseEntity createStudentQuiz(@RequestBody StudentQuizRequest request) {
        return quizService.createStudentQuiz(request);
    }

    @GetMapping
    public ResponseEntity findAll() {
        return ResponseEntity.ok(new ApiResponseData<>(studentQuizRepository.findAll()));
    }

    @GetMapping("/quiz/{quizId}")
    public ResponseEntity findAllByQuiz(@PathVariable("quizId") Integer quizId) {
        return quizService.findAllStudentQuizByQuiz(quizId);
    }
}
