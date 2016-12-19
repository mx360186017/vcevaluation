package com.vcevaluation.mapping;

import java.util.List;
import java.util.Map;






import com.vcevaluation.pojo.Project;
import com.vcevaluation.pojo.Result;



public interface ResultMapper {

	int insertResult(Result result);

	Result selectResultByName(String res_name);
	
	Result selectByPrimaryKey(Integer res_id);
	
	List<Result> selectResult(Map map);
	
	List<Result> selectResult1();
	
    List<Result> selectByResflag(Integer res_flag);
	
	List<Result> listByResflagPage(Map map);
	
    List<Result> selectByResType(Integer res_type);
	
	List<Result> listByResTypePage(Map map);
	
//	List<Map<String, Object>> selectAllPaper();
//	
//	List<Map<String, Object>> selectAllPatent();
//	
//	List<Map<String, Object>> selectAllSoftware();
//	
//	List<Map<String, Object>> listAllPagerByPage(Map map);
//	
//	List<Map<String, Object>> listAllPatentByPage(Map map);
//	
//	List<Map<String, Object>> listAllSoftwareByPage(Map map);
	
	int updateByPrimaryKeySelective(Result result);
}
