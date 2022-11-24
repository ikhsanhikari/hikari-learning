package id.hikari.learning.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import id.hikari.learning.model.StudentQuiz;

public interface StudentQuizRepository extends JpaRepository<StudentQuiz, Integer> {

    List<StudentQuiz> findAllByQuizId(Integer quizId);

    Optional<StudentQuiz> findByStudentIdAndQuizId(Integer studentId, Integer quizId);

}
