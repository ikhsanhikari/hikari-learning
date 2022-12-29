package id.hikari.learning.payload;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ListExerciseCheckDoneResponse {
    private String exerciseName;
    private String generateId;
    private String description;
    private Long amount;
    private Boolean isDone;
    private String createdBy;
    private Date createdDate;
}
