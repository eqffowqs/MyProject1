package com.base.service.impl;

import com.base.domain.user;
import com.base.domain.userExample;
import com.base.mapper.userMapper;
import com.base.service.UserService;
import com.base.util.PageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private userMapper usermapper;

    @Override
    public user VerifyUser(String username, String password) {
        userExample ue=new userExample();
        ue.createCriteria().andUsernameEqualTo(username).andPasswordEqualTo(password);
        List<user> userList=usermapper.selectByExample(ue);
        if(userList.size()>0){
            return userList.get(0);
        }else{
            return null;
        }

    }

    @Override
    public String checkUserName(String name) {
        user u = usermapper.checkUserName(name);
        //System.out.println(u + "=====user_service==========" + u.getUsername());
        if (u!=null){
            return "0";
        }
        System.out.println("------------current name");
        return "1";
    }


    @Override
    public int insertUser(user user) {
        return usermapper.insert(user);
    }

    @Override
    public int queryUserCount(userExample userExample) {
        return usermapper.selectByExample(userExample).size();
    }

    @Override
    public PageData queryUserList(int page,int limit,user user) {
        PageData pageData=new PageData();
        page=(page-1)*10;
        userExample ue=new userExample();
        ue.setPage(page);
        ue.setLimit(limit);
        if (user.getUsername()!=null&&!user.getUsername().equals("")){
            ue.createCriteria().andUsernameLike("%"+user.getUsername()+"%");
        }
        List<user> list=usermapper.queryUserList(ue);
        pageData.setCount(usermapper.countByExample(ue)+"");
        pageData.setData(list);

        return pageData;
    }

    @Override
    public int deleteUserByid(Integer id) {
        return usermapper.deleteByPrimaryKey(id);
    }

    @Override
    public int deleteByName(user name) {
        return usermapper.deleteByName(name);
    }

    @Override
    public int deleteUserByName(userExample userExample) {
        return usermapper.deleteByExample(userExample);
    }

    @Override
    public int updateUser(user user) {
        return usermapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public user queryUserById(Integer id) {
        return usermapper.selectByPrimaryKey(id);
    }

}
