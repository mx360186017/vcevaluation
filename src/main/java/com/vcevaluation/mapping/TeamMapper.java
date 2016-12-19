package com.vcevaluation.mapping;

import java.util.List;
import java.util.Map;

import com.vcevaluation.pojo.Team;


public interface TeamMapper {
	
	int insertTeam(Team team);
	
	int deleteByPrimaryKey(Integer team_id);

	Team selectByPrimaryKey(Integer team_id);
    
    List<Team> selectallTeam();
    
    int updateByPrimaryKeySelective(Team team);
    
    List<Map<String, Object>> selectMemberByTeamId(Integer team_id);
    
    List<Map<String, Object>> selectTeamMember();

    
}
