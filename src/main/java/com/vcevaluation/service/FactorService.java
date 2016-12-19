package com.vcevaluation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vcevaluation.mapping.FactorMapper;
import com.vcevaluation.mapping.Index1Mapper;
import com.vcevaluation.pojo.Factor;
import com.vcevaluation.pojo.Index1;

@Service
@Transactional
public class FactorService {
	
	@Autowired
	FactorMapper factorMapper;
	
	@Autowired
	Index1Mapper  indexMapper;
	
	public void insertIndex(Index1 index1){
		indexMapper.insertIndex(index1);
	}

	public void insertFactor(Factor factor){
		factorMapper.insertFactor(factor);
	}
	public void updateIndex(Index1 index1){
		indexMapper.updateByPrimaryKeySelective(index1);
	}
	public void updateFactor(Factor factor){
		factorMapper.updateByPrimaryKeySelective(factor);
	}
	
	public List<Index1> selectBytype(String index_type){
		
		return indexMapper.selectBytype(index_type);
	} 
	public List<Factor> selectByindexParameter(Factor factor){
		
		return factorMapper.selectByindexParameter(factor);
	} 
	
	/*public List<Map<String, Object>> selectByIndexFactor(){
		
		List<Map<String, Object>> indexFactor = indexMapper.selectByIndexFactor();
		
		return indexFactor;
	}*/
}
