package id.hikari.learning.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import id.hikari.learning.model.ExercisePattern;

public interface ExercisePatternRepository extends JpaRepository<ExercisePattern, Integer> {
    List<ExercisePattern> findAllByExerciseId(Integer id);
}
