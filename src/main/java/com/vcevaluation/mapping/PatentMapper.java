package com.vcevaluation.mapping;

import com.vcevaluation.pojo.Patent;

public interface PatentMapper {

	int insertPatent(Patent patent);

	Patent selectByPrimaryKey(Integer patent_id);
}
