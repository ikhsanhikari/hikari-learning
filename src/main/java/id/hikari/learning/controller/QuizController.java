package id.hikari.learning.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.payload.ApiResponseData;
import id.hikari.learning.payload.QuizRequest;
import id.hikari.learning.repository.QuizRepository;
import id.hikari.learning.security.CurrentUser;
import id.hikari.learning.security.UserPrincipal;
import id.hikari.learning.service.QuizService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/quiz")
public class QuizController {
    private final QuizService quizService;

    private final QuizRepository quizRepository;

    @PostMapping("")
    public ResponseEntity createQuiz(@RequestBody QuizRequest quizRequest) {
        return quizService.createQuiz(quizRequest);
    }

    @GetMapping("")
    public ResponseEntity findAllQuiz(@CurrentUser UserPrincipal principal) {
        return quizService.getAllQuiz(Integer.valueOf(principal.getId().intValue()));
    }

    @GetMapping("/instructur")
    public ResponseEntity findAllQuizForInstructur(@CurrentUser UserPrincipal principal) {
        return quizService.getAllQuizForInstructur(principal);
    }

    @GetMapping("/result")
    public ResponseEntity findAllResultQuiz(@CurrentUser UserPrincipal principal) {
        return quizService.getAllQuizResult(Integer.valueOf(principal.getId().intValue()));
    }

    @GetMapping("/{id}")
    public ResponseEntity findByIdQuiz(@PathVariable("id") Integer id) {
        return ResponseEntity.ok(new ApiResponseData<>(quizRepository.findById(id).orElse(null)));
    }
}
