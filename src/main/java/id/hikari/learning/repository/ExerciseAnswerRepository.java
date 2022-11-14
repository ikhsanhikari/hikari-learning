package id.hikari.learning.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import id.hikari.learning.model.ExerciseAnswer;

public interface ExerciseAnswerRepository extends JpaRepository<ExerciseAnswer, Long> {

}
