package _04_HospitalDatabase.entities;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity(name = "_04_diagnoses")
public class Diagnose {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 50)
    private String name;

    @Column(length = 1000)
    private String comment;

    @ManyToMany(mappedBy = "diagnoses")
    private Set<Patient> patients;

    public Diagnose() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Set<Patient> getPatients() {
        return patients;
    }

    public void setPatients(Set<Patient> patients) {
        this.patients = patients;
    }

    public Diagnose(String name) {
        this.name = name;
        this.patients = new HashSet<>();
    }
}
