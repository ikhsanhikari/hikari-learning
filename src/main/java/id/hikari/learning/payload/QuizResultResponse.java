package id.hikari.learning.payload;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class QuizResultResponse {
    private String studentName;
    private String quizName;
    private String answer;
    private String question;
    private String value;
    private String note;
}
