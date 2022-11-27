package com.example.jsonadvanced;

import com.example.jsonadvanced.domain.dtos.products.ExportProductsInRangeDto;
import com.example.jsonadvanced.domain.dtos.users.ExportSellersDTO;
import com.example.jsonadvanced.domain.dtos.users.ExportSellersWithCountsDTO;
import com.example.jsonadvanced.services.ProductService;
import com.example.jsonadvanced.services.SeedService;
import com.example.jsonadvanced.services.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

public class ProductShopRunner implements CommandLineRunner {

    private final SeedService seedService;
    private final ProductService productsService;
    private final UserService userService;

    @Autowired
    public ProductShopRunner(SeedService seedService, ProductService productsService, UserService userService) {
        this.seedService = seedService;
        this.productsService = productsService;
        this.userService = userService;
    }

    @Override
    public void run(String... args) throws Exception {
//        this.seedService.seedProducts();

//        this.productsInRange();

        this.findUserWithSoldProductsAndCounts();

    }

    private void findUserWithSoldProductsAndCounts() {
        ExportSellersWithCountsDTO dto = this.userService.findAllWithSoldProductsAndCounts();

        Gson gson = new GsonBuilder()
                .setPrettyPrinting()
                .serializeNulls()
                .create();

        String result = gson.toJson(dto);

        System.out.println(result);
    }

    private void findUserWithSoldProducts() throws JAXBException {
        ExportSellersDTO result = this.userService.findAllWithSoldProducts();

        JAXBContext context = JAXBContext.newInstance(ExportSellersDTO.class);
        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

        marshaller.marshal(result, System.out);
    }

    private void productsInRange() throws JAXBException {
        ExportProductsInRangeDto inRange = this.productsService.getInRange(500, 1000);

        JAXBContext context = JAXBContext.newInstance(ExportProductsInRangeDto.class);
        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

        marshaller.marshal(inRange, System.out);
    }
}

