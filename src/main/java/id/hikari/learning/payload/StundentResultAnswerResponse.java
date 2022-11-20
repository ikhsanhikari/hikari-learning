package id.hikari.learning.payload;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class StundentResultAnswerResponse {
    private Integer id;
    private String generateId;
    private String studentName;
    private String studentEmail;
    private String answer;
    private Integer studentId;

}
