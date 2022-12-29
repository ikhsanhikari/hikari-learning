package id.hikari.learning.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import id.hikari.learning.model.StudentSelfExerciseAnswer;
import id.hikari.learning.payload.CountResponse;

public interface StudentSelfExerciseAnswerRepository extends JpaRepository<StudentSelfExerciseAnswer, Integer> {
    StudentSelfExerciseAnswer findByGenerateIdAndStudentId(String generateId, Integer studentId);
    @Query("select new  id.hikari.learning.payload.CountResponse(count(a)) from StudentSelfExerciseAnswer a where a.studentId =:studentId group by a.studentId")
    CountResponse countExercise(Integer studentId);
}
