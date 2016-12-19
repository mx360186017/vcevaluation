package com.vcevaluation.controller;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vcevaluation.mapping.EvaluationMapper;
import com.vcevaluation.pojo.Score_record;
import com.vcevaluation.pojo.User;
import com.vcevaluation.pojo.Evaluation;
import com.vcevaluation.pojo.Factor;
import com.vcevaluation.pojo.Index1;
import com.vcevaluation.pojo.Journal;
import com.vcevaluation.pojo.Member;
import com.vcevaluation.pojo.Paper;
import com.vcevaluation.pojo.Patent;
import com.vcevaluation.pojo.Project;
import com.vcevaluation.pojo.Respro;
import com.vcevaluation.pojo.Result;
import com.vcevaluation.pojo.Score_index;
import com.vcevaluation.pojo.Software;
import com.vcevaluation.pojo.Team;
import com.vcevaluation.service.EvaluationService;
import com.vcevaluation.service.FactorService;
import com.vcevaluation.service.PaperService;
import com.vcevaluation.service.PatentService;
import com.vcevaluation.service.ProjectService;
import com.vcevaluation.service.ResproService;
import com.vcevaluation.service.ResultService;
import com.vcevaluation.service.SoftwareService;
import com.vcevaluation.service.TeamService;

@Controller
public class EvaluationController {

	@Autowired 
	ResultService resultService;
	@Autowired 
	PaperService paperService;
	@Autowired 
	PatentService patentService;
	@Autowired 
	SoftwareService softwareService;
	@Autowired 
	ProjectService projectService;
	@Autowired 
	ResproService resproService;
	@Autowired 
	EvaluationService evaluationService;
	@Autowired 
	TeamService teamService;
	@Autowired 
	FactorService factorService;
	@Autowired
	EvaluationMapper evaluationMapper;
	/**
	 * 评估论文
	 * 
	 * **/
	
	@RequestMapping("/toEvaluationPaper")
	public String toEvaluationPaper(HttpServletRequest req,Model model) {
		
		Integer res_id = Integer.parseInt(req.getParameter("res_id"));
		Result result = new Result();
		Paper paper = new Paper();
		result = resultService.selectByPrimaryKey(res_id);
		paper = paperService.selectByPrimaryKey(res_id);
		//评估先进性
		String pubtime =  paper.getPaper_pubtime();
		int p_cited = paper.getPaper_cited();
		SimpleDateFormat format  =   new  SimpleDateFormat( "yyyy-MM-dd" );
		Date date = null;
	    try {
		    date = format.parse(pubtime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}; 
		Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date);
	    int year = calendar.get(Calendar.YEAR);  
	    Date currentDate = new Date();
	    SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
	    int currentyear = Integer.parseInt(format1.format(currentDate));
	    int d_value = currentyear - year;
	    DecimalFormat df = new DecimalFormat("0.00"); 
	    Double a = 0.00;
	    if(d_value == 0){
	    	a = 9.5;
	    }
	    else{
	    //3为常量参数，可根据最后所需值更改
	    	a = 1/Double.valueOf(d_value)+ 8;
	    }
	    
	    Double b = Double.valueOf(p_cited)/5 + 2;
	    //m值即为先进性
	    Double m = a *evaluationService.selectByPrimaryKey(1).getFactor_weight() + b*evaluationService.selectByPrimaryKey(2).getFactor_weight();
		
	    //评估可靠性
	    Double c = 0.0;
	    if(paper.getPaper_category()==1){
	    	c = 10.0;
	    }else if(paper.getPaper_category()==2){
	    	c = 9.5;
	    }else if(paper.getPaper_category()==3){
	    	c = 9.0;
	    }else {
			c = 7.0;
		}
	    Journal journal = paperService.selectByJournal(paper.getPublished_journals());
	    Double d = 5*journal.getJ_factor();
	    //n值即为可靠性
	    Double n = c *evaluationService.selectByPrimaryKey(3).getFactor_weight() + d*evaluationService.selectByPrimaryKey(4).getFactor_weight();
		//适应性和可行性系统无法根据因素进行评估，需要评估专家打分评估
	    List<Factor> index1 = evaluationService.selectByindex1("论文");
	    List<Factor> index2 = evaluationService.selectByindex2("论文");
	    String category = null;
	    if (paper.getPaper_category()==1){
	    	category="SCI(科学引文索引)";
	    }else if (paper.getPaper_category()==2){
	    	category="EI(工程索引)";
	    }else if (paper.getPaper_category()==3){
	    	category="ISTP(科技会议录索引)";
	    }
	    else{
	    	category="其他索引库";
	    }
	    Map<Integer, String> map = new HashMap<Integer, String>();  
	    Map<Integer, String> map1 = new HashMap<Integer, String>(); 
	    Map<Integer, String> map2 = new HashMap<Integer, String>(); 
	    Map<Integer, String> map3 = new HashMap<Integer, String>(); 
	    map.put(1, df.format(a));
	    map.put(2, df.format(b));
	   
	    map1.put(1, Integer.toString(year));
	    map1.put(2, Integer.toString(p_cited));
	    
	    
	    map2.put(3, df.format(c));
	    map2.put(4, df.format(d));
	    
	    map3.put(3, category);
	    map3.put(4, journal.getJ_name());
	    
		model.addAttribute("index1", index1);
		model.addAttribute("index2", index2);
		model.addAttribute("map",map);
		model.addAttribute("map1",map1);
		model.addAttribute("map2",map2);
		model.addAttribute("map3",map3);
		model.addAttribute("journal",journal);
		model.addAttribute("m", df.format(m));
		model.addAttribute("n", df.format(n));
		model.addAttribute("result",result);
		
		return "evaluationPaper";
	}
	
