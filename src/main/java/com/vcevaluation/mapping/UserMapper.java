package com.vcevaluation.mapping;

import java.util.List;
import java.util.Map;

import com.vcevaluation.pojo.User;

public interface UserMapper {
	
	int insertUser(User user);
	
	int deleteByPrimaryKey(Integer user_id);

	int insertSelective(User user);

	User selectByPrimaryKey(Integer user_id);
    
    List<User> selectall();
    
    List<User> selectByUsertype(Integer user_type);
    /**
     * 用户本人完善个人信息
     * */
    int updateByPrimaryKeySelective(User user);

    int updateByPrimaryKey(User user);
    
    
    /**
     * 根据用户名查找个人信息
     * */
    public  User selectByName(String user_name);
    
    /**
     * 用户修改个人信息
     * */
    int updateByName(String user_name);
    
     
	/**
	 * 登录
	 * @author Xiaoyan
	 */
	User userLogin(Map usermap);
	
	/**
     * 根据email查询用户是否存在
     * @author 
     */
    public User selectByEmail(String user_email);
}
