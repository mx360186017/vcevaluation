package com.vcevaluation.pojo;

public class Team {

	private Integer team_id;
	private String  team_name;
	private String  team_introduction;
	private String  cooperation_time;
	private String  team_remark;
	
	public Team(String team_name, String team_introduction, String cooperation_time,
			String team_remark) {
		super();
		this.team_name = team_name;
		this.team_introduction = team_introduction;
		this.cooperation_time = cooperation_time;
		this.team_remark = team_remark;
	}
	public Team() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getTeam_id() {
		return team_id;
	}
	public void setTeam_id(Integer team_id) {
		this.team_id = team_id;
	}
	
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getTeam_introduction() {
		return team_introduction;
	}
	public void setTeam_introduction(String team_introduction) {
		this.team_introduction = team_introduction;
	}
	public String getCooperation_time() {
		return cooperation_time;
	}
	public void setCooperation_time(String cooperation_time) {
		this.cooperation_time = cooperation_time;
	}
	public String getTeam_remark() {
		return team_remark;
	}
	public void setTeam_remark(String team_remark) {
		this.team_remark = team_remark;
	}
	
	
}
