package id.hikari.learning.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import id.hikari.learning.model.SelfExercisePattern;

public interface SelfExercisePatternRepository extends JpaRepository<SelfExercisePattern, Integer> {
    List<SelfExercisePattern> findAllByExerciseId(Integer id);
}
