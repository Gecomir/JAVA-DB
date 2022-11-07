package _02_SalesDatabase;

import _02_SalesDatabase.entities.Customer;
import _02_SalesDatabase.entities.Product;
import _02_SalesDatabase.entities.Sale;
import _02_SalesDatabase.entities.StoreLocation;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.math.BigDecimal;

public class _02Main {
    public static void main(String[] args) {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Code-First");
        EntityManager entityManager = emf.createEntityManager();
        entityManager.getTransaction().begin();

        Product product = new Product("banana", 33.2, BigDecimal.TEN);
        Customer customer = new Customer("customer", "tralala", "12345");
        StoreLocation storeLocation = new StoreLocation("asd");
        Sale sale = new Sale(product, customer, null);

        entityManager.persist(product);
        entityManager.persist(customer);
        entityManager.persist(storeLocation);
        entityManager.persist(sale);

        entityManager.getTransaction().commit();
        entityManager.close();
    }

}

