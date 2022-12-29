package id.hikari.learning.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import id.hikari.learning.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByEmail(String email);

    Boolean existsByEmail(String email);

    Page<User> findAll(Pageable pageable);

    List<User> findAllByRoleOrderById(String role);

    Page<User> findAllByOrderByIdDesc(Pageable pageable);

    List<User> findAllByInstructurIdOrderByIdDesc( Integer instructurId);

}
