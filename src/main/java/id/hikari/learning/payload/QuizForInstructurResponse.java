package id.hikari.learning.payload;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class QuizForInstructurResponse {
    private Integer id;
    private String quizName;
    private String description;
    private String createdBy;
    private Integer studentFinish;
    private Integer corrected;
    private Integer notCorrectedYet;
    private String createdDate;
}
