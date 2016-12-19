package com.vcevaluation.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.MultipartStream.MalformedStreamException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.vcevaluation.pojo.Eva_expert;
import com.vcevaluation.pojo.Paper;
import com.vcevaluation.pojo.Result;
import com.vcevaluation.pojo.Resultprovider;
import com.vcevaluation.pojo.Upload;
import com.vcevaluation.pojo.User;
import com.vcevaluation.service.UploadService;
import com.vcevaluation.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	UploadService uploadService;

	User user = new User();
	@RequestMapping(value = "/toAboutMe")
	public String toAboutMe(){
		return "aboutMe";
	}
	
	@RequestMapping("/toadlogin")
	public String toAddproject() {

		return "adPage/Login";
	}
	
	 private String makeFileName2(String filename){  //2.jpg
	        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
	         return UUID.randomUUID().toString() + "_" + filename;
	      }
	

	
	//管理员对用户操作的部分先不写了
	////////////////////////////////
	////////////////////////////////////
	/////////////////////////////////////
	////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 查看个人信息
	 * @author 
	 */
	@RequestMapping("/userInfo")
	public String userInfo(HttpServletRequest req, Model model){
     	User userr = (User) req.getSession().getAttribute("user");
//		User userr = userService.selectByPrimaryKey(user.getUser_id());

		int user_id = userr.getUser_id();
		User user = userService.selectByPrimaryKey(user_id);
		
		//判断用户角色(基金经理为0，成果提供者为1)
		if(user.getUser_type()==0)
		{
			Eva_expert eva_expert= userService.SelectEva_ex(user_id);
			Resultprovider resultprovider=new Resultprovider();
			model.addAttribute("resultprovider", resultprovider);	
			model.addAttribute("eva_expert", eva_expert);	
		}
		else{
			Eva_expert eva_expert=new Eva_expert();
			Resultprovider resultprovider =userService.SelectResultprovider(user_id);
			model.addAttribute("resultprovider", resultprovider);	
			model.addAttribute("eva_expert", eva_expert);	
			
		}
		model.addAttribute("user", user);	
		
		return "userinfo";

	}
		
	/**
	 * 从查看个人信息页面跳转到修改个人信息页面
	 * @author 
	 */
	@RequestMapping("/toEditUserInfo")
	public String jumpEditUserInfo(HttpServletRequest req,Model model){
		int user_id = Integer.parseInt(req.getParameter("user_id"));
		System.out.println(user_id);
		User user = userService.selectByPrimaryKey(user_id);
		//判断用户角色(基金经理为0，成果提供者为1)
		if(user.getUser_type()==0)
		{
			Eva_expert eva_expert= userService.SelectEva_ex(user_id);
			Resultprovider resultprovider=new Resultprovider();
			model.addAttribute("resultprovider", resultprovider);	
			model.addAttribute("eva_expert", eva_expert);	
		}
		else{
			Eva_expert eva_expert=new Eva_expert();
			Resultprovider resultprovider =userService.SelectResultprovider(user_id);
			model.addAttribute("resultprovider", resultprovider);	
			model.addAttribute("eva_expert", eva_expert);	
			
		}
		model.addAttribute("user", user);	
		return "editUserInfo";
	}
	
	/**
	 * 修改个人信息
	 * @author 
	 */
	@RequestMapping(value="/editUserInfo2")
	public String test1(HttpServletRequest req, Model model){
		System.out.println("editUserInfo：---------------");
		User user = new User();
		int user_id = Integer.parseInt(req.getParameter("user_id"));
		System.out.println("用户ID："+req.getParameter("user_id"));
		System.out.println("---------------");
		int user_type = Integer.parseInt(req.getParameter("user_type"));
		String user_name = req.getParameter("user_name");
		String user_realname = req.getParameter("user_realname");
		
		String user_gender = req.getParameter("user_gender");
		String user_pwd = req.getParameter("user_pwd");
		String user_email = req.getParameter("user_email");
		String user_edu = req.getParameter("user_edu");
		int user_age = Integer.parseInt(req.getParameter("user_age"));
		String user_remark = req.getParameter("user_remark");
		
		user.setUser_id(user_id);
		user.setUser_name(user_name);
		user.setUser_type(user_type);
		user.setUser_pwd(user_pwd);
		user.setUser_realname(user_realname);
		if(user_gender.equals("男")){
			user.setUser_gender(1);
		}
		else if(user_gender.equals("女")){
			user.setUser_gender(2);
		}
		else{
			user.setUser_gender(0);
		}
		user.setUser_email(user_email);
		user.setUser_remark(user_remark);
		user.setUser_age(user_age);
		
		if(user_edu.equals("博士")){
			user.setUser_edu(1);
		}
		else if(user_edu.equals("硕士")){
			user.setUser_edu(2);
		}
		else if(user_edu.equals("本科")){
			user.setUser_edu(3);
		}
		else if(user_edu.equals("本科以下")){
			user.setUser_edu(4);
		}
		else{
			user.setUser_edu(0);
		}
		
		userService.updateByPrimaryKeySelective(user);
		
		Eva_expert eva_expert = new Eva_expert();
		Resultprovider resultprovider = new Resultprovider();
//		if(user_type==0){
		if(user.getUser_type() == 0){
			eva_expert.setEx_id(user.getUser_id());
			String ex_qualification = req.getParameter("ex_qualification");
			String ex_expertise = req.getParameter("ex_expertise");
			String ex_businessfield = req.getParameter("ex_businessfield");
//			eva_expert.setEx_id(user_id);
			eva_expert.setEx_id(user.getUser_id());
			eva_expert.setEx_qualification(ex_qualification);
			eva_expert.setEx_expertise(ex_expertise);
			eva_expert.setEx_businessfield(ex_businessfield);
			userService.updateByPrimaryKey1(eva_expert);
		}
		else{
			resultprovider.setRp_id(user.getUser_id());
			String rp_qualification = req.getParameter("rp_qualification");
			String rp_field = req.getParameter("rp_field");
			String rp_research = req.getParameter("rp_research");
//			resultprovider.setRp_id(user_id);
			resultprovider.setRp_id(user.getUser_id());
			resultprovider.setRp_qualification(rp_qualification);
			resultprovider.setRp_research(rp_research);
			resultprovider.setRp_field(rp_field);
		
			userService.updateByPrimaryKey2(resultprovider);
		}
	
		model.addAttribute("resultprovider", resultprovider);	
		model.addAttribute("eva_expert", eva_expert);	
	    model.addAttribute("user", user);
		return "userinfo";		
	}
	
