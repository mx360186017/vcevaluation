package com.vcevaluation.mapping;

import java.util.List;

import com.vcevaluation.pojo.Respro;

public interface ResproMapper {

	int insertRespro(Respro respro);
	
	List<Respro> selectByProid(Integer rpro_pro_id);
}
