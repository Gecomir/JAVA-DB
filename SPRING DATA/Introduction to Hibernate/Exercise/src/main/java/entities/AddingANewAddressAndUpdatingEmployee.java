package entities;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.Scanner;

public class AddingANewAddressAndUpdatingEmployee {
    public static void main(String[] args) {

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        entityManager.getTransaction().begin();

        String newAddress = "Vitoshka 15";
        Address address = new Address();
        address.setText(newAddress);
        entityManager.persist(address);

        Scanner console = new Scanner(System.in);
        String lastName = console.nextLine();

        entityManager.createQuery("UPDATE Employee e" +
                        " SET e.address = :address " +
                        " WHERE e.lastName = :last_name").
                setParameter("last_name", lastName).
                setParameter("address", address).
                executeUpdate();

        entityManager.getTransaction().commit();
        entityManager.close();
    }
}
