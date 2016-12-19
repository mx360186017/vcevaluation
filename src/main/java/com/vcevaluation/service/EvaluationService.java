package com.vcevaluation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vcevaluation.mapping.EvaluationMapper;
import com.vcevaluation.mapping.FactorMapper;
import com.vcevaluation.mapping.Index1Mapper;
import com.vcevaluation.mapping.Score_indexMapper;
import com.vcevaluation.mapping.Score_recordMapper;
import com.vcevaluation.pojo.Evaluation;
import com.vcevaluation.pojo.Factor;
import com.vcevaluation.pojo.Index1;
import com.vcevaluation.pojo.Paper;
import com.vcevaluation.pojo.Score_index;
import com.vcevaluation.pojo.Score_record;

@Service
@Transactional
public class EvaluationService {

	@Autowired
	EvaluationMapper evaluationMapper;
	@Autowired
	FactorMapper factorMapper;
	@Autowired
	Score_indexMapper score_indexMapper;
	@Autowired
	Score_recordMapper score_recordMapper;
	@Autowired
	Index1Mapper  indexMapper;

     public Factor selectByPrimaryKey(Integer factor_id){
		
		return factorMapper.selectByPrimaryKey(factor_id);
	}
     
     public  List<Factor> selectByindex1(String factor_remark){
    	 
    	 List<Factor> factors1 = factorMapper.selectByindex1(factor_remark);
    	 return factors1;
     }
     public  List<Factor> selectByindex2(String factor_remark){
    	 
    	 List<Factor> factors2 = factorMapper.selectByindex2(factor_remark);
    	 return factors2;
     }
 public  List<Factor> selectByindexParameter(Factor factor){
    	 
    	 List<Factor> factors3 = factorMapper.selectByindexParameter(factor);
    	 return factors3;
     }
     public void insertEvaluation(Evaluation evaluation){
    	 
    	 evaluationMapper.insertEvaluation(evaluation);
     }
     
     public void  insertScore_index(Score_index score_index){
    	 
    	 score_indexMapper.insertScore_index(score_index);
     }
   public void  insertScore_record(Score_record score_record){
    	 
	   score_recordMapper.insertScore_record(score_record);
     }
     public  List<Index1> selectBytype(String index_type){
    	 
    	 return indexMapper.selectBytype(index_type);
     }
     
     public  Evaluation selectByMulAttribute(Evaluation e){
    	 
    	 return evaluationMapper.selectByMulAttribute(e);
     }
     public  Evaluation selectByMulAttribute1(Evaluation e){
    	 
    	 return evaluationMapper.selectByMulAttribute1(e);
     }
}
