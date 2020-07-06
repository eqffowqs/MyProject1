package com.base.controller;

import com.base.domain.City;
import com.base.domain.Province;
import com.base.domain.Area;
import com.base.service.AreaService;
import com.base.service.CityService;
import com.base.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("area")
public class AreaController {

    @Autowired
    private ProvinceService provinceService;

    @Autowired
    private CityService cityService;

    @Autowired
    private AreaService areaService;

    @RequestMapping("ProvinceList")
    @ResponseBody//作为Ajax返回的数据类型，并不是执行简单的跳转，所以是ResponseBody
    public List<Province> SelectProvince(){//返回的是省列表
        System.out.print("province controller");
        return provinceService.SelectProvince();
    }

    @ResponseBody
    @RequestMapping("CityList")
    public List<City> SelectCity(String code){
        System.out.print("city controller");
        return cityService.SelectCity(code);
    }

    @ResponseBody
    @RequestMapping("AreaList")
    public List<Area> SelectArea(String code){
        return areaService.SelectArea(code);
    }
}
