package com.base.service;

import com.base.domain.user;
import com.base.domain.userExample;
import com.base.util.PageData;

public interface UserService {

    //用于账号密码验证
    public user VerifyUser(String username, String password);

    //用于检查用户姓名是否被注册
    public String checkUserName(String username);

    //新增用户
    public int insertUser(user user);

    /*
     * 用于与PagaData相关的查询
     */
    public int queryUserCount(userExample userExample);//查询总条数

    public PageData queryUserList(int page,int limit,user user);//查询对象

    /*
    * delete
    * */

    public int deleteUserByid(Integer id);

    public int deleteUserByName(userExample userExample);

    public int deleteByName(user name);

    /*
    * update
    * */
    public int updateUser(user user);

    public user queryUserById(Integer id);
}
