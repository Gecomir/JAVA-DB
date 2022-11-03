package entities;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.Scanner;

public class FindEmployeesByFirstName {
    public static void main(String[] args) {

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        Scanner console = new Scanner(System.in);

        String startWith = console.nextLine();

        entityManager.createQuery("FROM Employee e WHERE e.firstName LIKE :startWith", Employee.class).
                setParameter("startWith", startWith + "%")
                .getResultList()
                .forEach(e -> System.out.println(e.salaryInfo()));

        entityManager.getTransaction().commit();
        entityManager.close();
    }
}
