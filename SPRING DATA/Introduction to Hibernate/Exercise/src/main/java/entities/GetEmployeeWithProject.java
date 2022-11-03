package entities;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.Scanner;
import java.util.stream.Collectors;

public class GetEmployeeWithProject {
    public static void main(String[] args) {

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        Scanner console = new Scanner(System.in);

        int id = Integer.parseInt(console.nextLine());

        Employee employee = entityManager.find(Employee.class, id);

        System.out.println(employee);

        // System.out.printf("%s %s - %s%n%s", employee.getFirstName(), employee.getLastName(), employee.getJobTitle(),
        //        employee.getProjects().stream()
        //        .map(Project::getName)
        //        .collect(Collectors.joining(System.lineSeparator())));

        entityManager.getTransaction().commit();
        entityManager.close();
    }
}
