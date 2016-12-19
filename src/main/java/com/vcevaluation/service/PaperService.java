
package com.vcevaluation.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.vcevaluation.mapping.JournalMapper;
import com.vcevaluation.mapping.PaperMapper;
import com.vcevaluation.pojo.Journal;
import com.vcevaluation.pojo.Paper;



@Service
@Transactional
public class PaperService {

	@Autowired
	PaperMapper paperMapper;
	@Autowired
	JournalMapper journalMapper;
	//提交论文
	public void insertPaper(Paper paper){
		paperMapper.insertPaper(paper);
	}
	
	public Paper selectByPrimaryKey(Integer paper_id){
		
		return paperMapper.selectByPrimaryKey(paper_id);
	}
	
	//查询期刊
	public List<Journal> selectallJournal(){
		
		List<Journal> journals = journalMapper.selectallJournal();
		
		return journals;
	}
	
	
	//查询某个期刊影响因子
	public  Journal selectByJournal(Integer j_id){
		
		return journalMapper.selectByJournalPrimaryKey(j_id);
	}
	
}
