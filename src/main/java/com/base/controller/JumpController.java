package com.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("jump")
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
    public String SignIn(){return "User/user_Initialization";}

    @RequestMapping("userList")
    public String UserManager(){return "User/user_List";}

    /**
     * 新增用户
     */
    @RequestMapping("add")
    public String add_user(){
        return "User/user_add";
    }

}
