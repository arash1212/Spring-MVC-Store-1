package org.Salehi.J2EE1.model.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity(name = "transaction")
@Table(name = "transaction")
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private Users users;
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "transaction_id")
    private List<CartItem> cartItems;
    @Column(nullable = false)
    private String stateOfTransaction;
    @Column(nullable = false)
    private Date date_added;
    @Column
    private Date date_transaction_done;

    public Date getDate_transaction_done() {
        return date_transaction_done;
    }

    public Transaction setDate_transaction_done(Date date_transaction_done) {
        this.date_transaction_done = date_transaction_done;
        return this;
    }

    public Date getDate_added() {
        return date_added;
    }

    public Transaction setDate_added(Date date_added) {
        this.date_added = date_added;
        return this;
    }

    public String getStateOfTransaction() {
        return stateOfTransaction;
    }

    public Transaction setStateOfTransaction(String stateOfTransaction) {
        this.stateOfTransaction = stateOfTransaction;
        return this;
    }

    public long getId() {
        return id;
    }

    public Transaction setId(long id) {
        this.id = id;
        return this;
    }

    public Users getUsers() {
        return users;
    }

    public Transaction setUsers(Users users) {
        this.users = users;
        return this;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public Transaction setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
        return this;
    }
}
