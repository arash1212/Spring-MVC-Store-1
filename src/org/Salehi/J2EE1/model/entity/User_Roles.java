package org.Salehi.J2EE1.model.entity;

import javax.persistence.*;

@Entity(name = "user_roles")
@Table(name = "user_roles")
public class User_Roles {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(columnDefinition = "varchar2(30)",nullable = false)
    private String email;
    @Column(columnDefinition = "Varchar2(20)",nullable = false)
    private String role_name;

    public long getId() {
        return id;
    }

    public User_Roles setId(long id) {
        this.id = id;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public User_Roles setEmail(String email) {
        this.email = email;
        return this;
    }

    public String getRole_name() {
        return role_name;
    }

    public User_Roles setRole_name(String role_name) {
        this.role_name = role_name;
        return this;
    }
}
