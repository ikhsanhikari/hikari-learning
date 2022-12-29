package id.hikari.learning.service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import id.hikari.learning.feign.CLientApi;
import id.hikari.learning.feign.CodexRequest;
import id.hikari.learning.model.Pattern;
import id.hikari.learning.payload.ApiResponse;
import id.hikari.learning.payload.ApiResponseData;
import id.hikari.learning.payload.CreatePatternResponse;
import id.hikari.learning.payload.LovResponse;
import id.hikari.learning.payload.PatternRequest;
import id.hikari.learning.repository.ExercisePatternRepository;
import id.hikari.learning.repository.PatternRepository;
import id.hikari.learning.repository.SelfExercisePatternRepository;
import id.hikari.learning.utils.GeneralUtil;
import id.hikari.learning.utils.StaticValue;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PatternService {

    private final PatternRepository patternRepository;
    private final ExercisePatternRepository exercisePatternRepository;
    private final SelfExercisePatternRepository selfExercisePatternRepository;
    private final CLientApi cLientApi;

    @Value("${app.language}")
    public String language;

    private String modifyCode(String code) {
        String result = code;
        result = GeneralUtil.replace(result, StaticValue.VALUE);
        result = GeneralUtil.replace(result, StaticValue.COMPARE);
        result = GeneralUtil.replace(result, StaticValue.OPERATOR);
        result = GeneralUtil.replace(result, StaticValue.OUTPUT);
        result = GeneralUtil.replace(result, StaticValue.LOGIC);
        return result;
    }

    public ResponseEntity createPattern(PatternRequest patternRequest) {
        patternRepository.save(
                Pattern.builder()
                        .pattern(patternRequest.getPattern())
                        .courseLevel(patternRequest.getCourseLevel())
                        .courseType(patternRequest.getCourseType())
                        .build());
        return ResponseEntity.ok(new ApiResponse("success save pattern"));
    }

    public ResponseEntity executePattern(PatternRequest patternRequest) {

        String code = modifyCode(patternRequest.getPattern());
        Map<String, String> compile = cLientApi.compile(
                CodexRequest.builder()
                        .code(code)
                        .language(language)
                        .build());
        compile.put("code", code);

        return ResponseEntity.ok(new ApiResponseData<>(
                CreatePatternResponse.builder()
                        .patternResult(code)
                        .output(compile.get("output"))
                        .error(compile.get("error"))
                        .build()));
    }

    public ResponseEntity getAllPattern() {
        List<Pattern> patterns = patternRepository.findAllByOrderByIdDesc();
        return ResponseEntity.ok(new ApiResponseData<>(patterns));
    }

    public ResponseEntity getAllPatternLov() {
        List<Pattern> patterns = patternRepository.findAllByOrderByIdDesc();
        List<LovResponse> collect = patterns.stream().map((item) -> LovResponse.builder()
                .label(item.getPattern())
                .value(item.getId())
                .build())
                .collect(Collectors.toList());
        return ResponseEntity.ok(new ApiResponseData<>(collect));
    }

    public ResponseEntity getExercisePatternByExercise(Integer id) {
        return ResponseEntity.ok(exercisePatternRepository.findAllByExerciseId(id));
    }

    public ResponseEntity getSelfExercisePatternByExercise(Integer id) {
        return ResponseEntity.ok(selfExercisePatternRepository.findAllByExerciseId(id));
    }

}
