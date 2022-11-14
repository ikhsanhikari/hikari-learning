package id.hikari.learning.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import id.hikari.learning.model.Pattern;

public interface PatternRepository extends JpaRepository<Pattern, Integer> {

}