	@RequestMapping("/evaluationPaper")
	public String evaluationPaper(HttpServletRequest req,Model model) {
		 User user = (User) req.getSession().getAttribute("user");
        
		int eva_ex_id = user.getUser_id();//暂时设定一个固定值
	//	System.out.println(":111111111111111");
		int res_id = Integer.parseInt(req.getParameter("res_id"));
		Result result =new  Result();
		result = resultService.selectByPrimaryKey(res_id);
	//	System.out.println("::::"+res_id);
	//	System.out.println(":1222222222221");
		//获取前两项系统自动估值
		String paper_indexEva1 = req.getParameter("paper_indexEva1");
		String paper_indexEva2 = req.getParameter("paper_indexEva2");
		//获取人工四项评分估值
		String scord_index1 = req.getParameter("scord_index1");
		String scord_index2 = req.getParameter("scord_index2");
		String scord_index3 = req.getParameter("scord_index3");
		String scord_index4 = req.getParameter("scord_index4");
        //获取评分原因
		String score_reason1 = req.getParameter("score_reason1");
		String score_reason2 = req.getParameter("score_reason2");
		String score_reason3 = req.getParameter("score_reason3");
		String score_reason4 = req.getParameter("score_reason4");
		
		List<String> reasons = new ArrayList<String>();
		reasons.add(0, score_reason1);
		reasons.add(1, score_reason2);
		reasons.add(2, score_reason3);
		reasons.add(3, score_reason4);
		
		DecimalFormat df = new DecimalFormat("0.00");   
		
		Double d1 = Double.parseDouble(paper_indexEva1);  
		Double d2 = Double.parseDouble(paper_indexEva2); 
		Double d3 = Double.parseDouble(scord_index1);
		Double d4 = Double.parseDouble(scord_index2); 
		Double d5 = Double.parseDouble(scord_index3);  
		Double d6 = Double.parseDouble(scord_index4);
		
		
		String ind1 = df.format(d1);  
		String ind2 = df.format(d2); 
		String ind3 = df.format(d3);
		String ind4 = df.format(d4);
		String ind5 = df.format(d5);
		String ind6 = df.format(d6);
		
		d1 = Double.parseDouble(ind1);
		d2 = Double.parseDouble(ind2);
		d3 = Double.parseDouble(ind3);
		d4 = Double.parseDouble(ind4);
		d5 = Double.parseDouble(ind5);
		d6 = Double.parseDouble(ind6);
		
		List<Double> ds = new ArrayList<Double>();
		ds.add(0, d1);
		ds.add(1, d2);
		ds.add(2, d5);
		ds.add(3, d6);
		List<Index1> indexs = evaluationService.selectBytype("1");
		Double auto_eva = 0.00;
		for(int q=0; q<ds.size(); q++){
			auto_eva += ds.get(q) * Double.parseDouble(indexs.get(q).getIndex_remark());
		}
		List<Double> ds1 = new ArrayList<Double>();
		ds1.add(0, d3);
		ds1.add(1, d4);
		ds1.add(2, d5);
		ds1.add(3, d6);
		Double manual_eva = 0.0;
		for(int p=0; p<ds1.size(); p++){
			manual_eva += ds1.get(p) * Double.parseDouble(indexs.get(p).getIndex_remark());
		}		
		
		Date curdate1= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间显示格式
		String cur = sdf.format(curdate1);//将当前时间格式化为需要的类型
		
		Evaluation	evaluation	= new Evaluation();
		
		evaluation.setEva_ex_id(eva_ex_id);
		evaluation.setEva_res_id(res_id);
		evaluation.setEva_manual_value(manual_eva);
		evaluation.setEva_auto_value(auto_eva);
		evaluation.setEva_type(1);//成果
		evaluation.setEva_time(cur);
		evaluation.setEva_short("缺陷因素：");
		
		evaluationService.insertEvaluation(evaluation);
		
		Evaluation evaluation2 = new Evaluation();
		evaluation2.setEva_res_id(res_id);
		evaluation2.setEva_time(cur);
		evaluation2.setEva_ex_id(eva_ex_id);
		int eva_id = evaluationService.selectByMulAttribute(evaluation2).getEva_id();
		//写到这里(给score_index的表插数据)
		Score_index si = new Score_index();
//	    System.out.println("3333333333333");
//		for(Index1 index:indexs){
//			System.out.println(index.getIndex_id()+"::"+index.getIndex_name());
//		}
		for(int q=0;q<indexs.size();q++){	
			si.setSri_eva_id(eva_id);
			si.setSri_item(indexs.get(q).getIndex_id());
			si.setSri_score(ds1.get(q));
			si.setSri_reason(reasons.get(q));
			evaluationService.insertScore_index(si);
		}
	//	System.out.println("4444444433");
		Double eva_final = auto_eva *0.4 + manual_eva * 0.6;
		int times = result.getRes_times()+1;
		Double evalue= (result.getRes_evalue()*result.getRes_times() + eva_final)/times;
		
		result.setRes_id(res_id);
		result.setRes_times(times);
		result.setRes_evalue(evalue);
	    resultService.updateByPrimaryKeySelective(result);
	    
		return "redirect:/selectResult";
	}
	/**
	 * 评估专利
	 * 
	 * **/
	@RequestMapping("/toEvaluationPatent")
	public String toEvaluationPatent(HttpServletRequest req,Model model) {
		
		Integer res_id = Integer.parseInt(req.getParameter("res_id"));
		Result result = new Result();
		Patent patent = new Patent(); 
		result = resultService.selectByPrimaryKey(res_id);
		patent = patentService.selectByPrimaryKey(res_id);
		
		//评估先进性
		String pubtime =  patent.getPa_pubtime();
		SimpleDateFormat format  =   new  SimpleDateFormat( "yyyy-MM-dd" );
		Date date = null;
	    try {
		    date = format.parse(pubtime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}; 
		Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date);
	    int year = calendar.get(Calendar.YEAR);  
	    Date currentDate = new Date();
	    SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
	    int currentyear = Integer.parseInt(format1.format(currentDate));
	    int d_value = currentyear - year;
	    System.out.println(d_value);
	    
	    DecimalFormat df = new DecimalFormat("0.00"); 
	    double m = 0.00;
	    
	    if(d_value == 0){
	    	m = 9.5;
	    }
	    else{
	    //3为常量参数，可根据最后所需值更改
	        m = 1/Double.valueOf(d_value)+ 8;
	    //	m =  1/5 + 7;
	    }

	    //m值即为先进性
	   
	  //评估可靠性
	    double c = 0;
	    if(patent.getPa_type()==1){
	    	c = 9.0;
	    }else if(patent.getPa_type()==2){
	    	c = 8.0;
	    }else if(patent.getPa_type()==3){
	    	c = 7.0;
	    }else {
			c = 9.0;
		}
	    String vali = null;
	    Double validate = null;
	    String pa_number = patent.getPa_number();
	    System.out.println(pa_number);
	    String[] valis = new String[20];
	    valis = pa_number.split("\\.");
	    for (int i = 0; i < valis.length; i++)
            System.out.println(i+":"+valis[i]);
	    vali = valis[1];
	    if(vali=="X")
	    {
	    	validate = 10.0;
	    }
	    else{
	    	 validate = Double.parseDouble(vali);
	    }
	    
	    double d = 6 + validate/4 ;
	    //n值即为可靠性
	    double n = c *evaluationService.selectByPrimaryKey(8).getFactor_weight() + d*evaluationService.selectByPrimaryKey(17).getFactor_weight();
	    
	    List<Factor> index1 = evaluationService.selectByindex1("专利");
	    List<Factor> index2 = evaluationService.selectByindex2("专利");
	    
	    String pa_type = null;
	    if (patent.getPa_type()==1){
	    	pa_type="发明类(产品)";
	    }else if (patent.getPa_type()==2){
	    	pa_type="发明类(方法)";
	    }else if (patent.getPa_type()==3){
	    	pa_type="外观设计类";
	    }
	    else{
	    	pa_type="新型实用类";
	    }
	    
	    Map<Integer, String> map = new HashMap<Integer, String>();  
	    Map<Integer, String> map1 = new HashMap<Integer, String>(); 
	    Map<Integer, String> map2 = new HashMap<Integer, String>(); 
	    Map<Integer, String> map3 = new HashMap<Integer, String>(); 
	    map.put(7, df.format(m));   
	    map1.put(7, Integer.toString(year));	        
	    map2.put(8, df.format(c));
	    map2.put(17, df.format(d));
	    
	    map3.put(8, pa_type);
	    map3.put(17, pa_number);
	    
	    model.addAttribute("index1", index1);
		model.addAttribute("index2", index2);
		model.addAttribute("map",map);
		model.addAttribute("map1",map1);
		model.addAttribute("map2",map2);
		model.addAttribute("map3",map3);
        model.addAttribute("m", df.format(m));
		model.addAttribute("n", df.format(n));
		model.addAttribute("result",result);
		
		return "evaluationPatent";
	}
	
