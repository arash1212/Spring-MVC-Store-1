package org.Salehi.J2EE1.model.service;

import org.Salehi.J2EE1.model.entity.Product;
import org.Salehi.J2EE1.model.repository.JpaRepository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class ProductService {
    @Inject
    private JpaRepository<Product, Long> repository;

    public void save(Product product) {
        int percent = (product.getBuyPrice() * 20) / 100;
        product.setSellPrice(product.getBuyPrice() + percent);
        repository.save(product);
    }

    public void remove(Product product) {
        repository.remove(product);
    }

    public void update(Product product) {
        int percent = (product.getBuyPrice() * product.getProfitPercentage()) / 100;
        product.setSellPrice(product.getBuyPrice() + percent);
        repository.update(product);
    }

    public Product findOneByID(long id) {
        return repository.findOneByID(Product.class, id);
    }

    public Product findOneByName(String name) {
        return repository.findOneByFieldName(Product.class, "product_name", name);
    }


    public List<Product> findAll() {
        return repository.findAll(Product.class);
    }

    public List<Product> findAllWithCategory(String categoryName) {
        return repository.findAllByChildFieldName(Product.class, "category", "category_name", categoryName);
    }

    public List<Product> getFiveLastProducts() {
        return repository.get5lastItems(Product.class, "id");
    }

    public List<Product> getFiveBestSellers() {
        return repository.get5lastItems(Product.class, "saleAmount");
    }

    public List<Product> productPaging(int pageNum) {
        return repository.pagination(Product.class, pageNum);
    }

    public List<Product> productPagingWithCategory(int pageNum,String categoryName) {
        return repository.paginationWithChildFieldName(Product.class, pageNum,"category","category_name",categoryName);
    }
}
