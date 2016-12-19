package com.vcevaluation.mapping;

import com.vcevaluation.pojo.Paper;



public interface PaperMapper {

	int insertPaper(Paper paper);

	Paper selectByPrimaryKey(Integer Paper_id);
}