	@RequestMapping("/evaluationPatent")
	public String evaluationPatent(HttpServletRequest req,Model model) {
		
        User user = (User) req.getSession().getAttribute("user");
        
		int eva_ex_id = user.getUser_id();//暂时设定一个固定值
		//	System.out.println(":111111111111111");
			int res_id = Integer.parseInt(req.getParameter("res_id"));
			Result result  = new Result();
			result = resultService.selectByPrimaryKey(res_id);
		//	System.out.println("::::"+res_id);
		//	System.out.println(":1222222222221");
			//获取前两项系统自动估值
			String paper_indexEva1 = req.getParameter("patent_indexEva1");
			String paper_indexEva2 = req.getParameter("patent_indexEva2");
			//获取人工四项评分估值
			String scord_index1 = req.getParameter("scord_index1");
			String scord_index2 = req.getParameter("scord_index2");
			String scord_index3 = req.getParameter("scord_index3");
			String scord_index4 = req.getParameter("scord_index4");
	        //获取评分原因
			String score_reason1 = req.getParameter("score_reason1");
			String score_reason2 = req.getParameter("score_reason2");
			String score_reason3 = req.getParameter("score_reason3");
			String score_reason4 = req.getParameter("score_reason4");
			
			List<String> reasons = new ArrayList<String>();
			reasons.add(0, score_reason1);
			reasons.add(1, score_reason2);
			reasons.add(2, score_reason3);
			reasons.add(3, score_reason4);
			
			DecimalFormat df = new DecimalFormat("0.00");   
			
			Double d1 = Double.parseDouble(paper_indexEva1);  
			Double d2 = Double.parseDouble(paper_indexEva2); 
			Double d3 = Double.parseDouble(scord_index1);
			Double d4 = Double.parseDouble(scord_index2); 
			Double d5 = Double.parseDouble(scord_index3);  
			Double d6 = Double.parseDouble(scord_index4);
			
			
			String ind1 = df.format(d1);  
			String ind2 = df.format(d2); 
			String ind3 = df.format(d3);
			String ind4 = df.format(d4);
			String ind5 = df.format(d5);
			String ind6 = df.format(d6);
			
			d1 = Double.parseDouble(ind1);
			d2 = Double.parseDouble(ind2);
			d3 = Double.parseDouble(ind3);
			d4 = Double.parseDouble(ind4);
			d5 = Double.parseDouble(ind5);
			d6 = Double.parseDouble(ind6);
			
			List<Double> ds = new ArrayList<Double>();
			ds.add(0, d1);
			ds.add(1, d2);
			ds.add(2, d5);
			ds.add(3, d6);
			List<Index1> indexs = evaluationService.selectBytype("1");
			Double auto_eva = 0.00;
			for(int q=0; q<ds.size(); q++){
				auto_eva += ds.get(q) * Double.parseDouble(indexs.get(q).getIndex_remark());
			}
			List<Double> ds1 = new ArrayList<Double>();
			ds1.add(0, d3);
			ds1.add(1, d4);
			ds1.add(2, d5);
			ds1.add(3, d6);
			Double manual_eva = 0.0;
			for(int p=0; p<ds1.size(); p++){
				manual_eva += ds1.get(p) * Double.parseDouble(indexs.get(p).getIndex_remark());
			}		
			
			Date curdate1= new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间显示格式
			String cur = sdf.format(curdate1);//将当前时间格式化为需要的类型
			
			Evaluation	evaluation	= new Evaluation();
			
			evaluation.setEva_ex_id(eva_ex_id);
			evaluation.setEva_res_id(res_id);
			evaluation.setEva_manual_value(manual_eva);
			evaluation.setEva_auto_value(auto_eva);
			evaluation.setEva_type(1);//成果
			evaluation.setEva_time(cur);
			evaluation.setEva_short("缺陷因素：");
			
			evaluationService.insertEvaluation(evaluation);
			
			Evaluation evaluation2 = new Evaluation();
			evaluation2.setEva_res_id(res_id);
			evaluation2.setEva_time(cur);
			evaluation2.setEva_ex_id(eva_ex_id);
			int eva_id = evaluationService.selectByMulAttribute(evaluation2).getEva_id();
			//写到这里(给score_index的表插数据)
			Score_index si = new Score_index();
//		    System.out.println("3333333333333");
//			for(Index1 index:indexs){
//				System.out.println(index.getIndex_id()+"::"+index.getIndex_name());
//			}
			for(int q=0;q<indexs.size();q++){	
				si.setSri_eva_id(eva_id);
				si.setSri_item(indexs.get(q).getIndex_id());
				si.setSri_score(ds1.get(q));
				si.setSri_reason(reasons.get(q));
				evaluationService.insertScore_index(si);
			}
		//	System.out.println("4444444433");
		
			Double eva_final = auto_eva *0.4 + manual_eva * 0.6;
			int times = result.getRes_times()+1;
			Double evalue= (result.getRes_evalue()*result.getRes_times() + eva_final)/times;
			
			result.setRes_id(res_id);
			result.setRes_times(times);
			result.setRes_evalue(evalue);
		    resultService.updateByPrimaryKeySelective(result);	
			
		return "redirect:/selectResult";
	}
	/**
	 * 评估软件
	 * 
	 * **/
	@RequestMapping("/toEvaluationSoftware")
	public String toEvaluationSoftware(HttpServletRequest req,Model model) {
		
//写到这里----------------------------------
		Integer res_id = Integer.parseInt(req.getParameter("res_id"));
		Result result = new Result();
		Software software = new Software();
		result = resultService.selectByPrimaryKey(res_id);
		software = softwareService.selectByPrimaryKey(res_id);
		//评估先进性
		String pubtime =  software.getS_finishtime();
		int s_publish = software.getS_ispublished();
		SimpleDateFormat format  =  new  SimpleDateFormat( "yyyy-MM-dd" );
		Date date = null;
	    try {
		    date = format.parse(pubtime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}; 
		Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date);
	    int year = calendar.get(Calendar.YEAR);  
	    Date currentDate = new Date();
	    SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
	    int currentyear = Integer.parseInt(format1.format(currentDate));
	    int d_value = currentyear - year;
	    DecimalFormat df = new DecimalFormat("0.00"); 
	    Double a = 0.00;
	    if(d_value == 0){
	    	a = 9.5;
	    }
	    else{
	    //3为常量参数，可根据最后所需值更改
	    	a = 1/Double.valueOf(d_value)+ 8;
	    }
	    Double b = 0.00;
	    if(s_publish==0){
	    	b = 9.0;
	    }
	    else{b = 8.0;}
	    //Double b = Double.valueOf(p_cited)/5 + 2;
	    //m值即为先进性
	    Double m = a *evaluationService.selectByPrimaryKey(11).getFactor_weight() + b*evaluationService.selectByPrimaryKey(12).getFactor_weight();
		
	    //评估可靠性
	    Double c = 0.0;
	    if(software.getS_level()==1){
	    	c = 9.8;
	    }else if(software.getS_level()==2){
	    	c = 9.0;
	    }else if(software.getS_level()==3){
	    	c = 8.0;
	    }else {
			c = 7.0;
		}
//	    Journal journal = paperService.selectByJournal(paper.getPublished_journals());
//	    Double d = 5*journal.getJ_factor();
	    Double d = 0.0;
	    if(software.getS_ccm()==1){
	    	d = 9.8;
	    }else if(software.getS_ccm()==2){
	    	d = 8.5;
	    }else{
	    	d = 7.0;
	    }
	    //n值即为可靠性
	    Double n = c *evaluationService.selectByPrimaryKey(13).getFactor_weight() + d*evaluationService.selectByPrimaryKey(14).getFactor_weight();
		//适应性和可行性系统无法根据因素进行评估，需要评估专家打分评估
	    List<Factor> index1 = evaluationService.selectByindex1("软件");
	    List<Factor> index2 = evaluationService.selectByindex2("软件");
	    String level = null;
	    
	    if (software.getS_level()==1){
	    	level="高度可移植性";
	    }else if (software.getS_level()==2){
	    	level="较好的可移植性";
	    }else if(software.getS_level()==3){
	    	level="一般的可移植性";
	    }else{
	    	level="较差的可移植性";
	    }
	    
	    String ccm = null;
	    if (software.getS_ccm()==1){
	    	ccm="完全满足软件计划书中要求的";
	    }else if (software.getS_ccm()==2){
	    	ccm="基本满足完备性";
	    }else{
	    	ccm="有少量功能没有实现";
	    }
	    String isPub = null;
	    if(s_publish == 1){
	    	 isPub = "已发布";
	    }else{ isPub = "未发布";}
	    Map<Integer, String> map = new HashMap<Integer, String>();  
	    Map<Integer, String> map1 = new HashMap<Integer, String>(); 
	    Map<Integer, String> map2 = new HashMap<Integer, String>(); 
	    Map<Integer, String> map3 = new HashMap<Integer, String>(); 
	    map.put(11, df.format(a));
	    map.put(12, df.format(b));
	   
	    map1.put(11, Integer.toString(year));
	    map1.put(12, isPub);
	    
	    
	    map2.put(13, df.format(c));
	    map2.put(14, df.format(d));
	    
	    map3.put(13, level);
	    map3.put(14, ccm);
	    
		model.addAttribute("index1", index1);
		model.addAttribute("index2", index2);
		model.addAttribute("map",map);
		model.addAttribute("map1",map1);
		model.addAttribute("map2",map2);
		model.addAttribute("map3",map3);
		model.addAttribute("m", df.format(m));
		model.addAttribute("n", df.format(n));
		model.addAttribute("result",result);
		
		return "evaluationSoftware";
	}
	
