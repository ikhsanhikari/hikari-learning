package id.hikari.learning.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import id.hikari.learning.model.SelfExercise;

public interface SelfExerciseRepository extends JpaRepository<SelfExercise, Integer> {

    List<SelfExercise> findAllByOrderByIdDesc();

}
