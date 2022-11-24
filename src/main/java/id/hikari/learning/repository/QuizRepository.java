package id.hikari.learning.repository;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import id.hikari.learning.model.Quiz;

public interface QuizRepository extends JpaRepository<Quiz, Integer> {

    List<Quiz> findAllByOrderByIdDesc();

}