	@RequestMapping("/evaluationSoftware")
	public String evaluationSoftware(HttpServletRequest req,Model model) {
		
            User user = (User) req.getSession().getAttribute("user");
        
		    int eva_ex_id = user.getUser_id();//暂时设定一个固定值
		//	System.out.println(":111111111111111");
			int res_id = Integer.parseInt(req.getParameter("res_id"));
			Result result =new  Result();
			result = resultService.selectByPrimaryKey(res_id);
		//	System.out.println("::::"+res_id);
		//	System.out.println(":1222222222221");
			//获取前两项系统自动估值
			String software_indexEva1 = req.getParameter("software_indexEva1");
			String software_indexEva2 = req.getParameter("software_indexEva2");
			//获取人工四项评分估值
			String scord_index1 = req.getParameter("scord_index1");
			String scord_index2 = req.getParameter("scord_index2");
			String scord_index3 = req.getParameter("scord_index3");
			String scord_index4 = req.getParameter("scord_index4");
	        //获取评分原因
			String score_reason1 = req.getParameter("score_reason1");
			String score_reason2 = req.getParameter("score_reason2");
			String score_reason3 = req.getParameter("score_reason3");
			String score_reason4 = req.getParameter("score_reason4");
			
			List<String> reasons = new ArrayList<String>();
			reasons.add(0, score_reason1);
			reasons.add(1, score_reason2);
			reasons.add(2, score_reason3);
			reasons.add(3, score_reason4);
			
			DecimalFormat df = new DecimalFormat("0.00");   
			
			Double d1 = Double.parseDouble(software_indexEva1);  
			Double d2 = Double.parseDouble(software_indexEva2); 
			Double d3 = Double.parseDouble(scord_index1);
			Double d4 = Double.parseDouble(scord_index2); 
			Double d5 = Double.parseDouble(scord_index3);  
			Double d6 = Double.parseDouble(scord_index4);
			
			
			String ind1 = df.format(d1);  
			String ind2 = df.format(d2); 
			String ind3 = df.format(d3);
			String ind4 = df.format(d4);
			String ind5 = df.format(d5);
			String ind6 = df.format(d6);
			
			d1 = Double.parseDouble(ind1);
			d2 = Double.parseDouble(ind2);
			d3 = Double.parseDouble(ind3);
			d4 = Double.parseDouble(ind4);
			d5 = Double.parseDouble(ind5);
			d6 = Double.parseDouble(ind6);
			
			List<Double> ds = new ArrayList<Double>();
			ds.add(0, d1);
			ds.add(1, d2);
			ds.add(2, d5);
			ds.add(3, d6);
			List<Index1> indexs = evaluationService.selectBytype("1");
			Double auto_eva = 0.00;
			for(int q=0; q<ds.size(); q++){
				auto_eva += ds.get(q) * Double.parseDouble(indexs.get(q).getIndex_remark());
			}
			List<Double> ds1 = new ArrayList<Double>();
			ds1.add(0, d3);
			ds1.add(1, d4);
			ds1.add(2, d5);
			ds1.add(3, d6);
			Double manual_eva = 0.0;
			for(int p=0; p<ds1.size(); p++){
				manual_eva += ds1.get(p) * Double.parseDouble(indexs.get(p).getIndex_remark());
			}		
			
			Date curdate1= new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间显示格式
			String cur = sdf.format(curdate1);//将当前时间格式化为需要的类型
			
			Evaluation	evaluation	= new Evaluation();
			
			evaluation.setEva_ex_id(eva_ex_id);
			evaluation.setEva_res_id(res_id);
			evaluation.setEva_manual_value(manual_eva);
			evaluation.setEva_auto_value(auto_eva);
			evaluation.setEva_type(1);//成果
			evaluation.setEva_time(cur);
			evaluation.setEva_short("缺陷因素：");
			
			evaluationService.insertEvaluation(evaluation);
			
			Evaluation evaluation2 = new Evaluation();
			evaluation2.setEva_res_id(res_id);
			evaluation2.setEva_time(cur);
			evaluation2.setEva_ex_id(eva_ex_id);
			int eva_id = evaluationService.selectByMulAttribute(evaluation2).getEva_id();
			//写到这里(给score_index的表插数据)
			Score_index si = new Score_index();
//		    System.out.println("3333333333333");
//			for(Index1 index:indexs){
//				System.out.println(index.getIndex_id()+"::"+index.getIndex_name());
//			}
			for(int q=0;q<indexs.size();q++){	
				si.setSri_eva_id(eva_id);
				si.setSri_item(indexs.get(q).getIndex_id());
				si.setSri_score(ds1.get(q));
				si.setSri_reason(reasons.get(q));
				evaluationService.insertScore_index(si);
			}
		//	System.out.println("4444444433");
			Double eva_final = auto_eva *0.4 + manual_eva * 0.6;
			int times = result.getRes_times()+1;
			Double evalue= (result.getRes_evalue()*result.getRes_times() + eva_final)/times;
			
			result.setRes_id(res_id);
			result.setRes_times(times);
			result.setRes_evalue(evalue);
		    resultService.updateByPrimaryKeySelective(result);
		    
			return "redirect:/selectResult";
	}
	
	
	/**
	 * 评估项目
	 * 
	 * **/
	@RequestMapping("/toEvaluationProject")
	public String toEvaluationProject(HttpServletRequest req,Model model) {
		
		Integer pro_id = Integer.parseInt(req.getParameter("pro_id"));
		Project project = new Project();
		project = projectService.selectByPrimaryKey(pro_id);
		
		int fit = project.getPro_fit();
		//评估技术风险
		//技术风险--硬件支持
		Double a= 0.00;
		Double a1 = 0.00;
		if(fit==1){
	    	a1 = 9.5;
	    }else if(fit==2){
	    	a1 = 8.5;
	    }else {
			a1 = 7.0;
		}
		//技术风险--成果可靠性
		Double eva_res = 0.00;
		Double a2 = 0.00;
		List<Respro> contains = resproService.selectByProid(pro_id);
		for(int i =0; i<contains.size();i++){
			int result_id = contains.get(i).getRpro_res_id(); 
			Result result = new Result();
			result = resultService.selectByPrimaryKey(result_id);
			 eva_res += result.getRes_evalue();
		}
		a2 = eva_res/contains.size();
		//技术风险--团队能力(成立时间，成员能力)
		Team team = teamService.selectByPrimaryKey(project.getPro_team());
		String cotime = team.getCooperation_time();
		SimpleDateFormat format  =   new  SimpleDateFormat( "yyyy-MM-dd" );
		Date date = null;
	    try {
		    date = format.parse(cotime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}; 
		Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date);
	    int year = calendar.get(Calendar.YEAR);  
	    Date currentDate = new Date();
	    SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
	    int currentyear = Integer.parseInt(format1.format(currentDate));
	    int date_value = currentyear - year;
	    DecimalFormat df = new DecimalFormat("0.00"); 
	    Double a3 = 0.00;
	    if(date_value == 0){
	    	a3 = 7.0;
	    }
	    else{
	    	if(Double.valueOf(date_value)/4>3.0){
	    		a3 = 10.0;
	    	}else{
	    	a3 = Double.valueOf(date_value)/4 + 7;}
	    }
	    Double a4 = 0.00;
	    Double a41 = 0.00;
	    Double a42 = 0.00;
		List<Member> members = teamService.selectMemberByTeamID(project.getPro_team());
		for(int j= 0;j<members.size();j++){
			if(members.get(j).getMember_edu()==1){
				a41 += 10.0;
			}else if(members.get(j).getMember_edu()==2){
				a41 += 9.5;
			}else if(members.get(j).getMember_edu()==3){
				a41 += 9.0;
			}else {
				a41 += 8.0;
			}
		}
		for(int j= 0;j<members.size();j++){
			if(members.get(j).getMember_level()=="A"){
				a42 += 10.0;
			}else if(members.get(j).getMember_level()=="B"){
				a42 += 9.0;
			}else if(members.get(j).getMember_level()=="C"){
				a42 += 8.0;
			}else {
				a42 += 6.0;
			}
		}
		a4 = 0.4*a41/members.size() + 0.6* a42/members.size();
		Double teamfactor = 0.5 * a3 + 0.5* a4;
		a = a1 *evaluationService.selectByPrimaryKey(19).getFactor_weight() + a2*evaluationService.selectByPrimaryKey(20).getFactor_weight()
				+teamfactor*evaluationService.selectByPrimaryKey(18).getFactor_weight();
		
		Double capital = project.getPro_capital();
		Double bank = project.getPro_bank();
		//Double moremoney = project.getPro_meet();
		//评估资金风险
		Double b = 0.00;
		Double b1 = 0.00;
		Double b2 = 0.00;
		Double ct = 0.00;
		Double bt = 0.00;
		int benifit = project.getPro_lastbenifit();
		//自筹占所需比重
		Double total = capital + bank;
		ct = capital/total;
		bt = bank/total;
		if(ct>bt){
			b1 = 9.0;
		}else{
			
			b1 = 8.0;
		}
		String reg = bt.toString().split("\\.")[1].substring(0, 1);
		if(benifit/Integer.parseInt(reg)>1)
		{
			b2 = 9.0;
		}
		else{
			if(benifit/Integer.parseInt(reg)<0.5){
			b2 = 6.0; }
			else if(benifit/Integer.parseInt(reg)<1){
				b2 = 7.0;
			}
		}
		b = b1 *evaluationService.selectByPrimaryKey(22).getFactor_weight() + b2*evaluationService.selectByPrimaryKey(21).getFactor_weight();
		//评估社会风险
		Double c = 0.00;
		int support = project.getPro_support();
		if(support==0){
	    	c = 8.0;
	    }else{
	    	c = 8.5;
	    }
		//评估市场风险(部分人工)
		Double d = 0.00;
		int period = project.getPro_period();
		if(period==1){
	    	d = 10.0;
	    }else if(period==2){
	    	d = 9.5;
	    }else if(period==3){
	    	d = 9.0;
	    }else {
			d = 7.0;
		}
		//评估设计方案和综合风险需要人工
		Factor factor = new Factor();
		factor.setFactor_index_id(5);
		factor.setFactor_remark("项目");
		List<Factor> index1 = evaluationService.selectByindexParameter(factor);
		factor.setFactor_index_id(6);
	    List<Factor> index2 = evaluationService.selectByindexParameter(factor);
	    factor.setFactor_index_id(7);
	    List<Factor> index3 = evaluationService.selectByindexParameter(factor);
//	    factor.setFactor_index_id(8);
//	    List<Factor> index4 = evaluationService.selectByindexParameter(factor);
	    Map<Integer, String> map = new HashMap<Integer, String>();  
	    Map<Integer, String> map1 = new HashMap<Integer, String>(); 
	    Map<Integer, String> map2 = new HashMap<Integer, String>(); 
	    Map<Integer, String> map3 = new HashMap<Integer, String>(); 
	    Map<Integer, String> map4 = new HashMap<Integer, String>();  
	    Map<Integer, String> map5 = new HashMap<Integer, String>();
	    Map<Integer, String> map6 = new HashMap<Integer, String>();
	    Map<Integer, String> map7 = new HashMap<Integer, String>();
	    
	    map.put(19, df.format(a1));
	    map.put(20, df.format(a2));
	    map.put(18, df.format(teamfactor));
	   
	    map1.put(19, Integer.toString(fit));
	    map1.put(20, "所包含成果可靠性");
	    map1.put(18, "团队成立时间、成员学历与能力");
	    
	    map2.put(22, df.format(b1));
	    map2.put(21, df.format(b2));
	    
	    map3.put(22, "自筹占总比"+ ct);
	    map3.put(21, "贷款/年收益率"+bt);
	    
	    map4.put(23, df.format(c)); 
	    map5.put(23, Integer.toString(support));
	    
	    map6.put(24, df.format(d));
	    map7.put(24, Integer.toString(period));
	    
	    model.addAttribute("index1", index1);
		model.addAttribute("index2", index2);
		model.addAttribute("index3", index3);
//		model.addAttribute("index4", index4);
		model.addAttribute("a", df.format(a));
		model.addAttribute("b", df.format(b));
		model.addAttribute("c", df.format(c));
		model.addAttribute("d", df.format(d));
		model.addAttribute("map",map);
		model.addAttribute("map1",map1);
		model.addAttribute("map2",map2);
		model.addAttribute("map3",map3);
		model.addAttribute("map4",map4);
		model.addAttribute("map5",map5);
		model.addAttribute("map6",map6);
		model.addAttribute("map7",map7);
		
		model.addAttribute("project",project);
		
		return "evaluationProject";
	}
	
