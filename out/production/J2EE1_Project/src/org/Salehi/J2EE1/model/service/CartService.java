package org.Salehi.J2EE1.model.service;

import org.Salehi.J2EE1.model.entity.Cart;
import org.Salehi.J2EE1.model.repository.JpaRepository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

@Service
public class CartService {
    @Inject
    private JpaRepository<Cart, Long> repository;

    public void save(Cart cart) {
        repository.save(cart);
    }

    public void remove(Cart cart) {
        repository.remove(cart);
    }

    public void update(Cart cart) {
        repository.update(cart);
    }

    public void updateQuantity(int quantity, long id) {
        repository.updateOneIntFieldByID(Cart.class, "quantity", quantity, id);
    }

    public Cart findOneByID(long id) {
        return repository.findOneByID(Cart.class, id);
    }

    public Cart findOneByUserID(long id) {
        return repository.findOneByChildId(Cart.class, "users", id);
    }

    public List<Cart> findAllWithUserID(long id) {
        return repository.findAllByChildId(Cart.class, "users", id);
    }

    public List<Cart> findAllWithUserIdWhereTransactionIsNull(long id) {
        return repository.findAllByUserIdAndNullChildField(Cart.class, id, "transactions");
    }

}
