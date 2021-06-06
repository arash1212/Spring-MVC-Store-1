package org.Salehi.J2EE1.model.service;

import org.Salehi.J2EE1.model.entity.Category;
import org.Salehi.J2EE1.model.repository.JpaRepository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CategoryService {
    @Inject
    private JpaRepository<Category, Long> repository;

    public void save(Category category) {
        repository.save(category);
    }

    public void update(Category category) {
        repository.update(category);
    }

    public void remove(Category category) {
        repository.remove(category);
    }

    public Category findOneByID(long id) {
        return repository.findOneByID(Category.class, id);
    }

    public Category findOneByName(String categoryName) {
        return repository.findOneByFieldName(Category.class, "category_name", categoryName);
    }

    public List<Category> findAll() {
        return repository.findAll(Category.class);
    }
}
