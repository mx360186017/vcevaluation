package com.vcevaluation.mapping;

import java.util.List;
import java.util.Map;

import com.vcevaluation.pojo.Admin;
import com.vcevaluation.pojo.User;

public interface AdminMapper {

	int adminRegister(Admin admin);
	
	int updateByPrimaryKeySelective(Admin admin);
	
	int updateByPrimaryKey(Admin admin);
	
	Admin adminLogin(Map map);
	
	Admin selectByName(String admin_name);
	
}
