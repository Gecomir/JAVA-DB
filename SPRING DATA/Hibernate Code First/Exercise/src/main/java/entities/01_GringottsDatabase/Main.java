package entities;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Main {
    public static void main(String[] args) {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Code-First");
        EntityManager entityManager = emf.createEntityManager();
        entityManager.getTransaction().begin();

        WizardDeposits wizardDeposits = new WizardDeposits("George", "Ivanov", "test", 30, "Gecomir",
                (short) 25, "all", LocalDateTime.now(), BigDecimal.valueOf(7777.77), BigDecimal.valueOf(7.5),
                BigDecimal.valueOf(0.25), LocalDateTime.of(2022, 11, 1, 14, 41), false);

        entityManager.persist(wizardDeposits);

        entityManager.getTransaction().commit();
        entityManager.close();
    }

}

