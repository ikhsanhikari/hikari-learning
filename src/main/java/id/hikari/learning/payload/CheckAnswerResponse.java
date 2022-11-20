package id.hikari.learning.payload;

import java.util.ArrayList;
import java.util.List;

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
public class CheckAnswerResponse {

    private ResultAnswer resultAnswer;
    private List<QuestionExercises> exercises = new ArrayList<>();

    @Setter
    @Getter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class QuestionExercises {
        private Integer noIndex;
        private String generateId;
        private String yourAnswer;
        private String question;
        private String answer;
        private Boolean result;
    }

    @Setter
    @Getter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class ResultAnswer {
        private Integer rightAnswer;
        private Integer wrongAnswer;
    }
}
