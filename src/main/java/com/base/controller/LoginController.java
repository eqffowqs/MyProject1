package com.base.controller;

import com.base.domain.user;
import com.base.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("login")
public class LoginController {

    @Autowired
    private UserService us;



    @RequestMapping("login1")
    public @ResponseBody String Login(HttpServletRequest httpServletRequest,String username,String password,String code){
        String status="0";
        System.out.print("test------------------------------------------------------");
        String session_code=(String) httpServletRequest.getSession().getAttribute("VERIFY");
        if(!session_code.equalsIgnoreCase(code)){
            return status="1";//1表示验证码错误
        }else{
            user u=us.VerifyUser(username,password);
            if(u==null){
                return status="2";
            }
        }
        return status;
    }

}
