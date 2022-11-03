package entities;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EmployeeMaximumSalaries {
    public static void main(String[] args) {

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        entityManager.createQuery("SELECT e.department.name, MAX(e.salary) " +
                        " FROM Employee e " +
                        " GROUP BY e.department.name " +
                        " HAVING MAX(e.salary) NOT BETWEEN 30000 AND 70000", Object[].class)
                        .getResultList()
                        .forEach(o -> System.out.println(o[0] + " " +o[1]));

        entityManager.getTransaction().commit();
        entityManager.close();
    }
}
