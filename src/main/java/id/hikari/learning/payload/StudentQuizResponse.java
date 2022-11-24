package id.hikari.learning.payload;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class StudentQuizResponse {
    private Integer id;
    private String studentName;
    private String studentEmail;
    private String quizName;
    private String description;
    private String answer;
    private String question;
    private Boolean doneQuiz;
    private String value;
    private String note;
}
