package id.hikari.learning.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import id.hikari.learning.model.StudentExerciseAnswer;
import id.hikari.learning.payload.CountResponse;

public interface StudentExerciseAnswerRepository extends JpaRepository<StudentExerciseAnswer, Integer> {
    StudentExerciseAnswer findByGenerateIdAndStudentId(String generateId, Integer studentId);

    @Query("select new  id.hikari.learning.payload.CountResponse(count(a)) from StudentExerciseAnswer a where a.studentId =:studentId group by a.studentId")
    CountResponse countExercise(Integer studentId);

    List<StudentExerciseAnswer> findAllByOrderByIdDesc();
}
