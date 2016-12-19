package com.vcevaluation.mapping;

import com.vcevaluation.pojo.Resultprovider;



public interface ResultproviderMapper {

	int insertResultprovider(Resultprovider resultprovider);
	
	Resultprovider selectByPrimaryKey(Integer rp_id);
	
	 int updateByPrimaryKey(Resultprovider resultprovider);
}
