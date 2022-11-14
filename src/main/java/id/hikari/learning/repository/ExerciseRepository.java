package id.hikari.learning.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import id.hikari.learning.model.Exercise;

public interface ExerciseRepository extends JpaRepository<Exercise, Integer> {

}
