package id.hikari.learning.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import id.hikari.learning.model.SelfExerciseAnswer;
import id.hikari.learning.payload.ListExerciseResponse;

public interface SelfExerciseAnswerRepository extends JpaRepository<SelfExerciseAnswer, Long> {
    List<SelfExerciseAnswer> findAllByGenerateIdOrderByNoIndex(String generateId);

    @Query(value = "select new id.hikari.learning.payload.ListExerciseResponse(e.exerciseName,ea.generateId,e.description,COUNT(ea),ea.createdBy,ea.creationDate) from SelfExerciseAnswer ea join SelfExercise e on ea.exerciseId=e.id group by ea.generateId order by ea.creationDate desc")
    List<ListExerciseResponse> findGroupByGenerateId();

}
