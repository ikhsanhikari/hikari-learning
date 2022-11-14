package id.hikari.learning.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.payload.PatternRequest;
import id.hikari.learning.service.PatternService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/pattern")
public class PatternController {
    private final PatternService patternService;

    @PostMapping("/")
    public ResponseEntity createPattern(@RequestBody PatternRequest patternRequest) {
        return patternService.createPattern(patternRequest);
    }

    @GetMapping("/")
    public ResponseEntity getAllPattern() {
        return patternService.getAllPattern();
    }
}
