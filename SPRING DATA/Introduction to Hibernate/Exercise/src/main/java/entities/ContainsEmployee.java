package entities;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.Scanner;

public class ContainsEmployee {
    public static void main(String[] args) {

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        Scanner scanner = new Scanner(System.in);

        String[] employeeFullName = scanner.nextLine().split("\\s+");
        String firstName = employeeFullName[1];
        String lastName = employeeFullName[2];

        Long countFullName = entityManager.createQuery("SELECT count(e) FROM Employee e" +
                        " WHERE e.firstName = :first_name AND e.lastName = :last_name", Long.class)
                .setParameter("first_name", firstName)
                .setParameter("last_name", lastName)
                .getSingleResult();

        if (countFullName == 0) {
            System.out.println("No");
        } else {
            System.out.println("Yes");
        }
        entityManager.getTransaction().commit();
        entityManager.close();
    }
}
