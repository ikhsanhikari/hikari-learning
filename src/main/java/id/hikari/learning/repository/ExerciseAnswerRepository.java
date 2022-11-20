package id.hikari.learning.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import id.hikari.learning.model.ExerciseAnswer;
import id.hikari.learning.payload.ListExerciseResponse;

public interface ExerciseAnswerRepository extends JpaRepository<ExerciseAnswer, Long> {
    List<ExerciseAnswer> findAllByGenerateIdOrderByNoIndex(String generateId);

    @Query(value = "select new id.hikari.learning.payload.ListExerciseResponse(e.exerciseName,ea.generateId,e.description,COUNT(ea)) from ExerciseAnswer ea join Exercise e on ea.exerciseId=e.id group by ea.generateId order by ea.creationDate desc")
    List<ListExerciseResponse> findGroupByGenerateId();

}
