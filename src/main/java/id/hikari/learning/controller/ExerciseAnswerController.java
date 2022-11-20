package id.hikari.learning.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.security.CurrentUser;
import id.hikari.learning.security.UserPrincipal;
import id.hikari.learning.service.ExerciseService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/exercise_answer")
public class ExerciseAnswerController {

    private final ExerciseService exerciseService;

    @GetMapping("/{generateId}")
    public ResponseEntity getByGenerateId(@PathVariable("generateId") String generateId) {
        return exerciseService.getExerciseAnswerByGenerateId(generateId);
    }

    @GetMapping("/check/{generateId}/{userId}")
    public ResponseEntity checkAnswer(@PathVariable("generateId") String generateId,
            @PathVariable("userId") Integer studentId) {
        return exerciseService.getAnswer(generateId, studentId);
    }
}
