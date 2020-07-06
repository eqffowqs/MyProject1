package com.base.service.impl;

import com.base.domain.Province;
import com.base.mapper.ProvinceMapper;
import com.base.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProvinceServiceImpl implements ProvinceService {

    @Autowired
    private ProvinceMapper provinceMapper;

    @Override
    public List<Province> SelectProvince() {
        return provinceMapper.selectByExample(null);
    }
}
