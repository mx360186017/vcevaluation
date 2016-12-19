package com.vcevaluation.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.MultipartStream.MalformedStreamException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.vcevaluation.pojo.Eva_expert;
import com.vcevaluation.pojo.Journal;
import com.vcevaluation.pojo.Paper;
import com.vcevaluation.pojo.Patent;
import com.vcevaluation.pojo.Project;
import com.vcevaluation.pojo.Result;
import com.vcevaluation.pojo.Resultprovider;
import com.vcevaluation.pojo.Software;
import com.vcevaluation.pojo.Team;
import com.vcevaluation.pojo.Upload;
import com.vcevaluation.pojo.User;
import com.vcevaluation.service.ResultService;
import com.vcevaluation.service.SoftwareService;
import com.vcevaluation.service.UploadService;
import com.vcevaluation.service.UserService;
import com.vcevaluation.service.PaperService;
import com.vcevaluation.service.PatentService;
import com.vcevaluation.utils.Pager;



@Controller
public class ResultController {
	
	@Autowired 
	UploadService uploadService;
	@Autowired 
	ResultService resultService;
	@Autowired 
	PaperService paperService;
	@Autowired 
	PatentService patentService;
	@Autowired 
	SoftwareService softwareService;
	@Autowired 
	UserService userService;
	
	
	 private String makeFileName(String filename){  //2.jpg
	        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
	         return UUID.randomUUID().toString() + "_" + filename;
	      }
	public  String getCurrentDate(Date date){

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间显示格式
		String str = sdf.format(date);//将当前时间格式化为需要的类型
		System.out.println(str);//输出结果
		return str;
	}
	//测试方法

	
	@RequestMapping("/toaddpatent")
	public String toaddpatent() {

		return "addpatent";
	}
	@RequestMapping("/toaddpaper")
	public String toaddpaper(Model model) {

		List<Journal> journals = paperService.selectallJournal();
		
		for(Journal j : journals) {
			  System.out.println(j.getJ_id()+":"+j.getJ_name());
			}
		
		model.addAttribute("journals",journals);
		
		return "addpaper";
	}
	@RequestMapping("/toaddsoftware")
	public String toaddsoftware() {

		return "addsoftware";
	}

	//上传论文信息及论文附件
	@RequestMapping("/upload1")
	public String insertPaper(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		User user = (User) req.getSession().getAttribute("user");	
		String p_name = req.getParameter("p_name");
		String p_introduction = req.getParameter("p_introduction");
		System.out.println("PPPPPPPPNAME::::::   "+p_name);
		System.out.println("PPPPPPPPINTRO::::::   "+p_introduction);
		String p_time = req.getParameter("p_time");
		int p_cited = Integer.parseInt(req.getParameter("p_cited"));
		int p_publications = Integer.parseInt(req.getParameter("p_publications"));
		int p_category = Integer.parseInt(req.getParameter("p_category"));
		System.out.print("000000000000000000000000");
		Result result= new Result();
		result.setRes_name(p_name);
		//成果类型，1代表论文
		result.setRes_type(1);
		//成果提供者
		result.setRes_provider(user.getUser_id());
		result.setRes_introduction(p_introduction);
		//成果状态为待评估
		result.setRes_flag(1);
		//评估次数为0
		result.setRes_times(0);
		//待评估时间为空，设置提交时间
		Date date1= new Date();//创建一个时间对象，获取到当前的时间
		result.setRes_protime(getCurrentDate(date1));
		result.setRes_evalue(Double.parseDouble("0"));
		
		//先默认一个截止时间，再让管理员填写截至时间
	
		Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date1);
	    calendar.add(Calendar.DAY_OF_MONTH, +10);//+10今天的时间加十天
	    Date date2 = calendar.getTime();
	
		result.setRes_eva_deadline(getCurrentDate(date2));
		
