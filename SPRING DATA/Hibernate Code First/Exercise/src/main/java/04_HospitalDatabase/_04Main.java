package _04_HospitalDatabase;

import _04_HospitalDatabase.entities.Diagnose;
import _04_HospitalDatabase.entities.Medicament;
import _04_HospitalDatabase.entities.Patient;
import _04_HospitalDatabase.entities.Visitation;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.time.LocalDate;

public class _04Main {
    public static void main(String[] args) {

        EntityManagerFactory emf =
                Persistence.createEntityManagerFactory("Code-First");
        EntityManager entityManager = emf.createEntityManager();

        entityManager.getTransaction().begin();

        Patient patient = new Patient("Georgi", "Ivanov", "Ruse", "asdasds@abv.bg", LocalDate.of(1991, 7, 29), true);
        entityManager.persist(patient);

        Medicament medicament = new Medicament("Fenistil");
        entityManager.persist(medicament);

        Diagnose diagnose = new Diagnose("Covid-19");
        entityManager.persist(diagnose);

        Visitation visitation = new Visitation(LocalDate.now(), "stay home");
        entityManager.persist(visitation);

        entityManager.getTransaction().commit();
        entityManager.close();
    }
}

