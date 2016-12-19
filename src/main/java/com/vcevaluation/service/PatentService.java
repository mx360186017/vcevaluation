
package com.vcevaluation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vcevaluation.mapping.PatentMapper;

import com.vcevaluation.pojo.Patent;


@Service
@Transactional
public class PatentService {

	@Autowired
	PatentMapper patentMapper;
	//提交专利
	public void insertPatent(Patent patent){
		patentMapper.insertPatent(patent);
	}
	
	public Patent selectByPrimaryKey(Integer patent_id){
		
		return patentMapper.selectByPrimaryKey(patent_id);
	}
}
