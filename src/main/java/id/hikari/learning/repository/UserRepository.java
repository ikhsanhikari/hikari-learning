package id.hikari.learning.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import id.hikari.learning.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByEmail(String email);

    Boolean existsByEmail(String email);

    Page<User> findAll(Pageable pageable);

    List<User> findAllByRoleOrderById(String role);

    Page<User> findAllByOrderByIdDesc(Pageable pageable);

    List<User> findAllByInstructurIdOrderByIdDesc(Integer instructurId);

    @Query(value = "SELECT id,name,email,CONVERT(CONCAT(("
    + " SELECT count(*) FROM student_quiz sq WHERE sq.student_id=u.id GROUP BY u.id),' FROM ',("
    + "SELECT count(*) FROM quiz sq WHERE sq.created_by=  ?1  GROUP BY u.id)),varchar(50)) quiz, convert(CONCAT(("
    + "SELECT count(*) FROM student_exercise_answer sq WHERE sq.student_id=u.id GROUP BY u.id),' FROM ',("
    + "SELECT count(*) AS total_exercise FROM ("
    + "SELECT ea.generate_id FROM exercise_answer ea INNER JOIN users u ON ea.created_by=u.id WHERE u.id= ?1   GROUP BY ea.generate_id) a)),varchar(50)) exercise,CONVERT(CONCAT(("
    + "SELECT count(*) FROM student_self_exercise_answer sq WHERE sq.student_id=u.id GROUP BY u.id),' FROM ',("
    + "SELECT count(*) AS total_self_exercise FROM ("
    + "SELECT ea.generate_id FROM self_exercise_answer ea GROUP BY ea.generate_id) a)),varchar(50)) self_exercise FROM users u "
            + "WHERE u.instructur in (select instructur from users where instructur = ?1)", nativeQuery = true)
    List<ResponseReportStudent> getReportStudent(Integer instructur);

}
