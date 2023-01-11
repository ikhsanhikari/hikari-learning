package id.hikari.learning.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import id.hikari.learning.model.Module;

public interface ModuleRepository extends JpaRepository<Module, Long> {
    List<Module> findAllByOrderByIdDesc();

}