		Paper paper= new Paper();
		System.out.print("111111111111111");
		paper.setPaper_name(p_name);
		paper.setPaper_category(p_category);
		paper.setPaper_cited(p_cited);
		paper.setPaper_pubtime(p_time);
		paper.setPublished_journals(p_publications);
		String contentRange = req.getHeader("Content-Range");  
		FileOutputStream out=null;
		InputStream in=null;
	//	String nmb = req.getHeader("Content-Language");
	//	System.out.print("tou:  "+contentRange+"  "); 
		   Enumeration enum1 = req.getHeaderNames();  
		      
		    
//		    while(enum1.hasMoreElements()){  
//		        String key = (String)enum1.nextElement();  
//		        String value = req.getHeader(key);  
//		       System.out.println(key + ":" + value);  
//		    }  
//		FileUtils.
		String message = "";
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				req.getSession().getServletContext());
		if (multipartResolver.isMultipart(req)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;
			//System.out.println(req.getParameter("username"));
			String upload_name="resultProvider";
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
//					int index = fileName.indexOf(".");
//					String tmp1= fileName.substring(0, index);
//					String tmp2 = fileName.substring(index);
//					String file_name = makeFileName(tmp1+time+tmp2);
					//System.out.print(file_name);
					Upload upload = new Upload();
					String uniquefilename=makeFileName(fileName);
					upload.setUpload_name(uniquefilename);
					upload.setUpload_time(time);
					upload.setUpload_author(upload_name);
					upload.setUpload_type("论文上传");
					uploadService.insert(upload);
					System.out.print("2222222222222222222");
					Integer up_id=uploadService.selectUploadByName(uniquefilename).getUpload_id();
					result.setRes_url(up_id);
					//System.out.println(file_name);
					//String nametmp = fileName+upload_name; 
					resultService.insertResult(result);
					Integer r_id = resultService.selectResultByName(p_name).getRes_id();
					paper.setPaper_id(r_id);
					paperService.insertPaper(paper);
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
		message = "上传成功";
		req.setAttribute("message",message);	 
		}
		return "redirect:/selectResult";
		
	}
	
	//上传专利信息及专利附件
	@RequestMapping("/upload2")
	public String insertPatent(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		User user = (User) req.getSession().getAttribute("user");

		String pa_name = req.getParameter(("pa_name"));
	
		String pa_pubtime = req.getParameter("pa_pubtime");
		String pa_number = req.getParameter("pa_number");
		String pa_inventor = req.getParameter(("pa_inventor"));
		String pa_abstract = req.getParameter("pa_abstract");
		String pa_details =  req.getParameter(("pa_details"));
		Integer pa_type =  Integer.parseInt(req.getParameter(("pa_type")));
		System.out.print("000000000000000000000000");
		Result result= new Result();
		result.setRes_name(pa_name);
		//成果类型，2代表专利
		result.setRes_type(2);
		//成果提供者
		result.setRes_provider(user.getUser_id());
		result.setRes_introduction(pa_details);
		//成果状态为待评估
		result.setRes_flag(1);
		//评估次数为0
		result.setRes_times(0);

		//待评估时间为空，设置提交时间
		Date date1= new Date();//创建一个时间对象，获取到当前的时间
		result.setRes_protime(getCurrentDate(date1));
		result.setRes_evalue(Double.parseDouble("0"));
		
		//先默认一个截止时间，再让管理员填写截至时间
	
		Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date1);
	    calendar.add(Calendar.DAY_OF_MONTH, +10);//+10今天的时间加十天
	    Date date2 = calendar.getTime();
	
		result.setRes_eva_deadline(getCurrentDate(date2));
		Patent patent =new Patent();
		
		System.out.print("111111111111111");
		patent.setPa_name(pa_name);
		patent.setPa_number(pa_number);
		patent.setPa_pubtime(pa_pubtime);
		patent.setPa_abstract(pa_abstract);
		patent.setPa_details(pa_details);
		patent.setPa_inventor(pa_inventor);
		patent.setPa_type(pa_type);

		String contentRange = req.getHeader("Content-Range");  
		FileOutputStream out=null;
		InputStream in=null;
	//	String nmb = req.getHeader("Content-Language");
	//	System.out.print("tou:  "+contentRange+"  "); 
		   Enumeration enum1 = req.getHeaderNames();  
		      
		    
