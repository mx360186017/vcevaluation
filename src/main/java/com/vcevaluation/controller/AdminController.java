package com.vcevaluation.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vcevaluation.mapping.FactorMapper;
import com.vcevaluation.pojo.Admin;
import com.vcevaluation.pojo.Factor;
import com.vcevaluation.pojo.Index1;
import com.vcevaluation.pojo.User;
import com.vcevaluation.service.AdminService;
import com.vcevaluation.service.FactorService;
import com.vcevaluation.service.ProjectService;
import com.vcevaluation.service.ResultService;
import com.vcevaluation.service.UploadService;
import com.vcevaluation.service.UserService;


@Controller
public class AdminController {

	
		@Autowired
		UserService userService;
		@Autowired
		UploadService uploadService;
		@Autowired
		AdminService adminService;
		@Autowired
		FactorService factorService;
		@Autowired
		FactorMapper factorMapper;
		@Autowired
		ResultService resultService;
		@Autowired
		ProjectService projectService;
		/*
		 * 管理员登录
		 */
		@RequestMapping("ad_login")
		public String ADLogin(){

			return "adPage/adminManage";
		}
		@RequestMapping("ad_indicator")
		public String ADIndicator(){

			return "adPage/a_indicatorManage";
		}
		@RequestMapping(value = "/checkAdminnamePwd")
		public void checkAdminnamePwd(HttpServletRequest req, HttpServletResponse resp,Model model) throws Exception{
			String a_name = req.getParameter("a_name");
			String a_pwd = req.getParameter("a_pwd");

			Admin admin = adminService.adminLogin(a_name, a_pwd);
			PrintWriter out = resp.getWriter();		
				if(admin != null){
					admin = adminService.selectByName(a_name);
					//System.out.println("登录:用户ID：" + user.getU_id());
					//req.getSession().setAttribute("u_id", user.getU_id());
					//req.getSession().setAttribute("user", user);
					System.out.println(admin.toString());
					out.print("success");
					model.addAttribute("a_name", a_name);
					model.addAttribute("a_pwd", a_pwd);
				}else{
					out.print("failure");
					model.addAttribute("a_name", a_name);
					model.addAttribute("a_pwd", a_pwd);
				}
				
		}
		
	    /*
	     * 管理员注册
	     */
	    @RequestMapping("ADRigist")
	    public String ADRigist(){
	    	return "adPage/regist";
	    }
		@RequestMapping("ADRigist1")
	    public String ADRigist1(){
	    	return "";
	    }
		@RequestMapping("home")
		public String homePage(){
			return "adPage/home";
		}
	   
		@RequestMapping("selectIndexFactor")
		public String selectIndexFactor(Model model){
			DecimalFormat df = new DecimalFormat("0.00"); 
			List<Index1> indexs = factorService.selectBytype("3");
			for (Index1 index1 : indexs) {
				Double double1 = Double.parseDouble(index1.getIndex_remark()) * 100;
				index1.setIndex_remark(df.format(double1));
			}
			Factor factor = new Factor();
			factor.setFactor_remark("最终指标");
			List<Factor> factors = factorService.selectByindexParameter(factor);
 			for (Factor factor2 : factors) {
 				Double double2 = factor2.getFactor_weight() * 100;
 				factor2.setFactor_weight(Double.parseDouble(df.format(double2)));
			}
			
			model.addAttribute("indexs", indexs);
			model.addAttribute("factors", factors);
			return "adPage/a_indicatorManage";
		}
		
		
		@RequestMapping("addIndicator")
	    public String addIndicator(HttpServletRequest req) throws UnsupportedEncodingException{
			req.setCharacterEncoding("utf-8");
			String index_name = req.getParameter("index_name");
			String index_weight = req.getParameter("index_weight");
			String option = req.getParameter("option");
			String optionFather = req.getParameter("optionFather");
			
			int option1 = Integer.parseInt(option);
			int index_id = Integer.parseInt(optionFather);
			
			
			if (option1 == 1){
				Index1 index1 = new Index1();
				index1.setIndex_name(index_name);
				index1.setIndex_remark(index_weight);
				index1.setIndex_type(3+"");
				index1.setParent_id(0);
				factorService.insertIndex(index1);
			}
			else{
				Factor factor = new Factor();
				factor.setFactor_index_id(index_id);
				factor.setFactor_name(index_name);
				factor.setFactor_weight(Double.parseDouble(index_weight));
				factor.setFactor_remark("最终指标");
				factorService.insertFactor(factor);
			}
	    	return "redirect:selectIndexFactor";
	    }
		
