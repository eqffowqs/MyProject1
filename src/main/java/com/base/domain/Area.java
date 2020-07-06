package com.base.domain;

public class Area {
    private Integer id;

    private String code;

    private String name;

    private String cityCode;

    public Area(Integer id, String code, String name, String cityCode) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.cityCode = cityCode;
    }

    public Area() {
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

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode == null ? null : cityCode.trim();
    }
}