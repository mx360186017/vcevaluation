package com.vcevaluation.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.MultipartStream.MalformedStreamException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.vcevaluation.mapping.ResproMapper;
import com.vcevaluation.pojo.Member;
import com.vcevaluation.pojo.Project;
import com.vcevaluation.pojo.Respro;
import com.vcevaluation.pojo.Result;
import com.vcevaluation.pojo.Team;
import com.vcevaluation.pojo.Upload;
import com.vcevaluation.pojo.User;
import com.vcevaluation.service.ProjectService;
import com.vcevaluation.service.ResproService;
import com.vcevaluation.service.TeamService;
import com.vcevaluation.service.UploadService;
import com.vcevaluation.service.UserService;
import com.vcevaluation.utils.Pager;

import java.util.Iterator;

@Controller
public class ProjectController {

	
	@Autowired 
	ProjectService projectService;
	@Autowired 
	ResproService resproService;
	@Autowired 
	UserService userService;
	@Autowired 
	TeamService teamService;
	@Autowired
	UploadService uploadService;
	private Integer[] ids;
	
	public Integer[] getIds() {
		return ids;
	}

	public void setIds(Integer[] ids) {
		this.ids = ids;
	}

	@RequestMapping("/toIndex")
	public String toIndex(Model model) {
		projectService.editProflag();
		List<Project> pros = projectService.selectAllProject();
		Map<Integer,String> usermap = new HashMap<Integer,String>();
		List<Map<String, Object>> allmember = teamService.selectTeamMember();
		for (Map<String,Object> map : allmember) {
			System.out.println(map.get("member_name"));
		}
//		List<Member> members = teamService.selectAllMember();
		usermap = gerUsermap(pros);
		
		model.addAttribute("usermap",usermap);
		model.addAttribute("pros",pros);
		model.addAttribute("allmember",allmember);
//		model.addAttribute("members",members);
		return "index";
	}
	
	@RequestMapping("/toAddproject")
	public String toAddproject() {

		return "addproject";
	}
	public  String getCurrentDate1(Date date){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间显示格式
		String str = sdf.format(date);//将当前时间格式化为需要的类型
		System.out.println(str);//输出结果
		return str;
	}
/*	*//**
	 * 创建项目
	 * @author 
	 *//*
	@RequestMapping("/creatProject")
	public String creatProject(HttpServletRequest req, Model model){
		System.out.println("``````````````````--------------");
	//	String ids_list = req.getParameter("ids_list");
		String ids_list = req.getParameter("ids_list");
		System.out.println("ids_list:"+ids_list);
		String[] splitIds=ids_list.split(";");
		String pro_name = req.getParameter("pro_name");
		String pro_type = req.getParameter("pro_type");
		String pro_plan = req.getParameter("pro_plan");
		Integer team_id = Integer.parseInt(req.getParameter("team_id"));
		String pro_scheme = req.getParameter("pro_scheme");
		int pro_creater = 4;//项目创建者
		int pro_team = team_id;
		int pro_flag = 1;//待评估
		String pro_remark = req.getParameter("pro_remark");
		
		Project project = new Project();
		Respro respro = new Respro();
		
		project.setPro_name(pro_name);
		project.setPro_plan(pro_plan);
		project.setPro_scheme(pro_scheme);
		project.setPro_team(pro_team);
		project.setPro_creater(pro_creater);
		project.setPro_remark(pro_remark);
		project.setPro_flag(pro_flag);
		project.setPro_type(pro_type);
		project.setPro_times(0);
		Date date1= new Date();//创建一个时间对象，获取到当前的时间
		project.setPro_protime(getCurrentDate1(date1));
		project.setPro_evalue(Double.parseDouble("0"));
			
		//先默认一个截止时间，再让管理员填写截至时间
			
		Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date1);
	    calendar.add(Calendar.DAY_OF_MONTH, +10);//+10今天的时间加十天
	    Date date2 = calendar.getTime();
	
	    project.setPro_eva_deadline(getCurrentDate1(date2));
		
		projectService.insertProject(project);
		
		int pro_id=projectService.selectByName(pro_name).getPro_id();
		
		for(int i=0;i<splitIds.length;i++){
			respro.setRpro_pro_id(pro_id);
			respro.setRpro_res_id(Integer.parseInt(splitIds[i]));
			resproService.insertRespro(respro);;
		}
		return "redirect:/selectProject";
	}*/
	
