package com.vcevaluation.pojo;

import org.apache.hadoop.classification.InterfaceAudience.Private;

public class Member {

	private Integer member_id;
	private String  member_name;
	private Integer member_gender;
	private Integer member_edu;
	private String  member_job;
	private String  member_work;
	private Integer member_team;
	private String  member_intime;
	private String  member_level;
	private String  member_remark;
	private String  member_image; 
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMember_image() {
		return member_image;
	}

	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}

	public Member(String member_name, Integer member_gender,
			Integer member_edu, String member_job, String member_work,
			Integer member_team, String member_intime, String member_level,
			String member_remark, String member_image) {
		super();
		this.member_name = member_name;
		this.member_gender = member_gender;
		this.member_edu = member_edu;
		this.member_job = member_job;
		this.member_work = member_work;
		this.member_team = member_team;
		this.member_intime = member_intime;
		this.member_level = member_level;
		this.member_remark = member_remark;
		this.member_image = member_image;
	}

	public Integer getMember_id() {
		return member_id;
	}
	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public Integer getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(Integer member_gender) {
		this.member_gender = member_gender;
	}
	public Integer getMember_edu() {
		return member_edu;
	}
	public void setMember_edu(Integer member_edu) {
		this.member_edu = member_edu;
	}
	public String getMember_job() {
		return member_job;
	}
	public void setMember_job(String member_job) {
		this.member_job = member_job;
	}
	public String getMember_work() {
		return member_work;
	}
	public void setMember_work(String member_work) {
		this.member_work = member_work;
	}
	public Integer getMenber_team() {
		return member_team;
	}
	public void setMenber_team(Integer menber_team) {
		this.member_team = menber_team;
	}

	public Integer getMember_team() {
		return member_team;
	}

	public void setMember_team(Integer member_team) {
		this.member_team = member_team;
	}

	public String getMember_intime() {
		return member_intime;
	}

	public void setMember_intime(String member_intime) {
		this.member_intime = member_intime;
	}

	public String getMember_level() {
		return member_level;
	}

	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}

	public String getMember_remark() {
		return member_remark;
	}

	public void setMember_remark(String member_remark) {
		this.member_remark = member_remark;
	}
}