//	@RequestMapping(value="/editUserInfo1")
//	public String editUserInfo(HttpServletRequest req, Model model, User user,Resultprovider resultprovider,Eva_expert eva_expert){
//		
//		System.out.println("editUserInfo：---------------");
//		System.out.println("用户ID："+req.getParameter("user_id"));
////		int user_id = Integer.parseInt(req.getParameter("user_id"));
////		System.out.println("---------------");
////		int user_type = Integer.parseInt(req.getParameter("user_type"));
////		String user_name = req.getParameter("user_name");
////		String user_realname = req.getParameter("user_realname");
////		int user_gender = Integer.parseInt(req.getParameter("user_gender"));
////		String user_pwd = req.getParameter("user_pwd");
////		String user_email = req.getParameter("user_email");
////		int user_edu = Integer.parseInt(req.getParameter("user_edu"));
////		int user_age = Integer.parseInt(req.getParameter("user_age"));
////		String user_remark = req.getParameter("user_remark");
//		
////		user.setUser_id(user_id);
////		user.setUser_name(user_name);
////		user.setUser_type(user_type);
////		user.setUser_pwd(user_pwd);
////		user.setUser_realname(user_realname);
////		user.setUser_gender(user_gender);
////		user.setUser_email(user_email);
////		user.setUser_remark(user_remark);
////		user.setUser_age(user_age);
////		user.setUser_edu(user_edu);
//		userService.updateByPrimaryKeySelective(user);
//		
////		User user=new User();
//		
//		System.out.println("修改" + user.getUser_name()+"的个人信息");
//	
//
//		userService.updateByPrimaryKey(user);
////		if(user_type==0){
//		if(user.getUser_type() == 0){
//			eva_expert.setEx_id(user.getUser_id());
////			String ex_qualification = req.getParameter("ex_qualification");
////			String ex_expertise = req.getParameter("ex_expertise");
////			String ex_businessfield = req.getParameter("ex_businessfield");
//////			eva_expert.setEx_id(user_id);
////			eva_expert.setEx_id(user.getUser_id());
////			eva_expert.setEx_qualification(ex_qualification);
////			eva_expert.setEx_expertise(ex_expertise);
////			eva_expert.setEx_businessfield(ex_businessfield);
//			userService.updateByPrimaryKey1(eva_expert);
//		}
//		else{
//			resultprovider.setRp_id(user.getUser_id());
////			String rp_qualification = req.getParameter("rp_qualification");
////			String rp_field = req.getParameter("rp_field");
////			String rp_research = req.getParameter("rp_research");
//////			resultprovider.setRp_id(user_id);
////			resultprovider.setRp_id(user.getUser_id());
////			resultprovider.setRp_qualification(rp_qualification);
////			resultprovider.setRp_research(rp_research);
////			resultprovider.setRp_field(rp_field);
//		
//			userService.updateByPrimaryKey2(resultprovider);
//		}
//	
//		model.addAttribute("resultprovider", resultprovider);	
//		model.addAttribute("eva_expert", eva_expert);	
//	    model.addAttribute("user", user);
//		return "userinfo";		
//	}
	
	/**导航栏直接进修改个人信息页面
	 * 修改个人信息页面-显示个人信息
	 * @author 
	 */
	@RequestMapping(value="/showUserInfo")
	public String showUserInfo(HttpServletRequest req, Model model){
		
		User userr = (User) req.getSession().getAttribute("user");
//		User userr = userService.selectByPrimaryKey(user.getUser_id());
		int user_id = userr.getUser_id();
		User user = userService.selectByPrimaryKey(user_id);
		
		//判断用户角色(基金经理为0，成果提供者为1)
		if(user.getUser_type()==0)
		{
			Eva_expert eva_expert= userService.SelectEva_ex(user_id);
			Resultprovider resultprovider=new Resultprovider();
			model.addAttribute("resultprovider", resultprovider);	
			model.addAttribute("eva_expert", eva_expert);	
		}
		else{
			Eva_expert eva_expert=new Eva_expert();
			Resultprovider resultprovider =userService.SelectResultprovider(user_id);
			model.addAttribute("resultprovider", resultprovider);	
			model.addAttribute("eva_expert", eva_expert);	
			
		}
		model.addAttribute("user", user);	
		return "editUserInfo";
	}
	
	/**
	 * 根据email查询用户是否存在
	 * @author
	 * @throws IOException 
	 */
	@RequestMapping(value="/getEmailValidation")
	public void getEmailValidation(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		
		String email = req.getParameter("u_email");
		User user2 = userService.selectByEmail(email);
		
		PrintWriter out = resp.getWriter();//????
		if(user2 == null){
			System.out.println("邮箱重复验证：" + email + "的用户不存在");
			out.print("success");
		}else{
			System.out.println("邮箱重复验证：" + email + "的用户存在"+user2.toString());
			out.print("failure");
		}
	}
		
	/**
	 * 根据用户名查询用户是否存在
	 * @author 
	 */
	@RequestMapping(value="/getNameValidation")
	public void getNameValidation(HttpServletRequest req, HttpServletResponse res) throws IOException{
		
		String name = req.getParameter("u_name");
		User user3 =userService.selectByName(name);
		
		PrintWriter out = res.getWriter();
		if(user3 != null){
			System.out.println("用户名重复验证：" + name + "的用户存在");
			out.print("success");
		}else{
			out.print("failure");
		}
	}
	
	/**
	 * 用户注册
	 * @author 
	 */
	@RequestMapping("/userRegister")
	public String userRegister(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		System.out.print("asdasd");
		String u_name = new String(req.getParameter(("u_name")).getBytes("ISO-8859-1"),"utf-8");
		String u_realname = req.getParameter("u_realname");
		String u_remark = req.getParameter("u_remark");
		String u_email = new String(req.getParameter(("u_email")).getBytes("ISO-8859-1"),"utf-8");
		int u_gender = Integer.parseInt(req.getParameter("u_gender"));
		int u_edu = Integer.parseInt(req.getParameter("u_edu"));
		int u_age = Integer.parseInt(req.getParameter("u_age"));
		String u_pwd = req.getParameter("u_pwd");
		int u_type = Integer.parseInt(req.getParameter("identify"));
		String ex_expertise = req.getParameter("ex_expertise");
//		int ex_expertise = Integer.parseInt(req.getParameter("ex_expertise"));
		String ex_qualification = req.getParameter("ex_qualification");
		String ex_businessfield = req.getParameter("ex_businessfield");
		String rp_qualification =  new String(req.getParameter(("rp_qualification")).getBytes("ISO-8859-1"),"utf-8");
		String rp_field =  new String(req.getParameter(("rp_field")).getBytes("ISO-8859-1"),"utf-8");
		String rp_research = req.getParameter("rp_research");
		
	//	System.out.print("000000000000000000000000");
		
		User user= new User();
		user.setUser_name(u_name);
		user.setUser_realname(u_realname);
		user.setUser_pwd(u_pwd);
		user.setUser_remark(u_remark);
		user.setUser_email(u_email);
		user.setUser_gender(u_gender);
		user.setUser_edu(u_edu);
		user.setUser_age(u_age);
		user.setUser_type(u_type);
		user.setUser_flag(0);//该用户为未激活状态
		
		//String contentRange = req.getHeader("Content-Range");  
		FileOutputStream out=null;
		InputStream in=null;
		Enumeration enum1 = req.getHeaderNames();  

		String message = "";
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				req.getSession().getServletContext());
		if (multipartResolver.isMultipart(req)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;
			//System.out.println(req.getParameter("username"));
			String upload_name=u_name;
		//	upload_name = multiRequest.getParameter("username");
			
			String savePath = "E:/uploadUser"+"/"+upload_name;
			//System.out.print(savePath);
			File File_dir = new File(savePath);
			if(!File_dir.exists()){
				File_dir.mkdirs();
			}
			//System.out.print("name:"+upload_name);
			Iterator<String> iter = multiRequest.getFileNames();
			
			while (iter.hasNext()) {
				 Date date = new Date();
			 	 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				 String time=format.format(date);
				 String tmp = iter.next();
				//System.out.println("item:"+tmp);
				 MultipartFile file = multiRequest.getFile((String) tmp);
				 if (file != null) {
					String fileName = file.getOriginalFilename();
//					int index = fileName.indexOf(".");
//					String tmp1= fileName.substring(0, index);
//					String tmp2 = fileName.substring(index);
//					String file_name = makeFileName(tmp1+time+tmp2);
					//System.out.print(file_name);
					Upload upload = new Upload();
					String uniquefilename=makeFileName2(fileName);
					upload.setUpload_name(uniquefilename);
					upload.setUpload_time(time);
					upload.setUpload_author(upload_name);
					upload.setUpload_type("用户注册凭证上传");
					uploadService.insert(upload);
					//System.out.print("2222222222222222222");
					Integer up_id=uploadService.selectUploadByName(uniquefilename).getUpload_id();
					user.setUser_url(up_id);
					if(userService.userRegister(user)){
						Integer u_id = userService.selectByName(u_name).getUser_id();
						if (u_type==0)//基金经理
						{
							Eva_expert eva_ex = new Eva_expert();
							eva_ex.setEx_id(u_id);
							eva_ex.setEx_expertise(ex_expertise);
							eva_ex.setEx_businessfield(ex_businessfield);
							eva_ex.setEx_qualification(ex_qualification);
							userService.InsertEva_ex(eva_ex);
						}
						else //成果提供者
						{
							//System.out.print("4444444444");
							Resultprovider resultprovider = new Resultprovider();
							resultprovider.setRp_id(u_id);
							resultprovider.setRp_qualification(rp_qualification);
							resultprovider.setRp_field(rp_field);
							resultprovider.setRp_research(rp_research);
							userService.InsertResultprovider(resultprovider);
						}
					
					}
					//System.out.print("333333333333333333");
					try{
					out = new FileOutputStream(savePath + "\\"+fileName);
					byte buffer[] = new byte[1024];
					int len = 0;
				    in = file.getInputStream();
					while((len=in.read(buffer))>0){
		             //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
						out.write(buffer, 0, len);
					}
						in.close();
					}
					catch(MalformedStreamException e){
						//System.out.print("haoge");
						out.flush();	
					}
					catch(Exception e){	
						System.out.print("error");
					//	return "error";
						return "login";
				
					}	
			  }
		 }
		out.close();
		message = "上传成功";
		//System.out.print("message");
		req.setAttribute("message",message);	 
		}
		//System.out.print("suc");
		return "login";
	
	}
	
	/**
	 * 登录
	 * @param req
	 * @param resp
	 * @throws Exception
	 * @author 
	 */
	@RequestMapping(value = "/checkUsernamePwd")
	public void checkUsernamePwd(HttpServletRequest req, HttpServletResponse resp,Model model) throws Exception{
		String username = req.getParameter("u_name");
		String userpwd = req.getParameter("u_pwd");

		User user = userService.userLogin(username, userpwd);
		PrintWriter out = resp.getWriter();		
			if(user != null){
				user = userService.selectByName(user.getUser_name());
				//System.out.println("登录:用户ID：" + user.getU_id());

				//req.getSession().setAttribute("u_id", user.getU_id());
				req.getSession().setAttribute("user", user);
				//System.out.println(user.toString());
				out.print("success");
				model.addAttribute("flag", 1);
				model.addAttribute("u_name", username);
				model.addAttribute("u_pwd", userpwd);
			}else{
				out.print("failure");
				model.addAttribute("flag", 2);
				model.addAttribute("u_name", username);
				model.addAttribute("u_pwd", userpwd);
			}
	}
	
	@RequestMapping(value = "/login")
	public String login(){
		return "redirect:toIndex";
	}
	@RequestMapping(value = "/login1")
	public String login1(){
		return "redirect:toIndex";
	}
	@RequestMapping(value = "/register")
	public String register(){
		return "register";
	}
	
	@RequestMapping(value = "/userLogout")
	public String userLogout(HttpServletRequest req){
		req.getSession().removeAttribute("user");
		return "redirect:u_login.jsp";
	}
}
