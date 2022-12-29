package id.hikari.learning.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.payload.AnswerExerciseRequest;
import id.hikari.learning.security.CurrentUser;
import id.hikari.learning.security.UserPrincipal;
import id.hikari.learning.service.StudentSelfExerciseAnswerService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/student_self_exercise_answer")
public class StudentSelfExerciseAnswerController {

    private final StudentSelfExerciseAnswerService answerService;

    @PostMapping("/")
    public ResponseEntity saveANswer(@RequestBody AnswerExerciseRequest req, @CurrentUser UserPrincipal principal) {

        return answerService.saveAnswer(req, principal);
    }

    @GetMapping("/")
    public ResponseEntity saveANswer(@CurrentUser UserPrincipal principal) {
        return answerService.findAllResult(principal);
    }

}
