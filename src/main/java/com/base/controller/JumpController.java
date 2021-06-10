package com.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("jump")//所有页面跳转都在这
public class JumpController {

    @RequestMapping("index")
    public String toLogin(){
        return "login/login";
    }

    @RequestMapping("SignUp")
    public String Sign(){
        return "User/SignUp";
    }

    @RequestMapping("ForgetPw")
    public String Forget(){ return "User/forgetPw"; }

    @RequestMapping("userLogin")
    public String SignIn(){return "login/Initialization";}

    @RequestMapping("userList")
    public String UserManager(){return "User/user_List";}

    @RequestMapping("productList")
    public String Product(){ return "Product/product"; }

    @RequestMapping("orderList")
    public String Order(){return "Order/orderList";}

    @RequestMapping("moreList")
    public String More(){return "More/more";}

    /**
     * 新增用户
     */
    @RequestMapping("add")
    public String add_user(){
        return "User/user_add";
    }

}
