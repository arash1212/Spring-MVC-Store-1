package org.Salehi.J2EE1.model.entity;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "technicianRequests")
@Table(name = "technician_requests")
public class TechnicianRequests {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(nullable = false)
    private String requestCategory;
    @Column(nullable = false)
    private String requestSubCategory;
    @OneToOne(cascade = CascadeType.DETACH, fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", nullable = false)
    private Users users;
    @Column(nullable = false)
    private Date requestDate;
    @Column
    public String description;
    @Column
    public String newAddress;
    @Column(nullable = false)
    private String stateOfRequest;

    public String getStateOfRequest() {
        return stateOfRequest;
    }

    public TechnicianRequests setStateOfRequest(String stateOfRequest) {
        this.stateOfRequest = stateOfRequest;
        return this;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public TechnicianRequests setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
        return this;
    }

    public long getId() {
        return id;
    }

    public TechnicianRequests setId(long id) {
        this.id = id;
        return this;
    }

    public String getRequestCategory() {
        return requestCategory;
    }

    public TechnicianRequests setRequestCategory(String requestCategory) {
        this.requestCategory = requestCategory;
        return this;
    }

    public String getRequestSubCategory() {
        return requestSubCategory;
    }

    public TechnicianRequests setRequestSubCategory(String requestSubCategory) {
        this.requestSubCategory = requestSubCategory;
        return this;
    }

    public Users getUsers() {
        return users;
    }

    public TechnicianRequests setUsers(Users users) {
        this.users = users;
        return this;
    }

    public String getDescription() {
        return description;
    }

    public TechnicianRequests setDescription(String description) {
        this.description = description;
        return this;
    }

    public String getNewAddress() {
        return newAddress;
    }

    public TechnicianRequests setNewAddress(String newAddress) {
        this.newAddress = newAddress;
        return this;
    }
}
