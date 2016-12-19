package com.vcevaluation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vcevaluation.mapping.ResproMapper;
import com.vcevaluation.pojo.Respro;

@Service
@Transactional
public class ResproService {

	@Autowired
	ResproMapper resproMapper;

	//创建项目-成果
	public void insertRespro(Respro respro){
		resproMapper.insertRespro(respro);
	}
	public List<Respro> selectByProid(Integer rpro_pro_id){
		return resproMapper.selectByProid(rpro_pro_id);
	}
}
