package com.vcevaluation.mapping;

import java.util.List;

import com.vcevaluation.pojo.Member;

public interface MemberMapper {

    int insertMember(Member member);
	
	int deleteByPrimaryKey(Integer member_id);

	Member selectByPrimaryKey(Integer member_id);
    
    List<Member> selectall();
    
    List<Member> selectMemberByTeamID(Integer member_team);
    
    int updateByPrimaryKeySelective(Member member);
}
