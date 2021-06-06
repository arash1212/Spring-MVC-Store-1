package org.Salehi.J2EE1.model.entity;

import javax.persistence.*;

@Entity(name = "roles")
@Table(name = "roles")
public class Roles {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(columnDefinition = "varchar(20)", nullable = false)
    private String role_name;
    @Column(columnDefinition = "varchar2(20)", nullable = false)
    private String address;

    public long getId() {
        return id;
    }

    public Roles setId(long id) {
        this.id = id;
        return this;
    }

    public String getRole_name() {
        return role_name;
    }

    public Roles setRole_name(String role_name) {
        this.role_name = role_name;
        return this;
    }

    public String getAddress() {
        return address;
    }

    public Roles setAddress(String address) {
        this.address = address;
        return this;
    }
}
