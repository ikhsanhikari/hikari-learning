package id.hikari.learning.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.payload.ExerciseRequest;
import id.hikari.learning.service.ExerciseService;
import lombok.RequiredArgsConstructor;

@RequestMapping("/exercise")
@RestController
@RequiredArgsConstructor
public class ExerciseController {

    private final ExerciseService exerciseService;

    @GetMapping("/{id}")
    public ResponseEntity generateExerciseFromPattern(@PathVariable("id") Integer id) {
        return exerciseService.generateExerciseFromPattern(id);
    }

    @GetMapping("/")
    public ResponseEntity getAllExercise() {
        return exerciseService.getAllExercise();
    }

    @PostMapping("/")
    public ResponseEntity create(@RequestBody ExerciseRequest exerciseRequest) {
        return exerciseService.createExercise(exerciseRequest);
    }

    @GetMapping("/answer")
    public ResponseEntity answer() {
        return exerciseService.getExerciseAnswer();
    }

}
