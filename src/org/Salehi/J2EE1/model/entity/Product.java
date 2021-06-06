package org.Salehi.J2EE1.model.entity;

import javax.persistence.*;

@Entity(name = "product")
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(columnDefinition = "varchar2(30)", nullable = false,unique = true)
    private String product_name;
    @Column(nullable = false)
    private String description;
    @Column(columnDefinition = "number", nullable = false)
    private int stock;
    @Column(columnDefinition = "number", nullable = false)
    private int buyPrice;
    @Column(columnDefinition = "number", nullable = false)
    private int sellPrice;
    @Column(nullable = false)
    private int saleAmount;
    @Column(nullable = false)
    private int profitPercentage;
    @OneToOne(cascade = CascadeType.DETACH, fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;
    @Column
    private String productImagePath;

    public String getProductImagePath() {
        return productImagePath;
    }

    public Product setProductImagePath(String productImagePath) {
        this.productImagePath = productImagePath;
        return this;
    }

    public int getProfitPercentage() {
        return profitPercentage;
    }

    public Product setProfitPercentage(int profitPercentage) {
        this.profitPercentage = profitPercentage;
        return this;
    }

    public Category getCategory() {
        return category;
    }

    public Product setCategory(Category category) {
        this.category = category;
        return this;
    }

    public int getSaleAmount() {
        return saleAmount;
    }

    public void setSaleAmount(int saleAmount) {
        this.saleAmount = saleAmount;
    }


    public int getBuyPrice() {
        return buyPrice;
    }

    public Product setBuyPrice(int buyPrice) {
        this.buyPrice = buyPrice;
        return this;
    }

    public int getSellPrice() {
        return sellPrice;
    }

    public Product setSellPrice(int sellPrice) {
        this.sellPrice = sellPrice;
        return this;
    }


    public long getId() {
        return id;
    }

    public Product setId(long id) {
        this.id = id;
        return this;
    }

    public String getProduct_name() {
        return product_name;
    }

    public Product setProduct_name(String product_name) {
        this.product_name = product_name;
        return this;
    }

    public String getDescription() {
        return description;
    }

    public Product setDescription(String description) {
        this.description = description;
        return this;
    }

    public int getStock() {
        return stock;
    }

    public Product setStock(int stock) {
        this.stock = stock;
        return this;
    }


}
