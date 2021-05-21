package com.base.controller;

import com.base.domain.user;
import com.base.service.UserService;
import com.base.util.PageData;
import com.base.util.upload;
import com.base.util.upload_Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;


@Controller
@RequestMapping("User")
public class UserController {

    @Autowired
    private UserService userService;

    private user temp;



    /*
    * 用户信息列表查询方法
    * 传入参数：page--当前页 limit--每页条数
    * 输出对象：PageData{code--请求状态，默认0为成功；msg；count--数据总数；data--数据集合}
    */
    @RequestMapping("list")//因为返回的是对象，又是ajax
    public @ResponseBody PageData queryUserInfoList(Integer page,Integer limit
            ,String username){
        user user=new user();
        if (username!=null){
            user.setUsername(username);
        }
        return userService.queryUserList(page,limit,user);
    }



    //保存方法
    @RequestMapping("userSave")
    public @ResponseBody int save(@RequestBody user user){
        System.out.println("name------"+user.getUsername());
        String cun=userService.checkUserName(user.getUsername());
        System.out.println(cun+"--=-=-=-------");
        if (cun=="1"){
            System.out.println("this is 11111");
            userService.insertUser(user);
            return 1;
        }
        return 0;


    }

    //检查用户名是否占用
    @RequestMapping("checkName")
    public @ResponseBody String checkName(String name){
        String n="1";
        String m= userService.checkUserName(name);
        if (n.equals(m)) {
            return "1";//查询不到相同名字
        }
        return "0";//查询出相同名字

    }



    /**
     * 删除用户
     */
    @RequestMapping("userDelete")
    @ResponseBody
    public int delete_user(Integer id){

        if (id!=null){
            userService.deleteUserByid(id);
        }
        System.out.print("delete");
        return 1;
    }

    //通过名字删除用户
    /*@RequestMapping("userDelete_name")
    @ResponseBody
    public int delete_userName(String name){
        user temp=new user();
        temp.setUsername(name);
        if(name!=null){
           // userService.deleteUserByName(userExample);
            userService.deleteByName(temp);
            System.out.println(userExample+"delete---------------------------------"+name);
            return 1;
        }else{
            System.out.println("delete--------sss-------------------------"+name);
            return 0;
        }
    }*/

    //编辑跳转
    @RequestMapping("Edit")
    public ModelAndView editTrans(Integer id){
        ModelAndView mv=new ModelAndView();
        user u=userService.queryUserById(id);
        mv.setViewName("/User/user_edit");
        mv.addObject("user",u);//传递到前端user_edit的数据
        return mv;
    }

    //update
    @RequestMapping("userEdit")
    @ResponseBody
    public String edit_user(@RequestBody user user) {
        String code="1";
        int num=userService.updateUser(user);
        if(num>0){
            code="0";
        }
        return code;
    }

    //upload pic
    @RequestMapping("uploadPic")
    @ResponseBody
    public upload upload_pic(@RequestParam MultipartFile file) {
        upload up=new upload();
        up.setCode("0");
        try {
            String name= upload_Tool.uploadImg(file);
            if (name!=null&&name!="") {
                up.setCode("1");
                up.setName(name);
            }
        } catch (IOException e) {
            up.setCode("2");
            e.printStackTrace();
        }
        return up;
    }
}
