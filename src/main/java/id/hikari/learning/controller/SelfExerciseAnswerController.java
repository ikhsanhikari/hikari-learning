package id.hikari.learning.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.service.SelfExerciseService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/self_exercise_answer")
public class SelfExerciseAnswerController {

    private final SelfExerciseService exerciseService;

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