	/**
	 * 查询项目
	 * @author 
	 */
	@RequestMapping("/selectProject")
	public String selecProject(Model model) {
		projectService.editProflag();
		List<Project> allpro = projectService.selectAllProject();
		List<Project> evapro = projectService.selectEvaProject();
		List<Project> noevapro = projectService.selectNoEvaProject();
		model.addAttribute("allpro",allpro);
		model.addAttribute("evapro",evapro);
		model.addAttribute("noevapro",noevapro);
		
		return "selectproject";
	}
	
//	@RequestMapping("/selectAllProject")
//	public String selecAllProject(Model model) {
//		projectService.editProflag();
//		List<Project> allpro1 = projectService.selectAllProject();
//		Map<Integer,String> usermap = new HashMap<Integer,String>();
//		
//		usermap = gerUsermap(allpro1);
//		
//		model.addAttribute("usermap",usermap);
//		model.addAttribute("allpro1",allpro1);
//
//		return "selectAllProject";
//	}
//	
	@RequestMapping("/selectAllProject")
	public String listAllProByPage(HttpServletRequest req,Model model) {
		projectService.editProflag();
		Integer pageNum = Integer.parseInt(req.getParameter("pageNum"));
		Integer recordCount = projectService.selectAllProject().size();
		Pager pager = new Pager(recordCount,pageNum);
		List<Project> pros = projectService.listAllProByPage(pager);
		Map<Integer,String> usermap = new HashMap<Integer,String>();
		
		usermap = gerUsermap(pros);
		
		model.addAttribute("usermap",usermap);
		model.addAttribute("pros",pros);
		model.addAttribute("pager",pager);

		return "selectAllProject";
	}
	
//	@RequestMapping("/selectEvaProject")
//	public String selectEvaProject(Model model) {
//		projectService.editProflag();
//		List<Project> evapro1 = projectService.selectEvaProject();
//		Map<Integer,String> usermap = new HashMap<Integer,String>();
//        usermap = gerUsermap(evapro1);
//		
//		model.addAttribute("usermap",usermap);
//		model.addAttribute("evapro1",evapro1);
//
//		return "selectEvaProject";
//	}
	@RequestMapping("/selectEvaProject")
	public String selectEvaProject(HttpServletRequest req,Model model) {
		projectService.editProflag();
		Integer pageNum = Integer.parseInt(req.getParameter("pageNum"));
		Integer recordCount = projectService.selectEvaProject().size();
		Pager pager = new Pager(recordCount,pageNum);
		List<Project> evapro1 = projectService.listEvaByProflag(pager);
		Map<Integer,String> usermap = new HashMap<Integer,String>();
        usermap = gerUsermap(evapro1);
		
		model.addAttribute("usermap",usermap);
		model.addAttribute("evapro1",evapro1);
		model.addAttribute("pager",pager);

		return "selectEvaProject";
	}
	
	@RequestMapping("/selectNoEvaProject")
	public String selectNoEvaProject(HttpServletRequest req,Model model) {
		projectService.editProflag();
		Integer pageNum = Integer.parseInt(req.getParameter("pageNum"));
		Integer recordCount = projectService.selectNoEvaProject().size();
		Pager pager = new Pager(recordCount,pageNum);
		List<Project> noevapro1 = projectService.listNoEvaByProflag(pager);
		Map<Integer,String> usermap = new HashMap<Integer,String>();
        usermap = gerUsermap(noevapro1);
		
		model.addAttribute("usermap",usermap);
		model.addAttribute("noevapro1",noevapro1);
		model.addAttribute("pager",pager);

		return "selectNoEvaProject";
	}
	
