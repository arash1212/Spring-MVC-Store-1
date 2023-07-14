package org.Salehi.J2EE1.model.entity;

import javax.persistence.*;

@Entity(name = "users")
@Table(name = "users")
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(columnDefinition = "varchar2(30)",nullable = false,unique = true)
    private String email;
    @Column(columnDefinition = "varchar2(20)",nullable = false)
    private String password;

    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name = "role_id")
    private User_Roles user_role;

    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinColumn(name = "cart_id",nullable = false)
    private Cart cart;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userInfoID")
    private UserInfo userInfo;

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public Users setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
        return this;
    }

    public Cart getCart() {
        return cart;
    }

    public Users setCart(Cart cart) {
        this.cart = cart;
        return this;
    }

    public User_Roles getUser_role() {
        return user_role;
    }

    public Users setUser_role(User_Roles user_role) {
        this.user_role = user_role;
        return this;
    }

    public long getId() {
        return id;
    }

    public Users setId(long id) {
        this.id = id;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public Users setEmail(String email) {
        this.email = email;
        return this;
    }

    public String getPassword() {
        return password;
    }

    public Users setPassword(String password) {
        this.password = password;
        return this;
    }
}
