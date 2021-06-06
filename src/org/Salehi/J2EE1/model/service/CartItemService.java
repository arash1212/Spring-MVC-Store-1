package org.Salehi.J2EE1.model.service;

import org.Salehi.J2EE1.model.entity.Cart;
import org.Salehi.J2EE1.model.entity.CartItem;
import org.Salehi.J2EE1.model.repository.JpaRepository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CartItemService {
    @Inject
    private JpaRepository<CartItem, Long> repository;

    public void save(CartItem cartItem) {
        repository.save(cartItem);
    }

    public void remove(CartItem cart) {
        repository.remove(cart);
    }

    public void update(CartItem cart) {
        repository.update(cart);
    }

    public CartItem findOneByID(long id) {
        return repository.findOneByID(CartItem.class, id);
    }
}