	@RequestMapping("/selectPassProject")
	public String selectPassProject(HttpServletRequest req,Model model) {
		projectService.editProflag();
		Integer pageNum = Integer.parseInt(req.getParameter("pageNum"));
		Integer recordCount = projectService.selectPassProject().size();
		Pager pager = new Pager(recordCount,pageNum);
		List<Project> passpro = projectService.listPassProject(pager);
		Map<Integer,String> usermap = new HashMap<Integer,String>();
        usermap = gerUsermap(passpro);
		
		model.addAttribute("usermap",usermap);
		model.addAttribute("passpro",passpro);
		model.addAttribute("pager",pager);

		return "selectPassProject";
	}
	
	@RequestMapping("/selectNoPassProject")
	public String selectNoPassProject(HttpServletRequest req,Model model) {
		projectService.editProflag();
		Integer pageNum = Integer.parseInt(req.getParameter("pageNum"));
		Integer recordCount = projectService.selectNoPassProject().size();
		Pager pager = new Pager(recordCount,pageNum);
		List<Project> nopasspro = projectService.listNoPassProject(pager);
		Map<Integer,String> usermap = new HashMap<Integer,String>();
        usermap = gerUsermap(nopasspro);
		
		model.addAttribute("usermap",usermap);
		model.addAttribute("nopasspro",nopasspro);
		model.addAttribute("pager",pager);

		return "selectNoPassProject";
	}
	
	@RequestMapping("/projectItem")
	public String projectItem(HttpServletRequest req,Model model) {
		Integer pro_id = Integer.parseInt(req.getParameter("pro_id"));
        Project pro = new Project();
        
		pro = projectService.selectByPrimaryKey(pro_id);
		int team_id = pro.getPro_team();
	//	System.out.println(team_id);
		int user_id = pro.getPro_creater();
		Team team = new Team();
		User user = new User();
		team = teamService.selectByPrimaryKey(team_id);
		user = userService.selectByPrimaryKey(user_id);
	//	System.out.println(team.getTeam_name());
		model.addAttribute("team",team);
		model.addAttribute("user",user);
		model.addAttribute("pro",pro);
		
		return "projectItem";
	}
	
	
	public  Map<Integer,String> gerUsermap(List<Project> allpro2){
		
		Map<Integer,String> usermap1 = new HashMap<Integer,String>();
		User user = new User();
		
		for(int i=0;i < allpro2.size();i++){
			user = userService.selectByPrimaryKey(allpro2.get(i).getPro_creater());
			usermap1.put(allpro2.get(i).getPro_creater(), user.getUser_name());
		}
		
		return usermap1;
	}
	//文件及图片logo上传