//		    while(enum1.hasMoreElements()){  
//		        String key = (String)enum1.nextElement();  
//		        String value = req.getHeader(key);  
//		       System.out.println(key + ":" + value);  
//		    }  
//		FileUtils.
		String message = "";
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				req.getSession().getServletContext());
		if (multipartResolver.isMultipart(req)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;
			//System.out.println(req.getParameter("username"));
			String upload_name="resultProvider";
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
//					int index = fileName.indexOf(".");
//					String tmp1= fileName.substring(0, index);
//					String tmp2 = fileName.substring(index);
//					String file_name = makeFileName(tmp1+time+tmp2);
					//System.out.print(file_name);
					Upload upload = new Upload();
					String uniquefilename=makeFileName(fileName);
					upload.setUpload_name(uniquefilename);
					upload.setUpload_time(time);
					upload.setUpload_author(upload_name);
					upload.setUpload_type("专利上传");
					uploadService.insert(upload);
					
					System.out.print("2222222222222222222");
					Integer up_id=uploadService.selectUploadByName(uniquefilename).getUpload_id();
					result.setRes_url(up_id);
					//System.out.println(file_name);
					//String nametmp = fileName+upload_name; 
					resultService.insertResult(result);
					Integer r_id = resultService.selectResultByName(pa_name).getRes_id();
					patent.setPatent_id(r_id);
					patentService.insertPatent(patent);
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
		message = "上传成功";
		req.setAttribute("message",message);	 
		}
		return "redirect:/selectResult";
		
	}
	
	//上传软件信息及软件附件
	@RequestMapping("/upload3")
	public String insertSoftware(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		User user = (User) req.getSession().getAttribute("user");

		String s_name = req.getParameter(("s_name"));
	
		String s_finishtime = req.getParameter("s_finishtime");
		int s_ispublished = Integer.parseInt(req.getParameter("s_ispublished"));
		int s_level = Integer.parseInt(req.getParameter("s_level"));
		int s_ccm = Integer.parseInt(req.getParameter("s_ccm"));
		String s_brief =  req.getParameter(("s_brief"));
		System.out.print("000000000000000000000000");
		Result result= new Result();
		result.setRes_name(s_name);
		//成果类型，3代表软件
		result.setRes_type(3);
		//成果提供者
		result.setRes_provider(user.getUser_id());
		result.setRes_introduction(s_brief);
		//成果状态为待评估
		result.setRes_flag(1);
		//评估次数为0
		result.setRes_times(0);
	
		//待评估时间为空，设置提交时间
		Date date1= new Date();//创建一个时间对象，获取到当前的时间
		result.setRes_protime(getCurrentDate(date1));
		result.setRes_evalue(Double.parseDouble("0"));
		
		//先默认一个截止时间，再让管理员填写截至时间
	
		Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date1);
	    calendar.add(Calendar.DAY_OF_MONTH, +10);//+10今天的时间加十天
	    Date date2 = calendar.getTime();
	
		result.setRes_eva_deadline(getCurrentDate(date2));
				
		Software software =new Software();
		System.out.print("111111111111111");
		software.setS_name(s_name);
		software.setS_ispublished(s_ispublished);
		software.setS_finishtime(s_finishtime);
		software.setS_ccm(s_ccm);
		software.setS_level(s_level);
		software.setS_brief(s_brief);

		String contentRange = req.getHeader("Content-Range");  
		FileOutputStream out=null;
		InputStream in=null;
	//	String nmb = req.getHeader("Content-Language");
	//	System.out.print("tou:  "+contentRange+"  "); 
		   Enumeration enum1 = req.getHeaderNames();  
		      
		    
