package com.base.service.impl;

import com.base.domain.Area;
import com.base.domain.AreaExample;
import com.base.mapper.AreaMapper;
import com.base.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AreaServiceImpl implements AreaService {

    @Autowired
    private AreaMapper areaMapper;

    @Override
    public List<Area> SelectArea(String code) {
        AreaExample city =new AreaExample();
        city.createCriteria().andCityCodeEqualTo(code+"");
        return areaMapper.selectByExample(city);
    }
}
