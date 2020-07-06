package com.base.domain;

public class City {
    private Integer id;

    private String code;

    private String name;

    private String provinceCode;

    public City(Integer id, String code, String name, String provinceCode) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.provinceCode = provinceCode;
    }

    public City() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode == null ? null : provinceCode.trim();
    }
}