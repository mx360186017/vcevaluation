package com.vcevaluation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vcevaluation.mapping.UploadMapper;
import com.vcevaluation.pojo.Upload;

@Service
@Transactional
public class UploadService {

	@Autowired 
	UploadMapper uploadMapper;
	public void insert(Upload up){
		uploadMapper.insert(up);
	}
	
	public Upload select(Integer id){
		return uploadMapper.select(id);
	}
	
	public Upload selectUploadByName(String upload_name){
		return uploadMapper.selectUploadByName(upload_name);
	}
	
	public List<Upload> selectname(){
		return uploadMapper.selectname();
	}
}
