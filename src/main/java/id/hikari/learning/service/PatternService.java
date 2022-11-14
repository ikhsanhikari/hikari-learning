package id.hikari.learning.service;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import id.hikari.learning.model.Pattern;
import id.hikari.learning.payload.ApiResponse;
import id.hikari.learning.payload.ApiResponseData;
import id.hikari.learning.payload.PatternRequest;
import id.hikari.learning.repository.PatternRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PatternService {

    private final PatternRepository patternRepository;

    public ResponseEntity createPattern(PatternRequest patternRequest) {
        patternRepository.save(
                Pattern.builder()
                        .pattern(patternRequest.getPattern())
                        .courseLevel(patternRequest.getCourseLevel())
                        .courseType(patternRequest.getCourseType())
                        .build());
        return ResponseEntity.ok(new ApiResponse("pattern created!"));
    }

    public ResponseEntity getAllPattern() {
        List<Pattern> patterns = patternRepository.findAll();
        return ResponseEntity.ok(new ApiResponseData<>(patterns));
    }

}
