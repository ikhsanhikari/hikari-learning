package id.hikari.learning.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import id.hikari.learning.model.StudentExerciseAnswer;

public interface StudentExerciseAnswerRepository extends JpaRepository<StudentExerciseAnswer, Integer> {
    StudentExerciseAnswer findByGenerateIdAndStudentId(String generateId,Integer studentId);
}
