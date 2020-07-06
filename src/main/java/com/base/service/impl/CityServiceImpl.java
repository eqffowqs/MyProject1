package com.base.service.impl;

import com.base.domain.City;
import com.base.domain.CityExample;
import com.base.mapper.CityMapper;
import com.base.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityServiceImpl implements CityService {

    @Autowired
    private CityMapper cityMapper;

    @Override
    public List<City> SelectCity(String code) {
        System.out.print("city service");
        CityExample province=new CityExample();
        province.createCriteria().andProvinceCodeEqualTo(code+"");
        return cityMapper.selectByExample(province);
    }
}
