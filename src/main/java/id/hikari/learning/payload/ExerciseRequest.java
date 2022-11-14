package id.hikari.learning.payload;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExerciseRequest {
    private String exerciseName;
    private String description;

    private List<PatternRequest> patterns;

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class PatternRequest {
        private Integer patternId;
        private Integer amount;
    }

}
