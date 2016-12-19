package com.vcevaluation.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vcevaluation.pojo.Team;
import com.vcevaluation.service.TeamService;

@Controller
public class TeamController {

	@Autowired 
	TeamService teamService;

	
	@RequestMapping("/selectTeamSmall")
	public String selectPassResult(HttpServletResponse res, HttpServletRequest req,Model model) {
		
		List<Team> list7 = teamService.selectAllTeam();
	
		model.addAttribute("list7",list7);
		
		return "queryteamSmall";
	}
	
//	@RequestMapping("/selectTeamMember")
//	public String selectTeamMember(Model model){
//		
//		List<Map<String, Object>> tsm = teamService.selectTeamMember();
//		
//		model.addAttribute("tsm",tsm);
//		
//		return "selectTeamMember";
//	}
	
	@RequestMapping("/selectAllTeam")
	public String selectTeamMember(Model model){
		
		List<Team> teams = teamService.selectAllTeam();
		
		model.addAttribute("teams",teams);
		
		return "selectAllTeam";
	}
	
	@RequestMapping("/toteamItem")
	public String toteamItem(HttpServletRequest req,Model model) {
		
		Integer team_id = Integer.parseInt(req.getParameter("team_id"));
		
		Team team = new Team();
		
		team = teamService.selectByPrimaryKey(team_id);
		
		List<Map<String, Object>> tm = teamService.selectMemberByTeamId(team_id);
		
		model.addAttribute("tm",tm);
		model.addAttribute(team);
		
		return "teamItem";
	}
}
