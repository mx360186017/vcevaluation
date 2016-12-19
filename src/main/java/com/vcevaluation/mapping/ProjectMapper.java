package com.vcevaluation.mapping;

import java.util.List;
import java.util.Map;

import com.vcevaluation.pojo.Project;

public interface ProjectMapper {
	
    int insertProject(Project project);
	
	int deleteByPrimaryKey(Integer project_id);

	Project selectByPrimaryKey(Integer project_id);
	
	Project selectByName(String pro_name);
	
	// 根据项目状态查询项目 
	List<Project> selectByProflag(Integer pro_flag);
	
	List<Project> listByProflagPage(Map map);
    
    List<Project> selectallProject();
    
    List<Project> listAllProByPage(Map map);
    
    int updateByPrimaryKeySelective(Project project);
}