	 private String makeFileName3(String filename){  //2.jpg
		        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
		         return UUID.randomUUID().toString() + "_" + filename;
	}
	@RequestMapping(value = "/toupload")
	public String index(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		return "upload";
	}
	 @RequestMapping(value = "/creatProject")
	public String creatProject(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
			User user = (User) req.getSession().getAttribute("user");
		 System.out.println("``````````````````--------------");
			//	String ids_list = req.getParameter("ids_list");
				String ids_list = req.getParameter("ids_list");
				System.out.println("ids_list:"+ids_list);
				String[] splitIds=ids_list.split(";");
				String pro_name = req.getParameter("pro_name");
				String pro_type = req.getParameter("pro_type");
				String pro_plan = req.getParameter("pro_plan");
				Integer team_id = Integer.parseInt(req.getParameter("team_id"));
				String pro_scheme = req.getParameter("pro_scheme");
				Integer pro_fit = Integer.parseInt(req.getParameter("pro_fit"));
				Integer pro_support = Integer.parseInt(req.getParameter("pro_support"));
				Integer pro_period = Integer.parseInt(req.getParameter("pro_period"));
				Double pro_bank = Double.parseDouble(req.getParameter("pro_bank"));
				Double pro_capital = Double.parseDouble(req.getParameter("pro_capital"));
				Integer pro_lastbenifit = Integer.parseInt(req.getParameter("pro_lastbenifit"));
				int pro_creater = user.getUser_id();//项目创建者
				int pro_team = team_id;
				int pro_flag = 1;//待评估
				String pro_remark = req.getParameter("pro_remark");
				
				Project project = new Project();
				Respro respro = new Respro();
				
				project.setPro_name(pro_name);
				project.setPro_plan(pro_plan);
				project.setPro_scheme(pro_scheme);
				project.setPro_team(pro_team);
				project.setPro_creater(pro_creater);
				project.setPro_remark(pro_remark);
				project.setPro_flag(pro_flag);
				project.setPro_type(pro_type);
				project.setPro_times(0);
				project.setPro_bank(pro_bank);
				project.setPro_capital(pro_capital);
				project.setPro_fit(pro_fit);
				project.setPro_lastbenifit(pro_lastbenifit);
				project.setPro_period(pro_period);
				project.setPro_support(pro_support);
				Date date1= new Date();//创建一个时间对象，获取到当前的时间
				project.setPro_protime(getCurrentDate1(date1));
				project.setPro_evalue(Double.parseDouble("0"));
					
				//先默认一个截止时间，再让管理员填写截至时间
					
				Calendar calendar = Calendar.getInstance();
			    calendar.setTime(date1);
			    calendar.add(Calendar.DAY_OF_MONTH, +10);//+10今天的时间加十天
			    Date date2 = calendar.getTime();
			
			    project.setPro_eva_deadline(getCurrentDate1(date2));
				
			    String contentRange = req.getHeader("Content-Range");  
				FileOutputStream out=null;
				InputStream in=null;
			//	String nmb = req.getHeader("Content-Language");
			//	System.out.print("tou:  "+contentRange+"  "); 
				   Enumeration enum1 = req.getHeaderNames();  
				      
				    
//				    while(enum1.hasMoreElements()){  
//				        String key = (String)enum1.nextElement();  
//				        String value = req.getHeader(key);  
//				       System.out.println(key + ":" + value);  
//				    }  
//				FileUtils.
				String message = "";
				CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
						req.getSession().getServletContext());
				if (multipartResolver.isMultipart(req)) {
					MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;
					//System.out.println(req.getParameter("username"));
					String upload_name="projectFile";
				//	upload_name = multiRequest.getParameter("username");
					
					String savePath = "E:/upload"+"/"+upload_name;
					System.out.print(savePath);
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
							Upload upload = new Upload();
							String uniquefilename=makeFileName3(fileName);
							upload.setUpload_name(uniquefilename);
							upload.setUpload_time(time);
							upload.setUpload_author(upload_name);
 						    upload.setUpload_type("项目文件上传");
							uploadService.insert(upload);
							System.out.print("2222222222222222222");
							Integer up_id=uploadService.selectUploadByName(uniquefilename).getUpload_id();
							project.setPro_remark(up_id+"");
							System.out.print("333333333333333333");
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
								System.out.print("haoge");
								out.flush();	
							}
							catch(Exception e){	
								return "error";
							}	
					  }
				 }
		out.close();
		projectService.insertProject(project);
		
		int pro_id=projectService.selectByName(pro_name).getPro_id();
		
		for(int i=0;i<splitIds.length;i++){
			respro.setRpro_pro_id(pro_id);
			respro.setRpro_res_id(Integer.parseInt(splitIds[i]));
			resproService.insertRespro(respro);;
		}
		message = "上传成功";
		req.setAttribute("message",message);	 
		System.out.println("pro_id::"+pro_id);
		model.addAttribute("pro_id",pro_id);
		}
		
		return "uploadImage";
	} 
	
	 
		//验证项目名称是否存在
		@RequestMapping(value="/getPronameValidation")
		public void getRnameValidation(HttpServletRequest req, HttpServletResponse resp) throws IOException{
			String pro_name = new String(req.getParameter("pro_name").getBytes("ISO-8859-1"),"utf-8");
			
			Project project = projectService.selectByName(pro_name);
			PrintWriter out = resp.getWriter();//????
			if(project == null){
				System.out.println("成果名称重复验证：" + pro_name + "的项目名称不存在");
				out.print("success");
			}else{
				System.out.println("成果名称重复验证：" + pro_name + "的项目名称存在"+project.toString());
				out.print("failure");
			}
		}
		
		
		@RequestMapping("uploadImage")
		public String uploadImage(HttpServletRequest request,Model model) throws IllegalStateException, IOException{
			long startTime = System.currentTimeMillis();
			Integer pro_id = Integer.parseInt(request.getParameter("pro_id"));
			System.out.println("2:pro_id::"+pro_id);
			Project project = projectService.selectByPrimaryKey(pro_id);
			String pro_name = project.getPro_name();
//			Project project = new Project();
			String imagePath = null;
			// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
					request.getSession().getServletContext());
			// 检查form中是否有enctype="multipart/form-data"
			if (multipartResolver.isMultipart(request)) {
				// 将request变成多部分request
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
				// 获取multiRequest 中所有的文件名
				java.util.Iterator<String> iter = multiRequest.getFileNames();

				while (iter.hasNext()) {
					// 一次遍历所有文件
					MultipartFile file = multiRequest.getFile(iter.next().toString());
					if (file != null) {
						String path = "D:\\workspace\\vcevaluation\\src\\main\\webapp\\static\\adStyle\\img\\"+pro_name+"-" + file.getOriginalFilename();
						// 上传
						imagePath = pro_name+"-"+ file.getOriginalFilename();
						
						project.setPro_type(imagePath);
						System.out.println(imagePath);
						projectService.updateByPrimaryKeySelective(project);
						model.addAttribute("imagePath", imagePath);
						System.out.println(path);
						file.transferTo(new File(path));
					}

				}

			}
			long endTime = System.currentTimeMillis();
			System.out.println("方法三的运行时间：" + String.valueOf(endTime - startTime) + "ms");
			return "redirect:selectAllProject?pageNum=1";
		}
		
		@RequestMapping(value = "/downloadpro")
		public String index4(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
			
			Integer upload_id = Integer.parseInt(req.getParameter("upload_id"));
			String download_name1 = uploadService.select(upload_id).getUpload_name();
			int index= download_name1.lastIndexOf("_");
			String download_name = download_name1.substring(index+1);
			String author_name = uploadService.select(upload_id).getUpload_author();
			String path = "E:/upload"+"/"+"projectFile";
			//List<Upload>list= uploadService.selectname();
			System.out.println(path);
			String arr[]=(new File(path).list());
			File file = new File(path+"\\"+download_name);
			System.out.println(path+"\\"+download_name);
			if(!file.exists()){
				System.out.println("该文件已被删除");
				return "error";
			}
			else{
				 res.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(download_name, "UTF-8"));
				 FileInputStream in = new FileInputStream(path+"\\"+download_name);
				 OutputStream out = res.getOutputStream();
				 byte buffer[] = new byte[1024];
				         int len = 0;
				          //循环将输入流中的内容读取到缓冲区当中
				          while((len=in.read(buffer))>0){
				              //输出缓冲区的内容到浏览器，实现文件下载
				              out.write(buffer, 0, len);
				          }
				          //关闭文件输入流
				          in.close();
				          //关闭输出流
				          out.close();
				          System.out.println("下载成功");
				         //Thread.sleep(10000);
				         // req.getRequestDispatcher("/upload").forward(req, res);
				          return null;
			}
		}
}
