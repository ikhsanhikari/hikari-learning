package id.hikari.learning.model;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
import lombok.ToString;

/**
 *
 * @author Ikhsan
 */

@Entity
@Table(name = "exercise_pattern")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExercisePattern extends Auditable<String> implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "amount")
    private Integer amount;
    // @Column(name = "exercise_id")
    // private Integer exerciseId;
    // @Column(name = "pattern_id")
    // private Integer patternId;
    @ToString.Exclude
    @JoinColumn(name = "pattern_id", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Pattern pattern;
    @ToString.Exclude
    @JoinColumn(name = "exercise_id", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Exercise exercise;

}
