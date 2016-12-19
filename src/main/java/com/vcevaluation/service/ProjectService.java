package com.vcevaluation.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.vcevaluation.mapping.ProjectMapper;
import com.vcevaluation.pojo.Project;
import com.vcevaluation.utils.Pager;

@Service
@Transactional
public class ProjectService {

	@Autowired
	ProjectMapper projectMapper;

	//创建项目
	public void insertProject(Project project){
		
		projectMapper.insertProject(project);
	}
	
	public void updateByPrimaryKeySelective(Project project){
		projectMapper.updateByPrimaryKeySelective(project);
	}
	
	public void editProflag(){
		Date currentdate = new Date();
	       //比较当前时间与项目截止时间

	
        List<Project> allproject = selectAllProject();
 
		for (Project p : allproject) {
			String ptime = p.getPro_eva_deadline();
			Integer pro_id = p.getPro_id();
			SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date projecttime = null;
			
			
				try {
					projecttime = formater.parse(ptime);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			//比较
			boolean flag = projecttime.before(currentdate);
		    if(flag){	
		    	p.setPro_flag(2);
		    	p.setPro_id(pro_id);
		    	projectMapper.updateByPrimaryKeySelective(p);
  	    }
		}
	}
	
   public Project selectByName(String pro_name){
	   
	   Project project = projectMapper.selectByName(pro_name);
		
		return project;
	}
   public Project selectByPrimaryKey(Integer pro_id){
	   
	   Project project = projectMapper.selectByPrimaryKey(pro_id);
	   
	   return project;
   }
   //查询项目
   public List<Project> selectAllProject(){
	   
	   List<Project> projects = projectMapper.selectallProject();
		
		return projects;
   }
   public List<Project> listAllProByPage(Pager pager){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", pager.getStart());
		map.put("pagesize", pager.getPageSize());
		List<Project> pros = projectMapper.listAllProByPage(map);

		return pros;
	}
//   public List<Project> listByProflag(Pager pager,Integer pro_flag){
//		HashMap<String, Integer> map = new HashMap<String, Integer>();
//		map.put("start", pager.getStart());
//		map.put("pagesize", pager.getPageSize());
//		map.put("pro_flag", pro_flag);
//		List<Project> pros = projectMapper.listByProflagPage(map);
//
//		return pros;
//	}
   //查询待评估项目
   public List<Project> selectNoEvaProject(){
	   
	   List<Project> projects1 = projectMapper.selectByProflag(1);
		
		return projects1;
   }
   public List<Project> listNoEvaByProflag(Pager pager){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", pager.getStart());
		map.put("pagesize", pager.getPageSize());
		map.put("pro_flag", 1);
		List<Project> pros = projectMapper.listByProflagPage(map);

		return pros;
	}

   //查询评估截止项目
   public List<Project> selectEvaProject(){
	   
	   List<Project> projects2 = projectMapper.selectByProflag(2);
		
		return projects2;
   }
   
   public List<Project> listEvaByProflag(Pager pager){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", pager.getStart());
		map.put("pagesize", pager.getPageSize());
		map.put("pro_flag", 2);
		List<Project> pros = projectMapper.listByProflagPage(map);

		return pros;
	}
   //查询评估通过项目
   public List<Project> selectPassProject(){
	   
	   List<Project> projects3 = projectMapper.selectByProflag(2);
	   
	   List<Project> newprojects = new ArrayList<Project>();
	   
	   for(int i=0;i<projects3.size();i++){
		   
		   Project p = new Project();
		   p= projects3.get(i);
		   double d1 = p.getPro_evalue();
		   if(d1 >= 8.00){
			   newprojects.add(p);
		   }
	   }
	   
		return newprojects;
   }
   //查询评估通过项目
   public List<Project> listPassProject(Pager pager){
	   
	   HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", pager.getStart());
		map.put("pagesize", pager.getPageSize());
		map.put("pro_flag", 2);
		List<Project> projects3 = projectMapper.listByProflagPage(map);
	   
	   List<Project> newprojects = new ArrayList<Project>();
	   
	   for(int i=0;i<projects3.size();i++){
		   
		   Project p = new Project();
		   p= projects3.get(i);
		   double d1 = p.getPro_evalue();
		   if(d1 >= 8.00){
			   newprojects.add(p);
		   }
	   }
	   
		return newprojects;
   }
   
   //查询评估未通过项目
   public List<Project> selectNoPassProject(){
	   
       List<Project> projects4 = projectMapper.selectByProflag(2);
	   
	   List<Project> newprojects1 = new ArrayList<Project>();
	   
	   for(int i=0;i<projects4.size();i++){
		   
		   Project pro = new Project();
		   pro= projects4.get(i);
		   double d2 = pro.getPro_evalue();
		   if(d2 < 8.00){
			   newprojects1.add(pro);
		   }
	   }
	   
	   return newprojects1;
   }
   
   //查询评估未通过项目
   public List<Project> listNoPassProject(Pager pager){
	   
	   HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", pager.getStart());
		map.put("pagesize", pager.getPageSize());
		map.put("pro_flag", 2);
		List<Project> projects4 = projectMapper.listByProflagPage(map);
		
	   List<Project> newprojects1 = new ArrayList<Project>();
	   
	   for(int i=0;i<projects4.size();i++){
		   
		   Project pro = new Project();
		   pro= projects4.get(i);
		   double d2 = pro.getPro_evalue();
		   if(d2 < 8.00){
			   newprojects1.add(pro);
		   }
	   }
	   
	   return newprojects1;
   }

   
}
