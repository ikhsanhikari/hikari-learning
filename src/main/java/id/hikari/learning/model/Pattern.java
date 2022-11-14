package id.hikari.learning.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author Ikhsan
 */
@Entity
@Table(name = "pattern")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Pattern extends Auditable<String> implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Lob
    @Column(name = "pattern")
    private String pattern;
    @Column(name = "course_level")
    private String courseLevel;
    @Column(name = "course_type")
    private String courseType;

    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "pattern", fetch = FetchType.EAGER)
    private List<ExercisePattern> exercisePatternList;

}