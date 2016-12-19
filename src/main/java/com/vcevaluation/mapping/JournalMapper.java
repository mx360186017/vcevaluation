package com.vcevaluation.mapping;

import java.util.List;

import com.vcevaluation.pojo.Journal;


public interface JournalMapper {

	List<Journal> selectallJournal();

	Journal selectByJournalPrimaryKey(Integer j_id);
	
}
