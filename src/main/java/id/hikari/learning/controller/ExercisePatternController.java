package id.hikari.learning.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.service.PatternService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/exercise_pattern")
public class ExercisePatternController {
    private final PatternService patternService;

    @GetMapping("")
    public ResponseEntity getExercisePattern(@RequestParam("exerciseId") Integer exerciseId) {
        return patternService.getExercisePatternByExercise(exerciseId);
    }
}