		@RequestMapping("editIndicator1")
		public String editIndicator1(HttpServletRequest req)throws UnsupportedEncodingException{
			req.setCharacterEncoding("utf-8");
			String index_name1 = req.getParameter("index_name1");
			String index_weight1 = req.getParameter("index_weight1");
			int index_id1 = Integer.parseInt(req.getParameter("index_id1"));
			Index1 index1 = new Index1();
			index1.setIndex_id(index_id1);
			index1.setIndex_name(index_name1);
			index1.setIndex_remark(index_weight1);
			//编辑
			factorService.updateIndex(index1);
			return "redirect:selectIndexFactor";
		}
		
		@RequestMapping("editIndicator2")
		public String editIndicator2(HttpServletRequest req)throws UnsupportedEncodingException{
			req.setCharacterEncoding("utf-8");
			String index_name2 = req.getParameter("index_name2");
			String index_weight2 = req.getParameter("index_weight2");
			String optionFather = req.getParameter("optionFather2");
			int index_id2 = Integer.parseInt(req.getParameter("index_id2"));
			//编辑
			Factor factor = new Factor();
			factor.setFactor_id(index_id2);
			factor.setFactor_name(index_name2);
			factor.setFactor_weight(Double.parseDouble(index_weight2));
			
			factorService.updateFactor(factor);
			return "redirect:selectIndexFactor";
		}
		@RequestMapping("eCharts")
		public String eCharts(Model model){
			//成果
			List<Integer> listNum_results = new LinkedList<Integer>(); 
			listNum_results.add(resultService.selectByResType(1).size());
			listNum_results.add(resultService.selectByResType(2).size());
			listNum_results.add(resultService.selectByResType(3).size());
			
			//成果
			List<Integer> listNum_projects = new LinkedList<Integer>();
			listNum_projects.add(projectService.selectAllProject().size());
			listNum_projects.add(projectService.selectNoPassProject().size());
			listNum_projects.add(projectService.selectPassProject().size());
			listNum_projects.add(projectService.selectEvaProject().size());
			listNum_projects.add(projectService.selectNoEvaProject().size());
			
			//用户
			List<Integer> listNum_users = new LinkedList<Integer>();
			listNum_users.add(userService.queryUsers().size()-userService.queryByUsertype(0).size()-userService.queryByUsertype(1).size());
			listNum_users.add(userService.queryByUsertype(0).size());
			listNum_users.add(userService.queryByUsertype(1).size());
			
			//项目指标
			List<Index1> indexs = factorService.selectBytype("3");
			List<Factor> factors0 = factorMapper.selectByindex(11);
			List<Factor> factors1 = factorMapper.selectByindex(12);
			List<Factor> factors2 = factorMapper.selectByindex(15);
			List<Factor> factors3 = factorMapper.selectByindex(16);
			List<Factor> factors4 = factorMapper.selectByindex(17);
			List<Factor> factors5 = factorMapper.selectByindex(18);
			List<Factor> factors6 = factorMapper.selectByindex(19);
			List<Factor> factors7 = factorMapper.selectByindex(20);
			List<Factor> factors8 = factorMapper.selectByindex(21);
			List<Factor> factors9 = factorMapper.selectByindex(22);
			List<Factor> factors10 = factorMapper.selectByindex(23);
			List<Factor> factors11 = factorMapper.selectByindex(24);
			model.addAttribute("factors0", factors0);
			model.addAttribute("factors1", factors1);
			model.addAttribute("factors2", factors2);
			model.addAttribute("factors3", factors3);
			model.addAttribute("factors4", factors4);
			model.addAttribute("factors5", factors5);
			model.addAttribute("factors6", factors6);
			model.addAttribute("factors7", factors7);
			model.addAttribute("factors8", factors8);
			model.addAttribute("factors9", factors9);
			model.addAttribute("factors10", factors10);
			model.addAttribute("factors11", factors11);
			
			model.addAttribute("listNum_results", listNum_results);
			model.addAttribute("listNum_projects", listNum_projects);
			model.addAttribute("listNum_users", listNum_users);
			return "adPage/eCharts";
		}
}
