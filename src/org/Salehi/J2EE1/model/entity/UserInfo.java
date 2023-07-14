package org.Salehi.J2EE1.model.entity;

import javax.persistence.*;

@Entity(name = "userInfo")
@Table(name = "user_Info")
public class UserInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(nullable = false)
    private String firstName;
    @Column(nullable = false)
    private String lastName;
    @Column(nullable = false)
    private String state;
    @Column(nullable = false)
    private String city;
    @Column(nullable = false)
    private String postcode;
    @Column
    private String phoneNumber;
    @Column(nullable = false)
    private String mobileNumber;
    @Column(nullable = false)
    private String address1;
    @Column(nullable = false)
    private String address2;

    public String getState() {
        return state;
    }

    public UserInfo setState(String state) {
        this.state = state;
        return this;
    }

    public long getId() {
        return id;
    }

    public UserInfo setId(long id) {
        this.id = id;
        return this;
    }

    public String getFirstName() {
        return firstName;
    }

    public UserInfo setFirstName(String firstName) {
        this.firstName = firstName;
        return this;
    }

    public String getLastName() {
        return lastName;
    }

    public UserInfo setLastName(String lastName) {
        this.lastName = lastName;
        return this;
    }

    public String getCity() {
        return city;
    }

    public UserInfo setCity(String city) {
        this.city = city;
        return this;
    }

    public String getPostcode() {
        return postcode;
    }

    public UserInfo setPostcode(String postcode) {
        this.postcode = postcode;
        return this;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public UserInfo setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
        return this;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public UserInfo setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
        return this;
    }

    public String getAddress1() {
        return address1;
    }

    public UserInfo setAddress1(String address1) {
        this.address1 = address1;
        return this;
    }

    public String getAddress2() {
        return address2;
    }

    public UserInfo setAddress2(String address2) {
        this.address2 = address2;
        return this;
    }
}
