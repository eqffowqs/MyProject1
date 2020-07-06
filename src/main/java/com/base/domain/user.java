package com.base.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

//@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
public class user {
    private Integer id;

    private String username;

    private String password;

    private String phone;

    private String gender;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    private String province;

    private String city;

    private String area;

    private String address;

    private String pic;

    public user(Integer id, String username, String password, String phone, String gender, Date birthday, String province, String city, String area, String address, String pic) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.gender = gender;
        this.birthday = birthday;
        this.province = province;
        this.city = city;
        this.area = area;
        this.address = address;
        this.pic = pic;
    }

    public user() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }
}