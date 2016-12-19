
package com.vcevaluation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vcevaluation.mapping.SoftwareMapper;

import com.vcevaluation.pojo.Software;



@Service
@Transactional
public class SoftwareService {

	@Autowired
	SoftwareMapper softwareMapper;
	//提交软件
	public void insertSoftware(Software software){
		softwareMapper.insertSoftware(software);
	}
	
	public Software selectByPrimaryKey(Integer s_id){
		
		return softwareMapper.selectByPrimaryKey(s_id);
	}
}
