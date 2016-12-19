package com.vcevaluation.mapping;

import java.util.Map;

import com.vcevaluation.pojo.Evaluation;

public interface EvaluationMapper {
	
    int insertEvaluation(Evaluation evaluation);
    
    int updateByPrimaryKeySelective(Evaluation evaluation);
    
    Evaluation selectByMulAttribute(Evaluation evaluation);
    
    Evaluation selectByMulAttribute1(Evaluation evaluation);
}
