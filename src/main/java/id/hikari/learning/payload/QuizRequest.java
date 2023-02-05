package id.hikari.learning.payload;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class QuizRequest {
    private Integer id;
    private String quizName;
    private String question;
    private String description;
    private Integer longQuizTimer;
}
