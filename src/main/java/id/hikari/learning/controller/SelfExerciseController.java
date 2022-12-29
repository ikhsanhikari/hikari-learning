package id.hikari.learning.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.payload.ExerciseRequest;
import id.hikari.learning.security.CurrentUser;
import id.hikari.learning.security.UserPrincipal;
import id.hikari.learning.service.SelfExerciseService;
import lombok.RequiredArgsConstructor;

@RequestMapping("/self_exercise")
@RestController
@RequiredArgsConstructor
public class SelfExerciseController {

    private final SelfExerciseService exerciseService;

    @GetMapping("/{id}")
    public ResponseEntity generateExerciseFromPattern(@PathVariable("id") Integer id) {
        return exerciseService.generateExerciseFromPattern(id);
    }

    @GetMapping("/")
    public ResponseEntity getAllExercise(@CurrentUser UserPrincipal principal) {
        return exerciseService.getAllExercise(principal);
    }

    @GetMapping("/self")
    public ResponseEntity getAllSelfExercise(@CurrentUser UserPrincipal principal) {
        return exerciseService.getExerciseAnswer(principal, true);
    }

    @PostMapping("/")
    public ResponseEntity create(@RequestBody ExerciseRequest exerciseRequest) {
        return exerciseService.createExercise(exerciseRequest);
    }

    @GetMapping("/answer")
    public ResponseEntity answer(@CurrentUser UserPrincipal principal) {
        return exerciseService.getExerciseAnswer(principal, false);
    }

}
