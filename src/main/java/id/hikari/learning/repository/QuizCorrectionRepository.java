package id.hikari.learning.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import id.hikari.learning.model.QuizCorrection;
import id.hikari.learning.payload.QuizResultResponse;

public interface QuizCorrectionRepository extends JpaRepository<QuizCorrection, Integer> {

    Optional<QuizCorrection> findByStudentQuizId(Integer studentQuizId);

    @Query(value = "select new id.hikari.learning.payload.QuizResultResponse(d.name,c.quizName,b.answer,c.question,a.value,a.note) from QuizCorrection a inner join StudentQuiz b on a.studentQuizId=b.id inner join Quiz c on b.quizId=c.id inner join User d on d.id = b.studentId where d.id = :studentId")
    List<QuizResultResponse> findQuizResult(Long studentId);

}
