package com.vcevaluation.mapping;


import java.util.List;

import com.vcevaluation.pojo.Factor;

public interface FactorMapper {
	
	  int insertFactor(Factor factor);
	  
	  int updateByPrimaryKeySelective(Factor factor);
		
	  Factor selectByPrimaryKey(Integer factor_id);
	  
	  List<Factor> selectByindex1(String factor_remark);
	  
	  List<Factor> selectByindex2(String factor_remark);
	  
	  List<Factor> selectByindexParameter(Factor factor);
	  
	  List<Factor> selectByindex(Integer factor_index_id);
}
