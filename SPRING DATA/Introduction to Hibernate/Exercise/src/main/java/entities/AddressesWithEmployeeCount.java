package entities;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class AddressesWithEmployeeCount {
    public static void main(String[] args) {

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        entityManager.createQuery("FROM Address a ORDER BY a.employees.size DESC", Address.class).
                setMaxResults(10).
                getResultList().
                forEach(System.out::println);

        entityManager.getTransaction().commit();
        entityManager.close();
    }
}
