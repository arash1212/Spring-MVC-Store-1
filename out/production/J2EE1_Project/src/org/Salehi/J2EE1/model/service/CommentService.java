package org.Salehi.J2EE1.model.service;

import org.Salehi.J2EE1.model.entity.Comments;
import org.Salehi.J2EE1.model.repository.JpaRepository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CommentService {
    @Inject
    private JpaRepository<Comments, Long> repository;

    public void save(Comments comments) {
        repository.save(comments);
    }

    public void remove(Comments comments) {
        repository.remove(comments);
    }

    public List<Comments> findAllByProductID(long id) {
        return repository.findAllByChildId(Comments.class, "product", id);
    }
}
