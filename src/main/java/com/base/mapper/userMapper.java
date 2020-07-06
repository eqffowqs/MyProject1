package com.base.mapper;

import com.base.domain.user;
import com.base.domain.userExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface userMapper {
    int countByExample(userExample example);

    int deleteByExample(userExample example);

    List<user> queryUserList(userExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(user record);

    int insertSelective(user record);

    List<user> selectByExample(userExample example);

    user selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") user record, @Param("example") userExample example);

    int updateByExample(@Param("record") user record, @Param("example") userExample example);

    int updateByPrimaryKeySelective(user record);

    int updateByPrimaryKey(user record);

    user checkUserName(String name);

    int deleteByName(user name);
}