	@RequestMapping("/evaluationProject")
	public String evaluationProject(HttpServletRequest req,Model model) {
		
            User user = (User) req.getSession().getAttribute("user");
        
		    int eva_ex_id = user.getUser_id();//暂时设定一个固定值
			int pro_id = Integer.parseInt(req.getParameter("pro_id"));
			Project project = new Project();
			project = projectService.selectByPrimaryKey(pro_id);

			//获取前四项项系统自动估值
			String project_indexEva1 = req.getParameter("project_indexEva1");
			String project_indexEva2 = req.getParameter("project_indexEva2");
			String project_indexEva3 = req.getParameter("project_indexEva3");
			String project_indexEva4 = req.getParameter("project_indexEva4");
			//获取人工六项评分估值
			
			String scord_index1 = req.getParameter("scord_index1");
			String scord_index2 = req.getParameter("scord_index2");
			String scord_index3 = req.getParameter("scord_index3");
			String scord_index4 = req.getParameter("scord_index4");
			String scord_index5 = req.getParameter("scord_index5");
			String scord_index6 = req.getParameter("scord_index6");
	        //获取评分原因
			String score_reason1 = req.getParameter("score_reason1");
			String score_reason2 = req.getParameter("score_reason2");
			String score_reason3 = req.getParameter("score_reason3");
			String score_reason4 = req.getParameter("score_reason4");
			String score_reason5 = req.getParameter("score_reason5");
			String score_reason6 = req.getParameter("score_reason6");
			
			List<String> reasons = new ArrayList<String>();
			reasons.add(0, score_reason1);
			reasons.add(1, score_reason2);
			reasons.add(2, score_reason3);
			reasons.add(3, score_reason4);
			reasons.add(4, score_reason5);
			reasons.add(5, score_reason6);
			
			DecimalFormat df = new DecimalFormat("0.00");   
			
			Double d1 = Double.parseDouble(project_indexEva1);  
			Double d2 = Double.parseDouble(project_indexEva1); 
			Double d3 = Double.parseDouble(project_indexEva1);  
			Double d4 = Double.parseDouble(project_indexEva1); 
			
			Double d5 = Double.parseDouble(scord_index1);
			Double d6 = Double.parseDouble(scord_index2); 
			Double d7 = Double.parseDouble(scord_index3);  
			Double d8 = Double.parseDouble(scord_index4);
			Double d9 = Double.parseDouble(scord_index5);  
			Double d10 = Double.parseDouble(scord_index6);
			
			
			String ind1 = df.format(d1);  
			String ind2 = df.format(d2); 
			String ind3 = df.format(d3);
			String ind4 = df.format(d4);
			String ind5 = df.format(d5);
			String ind6 = df.format(d6);
			String ind7 = df.format(d7);
			String ind8 = df.format(d8);
			String ind9 = df.format(d9);
			String ind10 = df.format(d10);
			
			d1 = Double.parseDouble(ind1);
			d2 = Double.parseDouble(ind2);
			d3 = Double.parseDouble(ind3);
			d4 = Double.parseDouble(ind4);
			d5 = Double.parseDouble(ind5);
			d6 = Double.parseDouble(ind6);
			d7 = Double.parseDouble(ind6);
			d8 = Double.parseDouble(ind7);
			d9 = Double.parseDouble(ind8);
			d10 = Double.parseDouble(ind10);
			
			
			List<Double> ds = new ArrayList<Double>();
			ds.add(0, d1);
			ds.add(1, d2);
			ds.add(2, d3);
			ds.add(3, d4);
			ds.add(4, d9);
			ds.add(5, d10);
			List<Index1> indexs = evaluationService.selectBytype("2");
			Double auto_eva = 0.00;
			for(int q=0; q<ds.size(); q++){
				auto_eva += ds.get(q) * Double.parseDouble(indexs.get(q).getIndex_remark());
			}
			List<Double> ds1 = new ArrayList<Double>();
			ds1.add(0, d5);
			ds1.add(1, d6);
			ds1.add(2, d7);
			ds1.add(3, d8);
			ds1.add(4, d9);
			ds1.add(5, d10);
			Double manual_eva = 0.00;
			for(int p=0; p<ds1.size(); p++){
				manual_eva += ds1.get(p) * Double.parseDouble(indexs.get(p).getIndex_remark());
			}		
			
			Date curdate1= new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间显示格式
			String cur = sdf.format(curdate1);//将当前时间格式化为需要的类型
			
			Evaluation	evaluation	= new Evaluation();
			
			evaluation.setEva_ex_id(eva_ex_id);
			evaluation.setEva_pro_id(pro_id);
			evaluation.setEva_manual_value(manual_eva);
			evaluation.setEva_auto_value(auto_eva);
			evaluation.setEva_type(2);//项目
			evaluation.setEva_time(cur);
			evaluation.setEva_short("缺陷因素：");
			
			evaluationService.insertEvaluation(evaluation);
			
			Evaluation evaluation2 = new Evaluation();
			evaluation2.setEva_pro_id(pro_id);
			evaluation2.setEva_time(cur);
			evaluation2.setEva_ex_id(eva_ex_id);
			int eva_id = evaluationService.selectByMulAttribute1(evaluation2).getEva_id();
			//写到这里(给score_index的表插数据)
			Score_index si = new Score_index();
	    
			for(int q=0;q<indexs.size();q++){	
				si.setSri_eva_id(eva_id);
				si.setSri_item(indexs.get(q).getIndex_id());
				si.setSri_score(ds1.get(q));
				si.setSri_reason(reasons.get(q));
				evaluationService.insertScore_index(si);
			}

			Double eva_final = auto_eva *0.35 + manual_eva * 0.65;
			int times = project.getPro_times()+1;
			Double evalue= (project.getPro_evalue()*project.getPro_times() + eva_final)/times;
			
			project.setPro_id(pro_id);
			project.setPro_evalue(evalue);
			project.setPro_times(times);
			
			projectService.updateByPrimaryKeySelective(project);
	
		
		    return "redirect:/selectNoEvaProject";
	}
	
