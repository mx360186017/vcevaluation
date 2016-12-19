package com.vcevaluation.mapping;

import com.vcevaluation.pojo.Eva_expert;


public interface Eva_expertMapper {

	int insertEva_expert(Eva_expert eva_expert);
	
	Eva_expert selectByPrimaryKey(Integer ex_id);
	
	int updateByPrimaryKey(Eva_expert eva_expert);
}
