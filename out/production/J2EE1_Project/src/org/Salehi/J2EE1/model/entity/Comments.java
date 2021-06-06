package org.Salehi.J2EE1.model.entity;

import javax.persistence.*;

@Entity(name = "comments")
@Table(name = "comments")
public class Comments {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", nullable = false)
    private Users users;
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;
    @Column(nullable = false)
    private String Message;

    public long getId() {
        return id;
    }

    public Comments setId(long id) {
        this.id = id;
        return this;
    }

    public Users getUsers() {
        return users;
    }

    public Comments setUsers(Users users) {
        this.users = users;
        return this;
    }

    public Product getProduct() {
        return product;
    }

    public Comments setProduct(Product product) {
        this.product = product;
        return this;
    }

    public String getMessage() {
        return Message;
    }

    public Comments setMessage(String message) {
        Message = message;
        return this;
    }
}