	@RequestMapping("/toEvaluationProDetail")
	public String evaluationProjectDetail(HttpServletRequest req,Model model) {
			
			Integer pro_id = Integer.parseInt(req.getParameter("pro_id"));
			Project project = new Project();
			project = projectService.selectByPrimaryKey(pro_id);
			List<Index1> indexs = factorService.selectBytype("3");
			Factor factor = new Factor();
			factor.setFactor_remark("最终指标");
			List<Factor> factors = factorService.selectByindexParameter(factor);
			
			model.addAttribute("factors", factors);
			model.addAttribute("indexs",indexs);
			model.addAttribute("project", project);
		
		    return "evaluationProDetail";
	}
	@RequestMapping("/evaluationProDetail")
	public String evaluationProDetail(HttpServletRequest req,Model model) {
		    User user = (User) req.getSession().getAttribute("user");
        
	         int eva_ex_id = user.getUser_id();//暂时设定一个固定值
		    Integer pro_id = Integer.parseInt(req.getParameter("pro_id"));
		    Project project = new Project();
			project = projectService.selectByPrimaryKey(pro_id);
			
			Factor factor = new Factor();
			factor.setFactor_remark("最终指标");
			List<Factor> factors = factorService.selectByindexParameter(factor);
		//	String project_factor = req.getParameter("project_indexEva1");
			String project_factor = "score";
			List<Index1> indexs = factorService.selectBytype("3");
			Evaluation	evaluation	= new Evaluation();
			
			Date curdate1= new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间显示格式
			String cur = sdf.format(curdate1);//将当前时间格式化为需要的类型
			
			Score_record score_record = new Score_record();
			Double evalue_detail = 0.0000;
			evaluation.setEva_pro_id(pro_id);
			evaluation.setEva_ex_id(eva_ex_id);
			evaluation.setEva_time(cur);
			evaluation.setEva_type(3);
			evaluationService.insertEvaluation(evaluation);
			
			Evaluation evaluation2 = new Evaluation();
			evaluation2.setEva_pro_id(pro_id);
			evaluation2.setEva_time(cur);
			evaluation2.setEva_ex_id(eva_ex_id);
			int eva_id = evaluationService.selectByMulAttribute1(evaluation2).getEva_id();
			int i,j;
			System.out.println("000000000000000");
			for (i=0;i<indexs.size();i++) {
			    Double index_weight = Double.parseDouble(indexs.get(i).getIndex_remark());
			    int index_id = indexs.get(i).getIndex_id();
				for (j=0;j<factors.size();j++) {
					if(factors.get(j).getFactor_index_id()==index_id){
						System.out.println("11111111111");	
					String project_factor_ping = req.getParameter(project_factor+factors.get(j).getFactor_id());
					System.out.println(project_factor+factors.get(j).getFactor_id()+"::fenshu::"+project_factor_ping);
					Double factorscore = 6.0;
					if(project_factor_ping != null){
						factorscore = Double.parseDouble(project_factor_ping);
					}
					score_record.setSr_item(factors.get(j).getFactor_id());
				
					score_record.setSr_score(factorscore);
					
					Double factor_weight = factors.get(j).getFactor_weight();
					evalue_detail += factorscore * factor_weight * index_weight;
					score_record.setSr_eva_id(eva_id);
					evaluationService.insertScore_record(score_record);
					}
					
				}
			
			}
			
			evaluation2.setEva_manual_value(evalue_detail);
			evaluationMapper.updateByPrimaryKeySelective(evaluation2);
			int times = project.getPro_times()+1;
			Double evalue= (project.getPro_evalue()*project.getPro_times() + evalue_detail)/times;
			
			project.setPro_id(pro_id);
			project.setPro_evalue(evalue);
			project.setPro_times(times);
//			project.setPro_meet(evalue_detail);
		    projectService.updateByPrimaryKeySelective(project);
		    
		    return "redirect:/selectNoEvaProject?pageNum=1";
	}
}
