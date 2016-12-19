
package com.vcevaluation.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;










import com.vcevaluation.mapping.ResultMapper;
import com.vcevaluation.pojo.Project;
import com.vcevaluation.pojo.Result;
import com.vcevaluation.utils.Pager;

@Service
@Transactional
public class ResultService {

	@Autowired
	ResultMapper resultMapper;

	SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");  

	//提交成果
	public void insertResult(Result result){
		resultMapper.insertResult(result);
	}
	
	//更新全部成果状态（根据当前时间）
	public void editResflag(){
		Date currentdate = new Date();
	       //比较当前时间与项目截止时间

	
     List<Result> allresult = resultMapper.selectResult1();

		for (Result r : allresult) {
			String rtime = r.getRes_eva_deadline();
			Integer res_id = r.getRes_id();
			SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date restime = null;
			
				try {
					restime = formater.parse(rtime);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			//比较
			boolean flag = restime.before(currentdate);
		    if(flag){	
		    	r.setRes_flag(2);
		    	r.setRes_id(res_id);
		    	resultMapper.updateByPrimaryKeySelective(r);
		    }
		}
	}
	
	public void updateByPrimaryKeySelective(Result result){
		resultMapper.updateByPrimaryKeySelective(result);
	}
	
	public Result selectResultByName(String res_name){
		return resultMapper.selectResultByName(res_name);
	}
	
	public Result  selectByPrimaryKey(Integer res_id){
		return resultMapper.selectByPrimaryKey(res_id);
	}
	public List<Result> selectByResflag(Integer res_flag){
    	return resultMapper.selectByResflag(res_flag);
    }
	
	public List<Result> listByResflagPage(Pager pager,Integer res_flag){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", pager.getStart());
		map.put("pagesize", pager.getPageSize());
		map.put("res_flag", res_flag);
		return resultMapper.listByResflagPage(map);
	}
	
	public List<Result> selectByResType(Integer res_type){
    	return resultMapper.selectByResType(res_type);
    }
	
	public List<Result> listByResTypePage(Pager pager,Integer res_type){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", pager.getStart());
		map.put("pagesize", pager.getPageSize());
		map.put("res_type", res_type);
		return resultMapper.listByResTypePage(map);
	}
	//查询全部的成果
	public List<Result> selectAllResult(){

		
		List<Result> pros = resultMapper.selectResult1();
//		for(int i=0;i<pros.size();i++){
//			System.out.println(i+"::"+pros.get(i).getRes_name());
//		}
		return pros;
		
	}
	//查询全部的成果(带分页)
	public List<Result> selectAllResultPage(Pager pager){

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", pager.getStart());
		map.put("pagesize", pager.getPageSize());
		List<Result> pros = resultMapper.selectResult(map);
		for(int i=0;i<pros.size();i++){
			System.out.println(i+"::"+pros.get(i).getRes_name());
		}
		return pros;
		
	}
//	public List<Result> selectNoEvaResult(){
//
//		
//		List<Result> pros = resultMapper.selectResult1();
////		for(int i=0;i<pros.size();i++){
////			System.out.println(i+"::"+pros.get(i).getRes_name());
////		}
//		return pros;
//		
//	}
//	//查询待评估的成果(带分页)
//	public List<Result> selectNoEvaResultPage(Pager pager){
//
//		List<Result> list4 = selectAllResultPage(pager);
//		List<Result> newlist1 = new ArrayList<Result>();
//		
//		for (Result r : list4) {
//			
//			if(r.getRes_flag()==1){
//			
//				newlist1.add(r);
//				System.out.println(r.getRes_name());
//			}
//		}
//	
//		return newlist1;
//		
//	}
//
//	//查询评估截至成果(带分页)
//	public List<Result> selectEvaResultPage(Pager pager){
//
//
//		List<Result> list4 = selectAllResultPage(pager);
//		List<Result> newlist = new ArrayList<Result>();
//		
//		for (Result r : list4) {
//			
//			if(r.getRes_flag()==2){
//			
//				newlist.add(r);
//				System.out.println(r.getRes_name());
//				
//			}
//		}
//
//		return newlist;
//	
//	}
	  //查询评估通过
	   public List<Result> selectPassResult(){
		   
		   List<Result> results = resultMapper.selectByResflag(2);
		   
		   List<Result> newres = new ArrayList<Result>();
		   
		   for(int i=0;i<results.size();i++){
			   
			   Result s = new Result();
			   s= results.get(i);
			   double d1 = s.getRes_evalue();
			   if(d1 >= 8.00){
				   newres.add(s);
			   }
		   }
		   
			return newres;
	   }
	   //查询评估通过
	   public List<Result> listNoPassResult(Pager pager){
		    HashMap <String, Integer> map = new HashMap<String, Integer>();
			map.put("start", pager.getStart());
			map.put("pagesize", pager.getPageSize());
			map.put("res_flag", 2);
			List<Result> res3 = resultMapper.listByResflagPage(map);
		   
		   List<Result> newres1 = new ArrayList<Result>();
		   
		   for(int i=0;i<res3.size();i++){
			   
			   Result r = new Result();
			   r= res3.get(i);
			   double d1 = r.getRes_evalue();
			   if(d1 < 8.00){
				   newres1.add(r);
			   }
		   }
		   
			return newres1;
	   }
	   
	   //查询评估未通过
	   public List<Result> selectNoPassResult(){
		   
		   List<Result> results = resultMapper.selectByResflag(2);
		   
		   List<Result> newres = new ArrayList<Result>();
		   
		   for(int i=0;i<results.size();i++){
			   
			   Result s = new Result();
			   s= results.get(i);
			   double d1 = s.getRes_evalue();
			   if(d1 < 8.00){
				   newres.add(s);
			   }
		   }
		   
			return newres;
	   }
	   //查询评估未通过
	   public List<Result> listPassResult(Pager pager){
		   
		   HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", pager.getStart());
			map.put("pagesize", pager.getPageSize());
			map.put("res_flag", 2);
			List<Result> res3 = resultMapper.listByResflagPage(map);
		   
		   List<Result> newres1 = new ArrayList<Result>();
		   
		   for(int i=0;i<res3.size();i++){
			   
			   Result r = new Result();
			   r= res3.get(i);
			   double d1 = r.getRes_evalue();
			   if(d1 >= 8.00){
				   newres1.add(r);
			   }
		   }
		   
			return newres1;
	   }
	   
}