//		    while(enum1.hasMoreElements()){  
//		        String key = (String)enum1.nextElement();  
//		        String value = req.getHeader(key);  
//		       System.out.println(key + ":" + value);  
//		    }  
//		FileUtils.
		String message = "";
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				req.getSession().getServletContext());
		if (multipartResolver.isMultipart(req)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;
			//System.out.println(req.getParameter("username"));
			String upload_name="resultProvider";
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
//					int index = fileName.indexOf(".");
//					String tmp1= fileName.substring(0, index);
//					String tmp2 = fileName.substring(index);
//					String file_name = makeFileName(tmp1+time+tmp2);
					//System.out.print(file_name);
					Upload upload = new Upload();
					String uniquefilename=makeFileName(fileName);
					upload.setUpload_name(uniquefilename);
					upload.setUpload_time(time);
					upload.setUpload_author(upload_name);
					upload.setUpload_type("软件上传");
					uploadService.insert(upload);
					System.out.print("2222222222222222222");
					Integer up_id=uploadService.selectUploadByName(uniquefilename).getUpload_id();
					result.setRes_url(up_id);
					//System.out.println(file_name);
					//String nametmp = fileName+upload_name; 
					resultService.insertResult(result);
					Integer r_id = resultService.selectResultByName(s_name).getRes_id();
					software.setS_id(r_id);
					softwareService.insertSoftware(software);
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
		message = "上传成功";
		req.setAttribute("message",message);	 
		}
		return "redirect:/selectResult";
		
	}
		     
	@RequestMapping(value = "/test2")
	public String index3(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		List<Upload>list= uploadService.selectname();
//		for(int i=0;i<list.size();i++){
//			System.out.println(list.get(i));
//		}
		model.addAttribute("list", list);		
		return "download";
	}
	
	@RequestMapping(value = "/download")
	public String index4(HttpServletResponse res, HttpServletRequest req,Model model) throws Exception {
		
		Integer upload_id = Integer.parseInt(req.getParameter("upload_id"));
		String download_name1 = uploadService.select(upload_id).getUpload_name();
		int index= download_name1.lastIndexOf("_");
		String download_name = download_name1.substring(index+1);
		String author_name = uploadService.select(upload_id).getUpload_author();
		String path = "E:/upload"+"/"+"resultProvider";
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
	
	@RequestMapping("/selectResult")
	public String selectAllResult(Model model) {
		resultService.editResflag();
		List<Result> list = resultService.selectAllResult();
		List<Result> list4 = resultService.selectByResflag(1);
	    List<Result> list5 = resultService.selectByResflag(2);
		List<Result> list1 = resultService.selectByResType(1);
		List<Result> list2 = resultService.selectByResType(2);
		List<Result> list3 = resultService.selectByResType(3);
		
		model.addAttribute("list",list);
		model.addAttribute("list4",list4);
		model.addAttribute("list5",list5);
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		return "selectresult";
	}

	@RequestMapping("/selectAllResult")
	public String selectAllResult1(HttpServletResponse res, HttpServletRequest req,Model model) {
		resultService.editResflag();
		System.out.println("111111111111");
		Integer pageNum = Integer.parseInt(req.getParameter("pageNum"));
		Integer recordCount = resultService.selectAllResult().size();
		Pager pager = new Pager(recordCount,pageNum);
		List<Result> list = resultService.selectAllResultPage(pager);
//		for(int i=0;i<list.size();i++){
//			System.out.println(list.get(i).getRes_name());
//		}
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);

		return "selectAllresult";
	}
	
	@RequestMapping("/selectNoEvaResult")
	public String selectNoEvaResult(HttpServletResponse res, HttpServletRequest req,Model model) {
		resultService.editResflag();
		Integer pageNum = Integer.parseInt(req.getParameter("pageNum"));
		Integer recordCount = resultService.selectByResflag(1).size();
		System.out.println("111111111111");
		Pager pager = new Pager(recordCount,pageNum);
		System.out.println("2222");
		List<Result> list = resultService.listByResflagPage(pager, 1);
		System.out.println("333");
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);

		return "selectNoEvaRes";
	}
	
	@RequestMapping("/selectEvaResult")
	public String selectEvaResult(HttpServletResponse res, HttpServletRequest req,Model model) {
		resultService.editResflag();
		Integer pageNum = Integer.parseInt(req.getParameter("pageNum"));
		Integer recordCount = resultService.selectByResflag(2).size();
		Pager pager = new Pager(recordCount,pageNum);
		List<Result> list = resultService.listByResflagPage(pager, 2);
        
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);

		return "selectEvaResult";
	}
	@RequestMapping("/selectPassResult")
	public String selectPassResult(HttpServletResponse res, HttpServletRequest req,Model model) {
		resultService.editResflag();
		
		Integer pageNum = Integer.parseInt(req.getParameter("pageNum"));
		Integer recordCount = resultService.selectPassResult().size();
		Pager pager = new Pager(recordCount,pageNum);
		List<Result> list = resultService.listPassResult(pager);
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).getRes_name());
		}
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);

		return "selectPassResult";
	}
	@RequestMapping("/selectNoPassResult")
	public String selectNoPassResult(HttpServletResponse res, HttpServletRequest req,Model model) {
		resultService.editResflag();
		
		Integer pageNum = Integer.parseInt(req.getParameter("pageNum"));
		Integer recordCount = resultService.selectNoPassResult().size();
		Pager pager = new Pager(recordCount,pageNum);
		List<Result> list = resultService.listNoPassResult(pager);
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).getRes_name());
		}
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);

		return "selectNoPassResult";
	}
	@RequestMapping("/selectPaper")
	public String selectPaper(HttpServletResponse res, HttpServletRequest req,Model model) {
		resultService.editResflag();
		Integer pageNum = Integer.parseInt(req.getParameter("pageNum"));
		Integer recordCount = resultService.selectByResType(1).size();
		Pager pager = new Pager(recordCount,pageNum);
		List<Result> list = resultService.listByResTypePage(pager, 1);
        
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);

		return "selectpaper";
	}
	@RequestMapping("/selectPatent")
	public String selectPatent(HttpServletResponse res, HttpServletRequest req,Model model) {
		resultService.editResflag();
		Integer pageNum = Integer.parseInt(req.getParameter("pageNum"));
		Integer recordCount = resultService.selectByResType(2).size();
		System.out.println("recordCount::"+recordCount);
		Pager pager = new Pager(recordCount,pageNum);
		List<Result> list = resultService.listByResTypePage(pager, 2);
        
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);

		return "selectpatent";
	}
	@RequestMapping("/selectSoftware")
	public String selectSoftware(HttpServletResponse res, HttpServletRequest req,Model model) {
		resultService.editResflag();
		Integer pageNum = Integer.parseInt(req.getParameter("pageNum"));
		Integer recordCount = resultService.selectByResType(3).size();
		Pager pager = new Pager(recordCount,pageNum);
		List<Result> list = resultService.listByResTypePage(pager, 3);
        
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);

		return "selectsoftware";
	}
	@RequestMapping("/selectPassResultSmall")
	public String selectPassResult(Model model) {
		resultService.editResflag();
		List<Result> list6 = resultService.selectPassResult();
	
		model.addAttribute("list6",list6);
		
		return "queryresultSmall";
	}
	
	@RequestMapping("/resultItem")
	public String resultItem(HttpServletRequest req,Model model) {
		Integer res_id = Integer.parseInt(req.getParameter("res_id"));
		Result result = new Result();
		result = resultService.selectByPrimaryKey(res_id);
		int user_id = result.getRes_provider();
		
		User user = new User();
		user = userService.selectByPrimaryKey(user_id);
		
		//判断成果类型
		if(result.getRes_type()==1)//论文
		{
			Paper paper = paperService.selectByPrimaryKey(res_id);
			Patent patent = new Patent();
			Software software = new Software();
			Journal journal = new Journal();
			journal = 	paperService.selectByJournal(paper.getPublished_journals());	
			
			model.addAttribute("journal", journal);	
			model.addAttribute("paper", paper);	
			model.addAttribute("patent", patent);	
			model.addAttribute("software", software);	
		}
		else if(result.getRes_type()==2){//专利
			Patent patent = patentService.selectByPrimaryKey(res_id);
			Paper paper = new Paper();
			Software software = new Software();
			
			model.addAttribute("paper", paper);	
			model.addAttribute("patent", patent);	
			model.addAttribute("software", software);		
		}
		else{//软件
			Software software = softwareService.selectByPrimaryKey(res_id);
			Patent patent = new Patent();
			Paper paper = new Paper();
			
			model.addAttribute("paper", paper);	
			model.addAttribute("patent", patent);	
			model.addAttribute("software", software);	
		}
		
		model.addAttribute("user",user);
		model.addAttribute("result",result);
		
		return "resultItem";
	}
	

	
	//验证成果名称是否存在
	@RequestMapping(value="/getRnameValidation")
	public void getRnameValidation(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		String r_name = new String(req.getParameter("r_name").getBytes("ISO-8859-1"),"utf-8");
		Result result1 = resultService.selectResultByName(r_name);
		
		PrintWriter out = resp.getWriter();//????
		if(result1 == null){
			System.out.println("成果名称重复验证：" + r_name + "的成果名称不存在");
			out.print("success");
		}else{
			System.out.println("成果名称重复验证：" + r_name + "的成果名称存在"+result1.toString());
			out.print("failure");
		}
	}
}
