package org.Salehi.J2EE1.model.entity;

import javax.persistence.*;

@Entity(name = "cartItem")
@Table(name = "cartItem")
public class CartItem {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="product_id",nullable = false)
    private Product product;
    @Column(nullable = false)
    private int quantity;

    public long getId() {
        return id;
    }

    public CartItem setId(long id) {
        this.id = id;
        return this;
    }

    public Product getProduct() {
        return product;
    }

    public CartItem setProduct(Product product) {
        this.product = product;
        return this;
    }

    public int getQuantity() {
        return quantity;
    }

    public CartItem setQuantity(int quantity) {
        this.quantity = quantity;
        return this;
    }
}
