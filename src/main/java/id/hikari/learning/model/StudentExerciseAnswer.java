package id.hikari.learning.model;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "student_exercise_answer")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class StudentExerciseAnswer extends Auditable<String> implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(unique = true)
    private String generateId;
    private String answer;
    @Column(name = "student_id")
    private Integer studentId;
    @ManyToOne
    @JoinColumn(name = "student_id", referencedColumnName = "id", insertable = false, updatable = false)
    private User user;
}
