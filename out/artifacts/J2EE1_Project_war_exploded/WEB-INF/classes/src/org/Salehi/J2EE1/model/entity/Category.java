package org.Salehi.J2EE1.model.entity;

import javax.persistence.*;

@Entity(name = "category")
@Table(name = "category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(columnDefinition = "varchar2(30)",nullable = false,unique = true)
    private String category_name;
    //@Column(columnDefinition = "varchar2(30)",nullable = false)
    //private String sub_category_1;



    public long getId() {
        return id;
    }

    public Category setId(long id) {
        this.id = id;
        return this;
    }

    public String getCategory_name() {
        return category_name;
    }

    public Category setCategory_name(String category_name) {
        this.category_name = category_name;
        return this;
    }

}
