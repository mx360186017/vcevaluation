package com.vcevaluation.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vcevaluation.mapping.AdminMapper;
import com.vcevaluation.mapping.EvaluationMapper;
import com.vcevaluation.pojo.Admin;
import com.vcevaluation.pojo.User;

@Service
@Transactional
public class AdminService {

	@Autowired
	AdminMapper adminMapper;
	
	
	public void adminRegister(Admin admin){
		adminMapper.adminRegister(admin);
	}
	
	public Admin adminLogin(String admin_name,String admin_pwd){
		Map<String, String> map = new HashMap<String, String>();
		map.put("admin_name", admin_name);
		map.put("admin_pwd", admin_pwd);
		Admin admin = adminMapper.adminLogin(map);
		return admin;
	}
	
	public void updateByPrimaryKeySelective(Admin admin){
		adminMapper.updateByPrimaryKeySelective(admin);
	}
	public void updateByPrimaryKey(Admin admin){
		adminMapper.updateByPrimaryKey(admin);
	}
	
	public Admin selectByName(String admin_name){
		
		Admin admin = adminMapper.selectByName(admin_name);
		return admin;
	}
}
