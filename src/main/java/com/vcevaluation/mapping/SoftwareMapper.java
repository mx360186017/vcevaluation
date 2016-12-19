package com.vcevaluation.mapping;

import com.vcevaluation.pojo.Software;

public interface SoftwareMapper {

	int insertSoftware(Software software);
	
	Software selectByPrimaryKey(Integer s_id);
}
