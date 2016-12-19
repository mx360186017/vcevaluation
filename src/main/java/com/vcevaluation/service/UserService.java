package com.vcevaluation.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vcevaluation.mapping.Eva_expertMapper;
import com.vcevaluation.mapping.ResultproviderMapper;
import com.vcevaluation.mapping.UserMapper;
import com.vcevaluation.pojo.Eva_expert;
import com.vcevaluation.pojo.Resultprovider;
import com.vcevaluation.pojo.User;

@Service
@Transactional
public class UserService {

	@Autowired
	UserMapper userMapper;
	@Autowired
	Eva_expertMapper eva_expertMapper;
	@Autowired
	ResultproviderMapper resultproviderMapper;
	
	
	public void user_delete_by_id(int user_id){
		
		userMapper.deleteByPrimaryKey(user_id);
	}

	public User selectByName(String user_name){
		User user = userMapper.selectByName(user_name);
		return user;
	}
	
	public void updateByPrimaryKeySelective(User user){ 
		userMapper.updateByPrimaryKeySelective(user);
    }
	
	public void updateByName(String user_name){ 
		userMapper.updateByName(user_name);
    }
	
    public void InsertUser(User user){
    	userMapper.insertSelective(user);
    }
	
	public List<User> queryUsers(){
		List<User> list = userMapper.selectall();
		return list;
	}
	public List<User> queryByUsertype(Integer user_type){
		List<User> list = userMapper.selectByUsertype(user_type);
		return list;
	}
	
    public void InsertEva_ex(Eva_expert eva_expert){
    	eva_expertMapper.insertEva_expert(eva_expert);
    }
	
    public Eva_expert SelectEva_ex(Integer ex_id){
    	Eva_expert eva_expert = eva_expertMapper.selectByPrimaryKey(ex_id);
    	return eva_expert;
    }
    
    public void InsertResultprovider(Resultprovider resultprovider){
    	resultproviderMapper.insertResultprovider(resultprovider);
    }
	
    public Resultprovider SelectResultprovider(Integer rp_id){
    	Resultprovider resultprovider= resultproviderMapper.selectByPrimaryKey(rp_id);
    	return resultprovider;
    }
	
	/**
	 * 查看个人信息
	 * @author 
	 */
	public User selectByPrimaryKey(Integer user_id){
		
		User user = userMapper.selectByPrimaryKey(user_id);
		
		return user;
	}
	
	/**
	 * 修改个人信息
	 * @author 
	 */
	public void updateByPrimaryKey(User user){
		
		userMapper.updateByPrimaryKey(user);
		
	}
   public void updateByPrimaryKey1(Eva_expert eva_expert){
		
		eva_expertMapper.updateByPrimaryKey(eva_expert);
		
	}
    public void updateByPrimaryKey2(Resultprovider resultprovider){
	
    	resultproviderMapper.updateByPrimaryKey(resultprovider);
	
    }

	/**
	 * 用户注册
	 * @author 
	 */
	public boolean userRegister(User user){
		
		userMapper.insertUser(user);
		
		return true;
	}
	
	/**
	 * 用户登录
	 * @author 
	 */
	public User userLogin(String name, String pwd){
		
		Map usermap = new HashMap();
		usermap.put("user_name", name);
		usermap.put("user_pwd", pwd);
		User user = userMapper.userLogin(usermap);
		
		return user;
	}
	
	/**
	 * 根据email查询用户是否存在
	 * @author 
	 */
	public User selectByEmail(String user_email){
		
		User user = userMapper.selectByEmail(user_email);
		
		return user;
	}
	
	
	
}
