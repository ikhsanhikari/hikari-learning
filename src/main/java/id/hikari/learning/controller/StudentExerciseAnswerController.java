package id.hikari.learning.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.payload.AnswerExerciseRequest;
import id.hikari.learning.security.CurrentUser;
import id.hikari.learning.security.UserPrincipal;
import id.hikari.learning.service.StudentExerciseAnswerService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/student_exercise_answer")
public class StudentExerciseAnswerController {

    private final StudentExerciseAnswerService answerService;

    @PostMapping("/")
    public ResponseEntity saveANswer(@RequestBody AnswerExerciseRequest req, @CurrentUser UserPrincipal principal) {

        return answerService.saveAnswer(req, principal);
    }

    @GetMapping("/")
    public ResponseEntity getNswer(@CurrentUser UserPrincipal principal) {
        return answerService.findAllResult(principal);
    }

    @GetMapping("/profile_for_instructur/{studentId}")
    public ResponseEntity getForProfile(@PathVariable("studentId") Integer studentId) {
        return answerService.profileForInstructur(studentId);
    }
}
