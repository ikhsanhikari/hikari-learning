package id.hikari.learning.payload;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class StudentProfileResponse {
    private Long id;
    private String name;
    private String email;
    private CountResponse exercise;
    private CountResponse selfExercise;
    private CountResponse totalExercise;
    private CountResponse totalSelfExercise;
    private CountResponse totalQuiz;
    private CountResponse quiz;
}
