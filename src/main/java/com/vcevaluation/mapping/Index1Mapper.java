package com.vcevaluation.mapping;

import java.util.List;
import com.vcevaluation.pojo.Index1;




public interface Index1Mapper {
	
  int insertIndex(Index1 index);
	
  Index1 selectByPrimaryKey(Integer index_id);
  
  List<Index1> selectBytype(String index_type);
  
  int updateByPrimaryKeySelective(Index1 index);
  
  /*List<Map<String, Object>> selectByIndexFactor();*/
}
