package com.vcevaluation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import com.vcevaluation.mapping.MemberMapper;
import com.vcevaluation.mapping.TeamMapper;
import com.vcevaluation.pojo.Member;
import com.vcevaluation.pojo.Team;

@Service
@Transactional
public class TeamService {

	@Autowired
	TeamMapper teamMapper;
	@Autowired
	MemberMapper memberMapper;
    public List<Team> selectAllTeam(){
		
		return teamMapper.selectallTeam();
		
	}
    public List<Member> selectMemberByTeamID(Integer team_id){
		
		return memberMapper.selectMemberByTeamID(team_id);
		
	}
    public Team selectByPrimaryKey(Integer team_id){
    	
    	Team team = teamMapper.selectByPrimaryKey(team_id);
    	return team;
    }
    
    public List<Map<String, Object>> selectMemberByTeamId(Integer team_id){
    	
    	List<Map<String, Object>> tm = teamMapper.selectMemberByTeamId(team_id);
    	
    	return tm;
    }
    
    public List<Map<String, Object>> selectTeamMember(){
    	
    	List<Map<String, Object>> tsm = teamMapper.selectTeamMember();
    	
    	return tsm;
    }
    
    public List<Member> selectAllMember(){
    	List<Member> members = memberMapper.selectall();
    	return members;
    }
}
