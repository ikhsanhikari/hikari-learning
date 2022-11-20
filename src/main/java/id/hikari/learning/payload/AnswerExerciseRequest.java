package id.hikari.learning.payload;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AnswerExerciseRequest {
    private String generateId;
    private String answer; 
    private Integer studentId;
}
