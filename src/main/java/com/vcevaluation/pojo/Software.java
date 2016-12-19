package com.vcevaluation.pojo;

public class Software {

	private Integer s_id;
	private String  s_name;
	private Integer s_ispublished;
	private String  s_finishtime;
	private Integer s_level;
	private Integer s_ccm;
	private String  s_brief;
	private String  s_remark;

	public Software() {
		// TODO Auto-generated constructor stub
	}

	public Software(String s_name, Integer s_ispublished, String s_finishtime,
			Integer s_level, Integer s_ccm, String s_brief, String s_remark) {
		super();
		this.s_name = s_name;
		this.s_ispublished = s_ispublished;
		this.s_finishtime = s_finishtime;
		this.s_level = s_level;
		this.s_ccm = s_ccm;
		this.s_brief = s_brief;
		this.s_remark = s_remark;
	}

	public Integer getS_id() {
		return s_id;
	}

	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public Integer getS_ispublished() {
		return s_ispublished;
	}

	public void setS_ispublished(Integer s_ispublished) {
		this.s_ispublished = s_ispublished;
	}

	public String getS_finishtime() {
		return s_finishtime;
	}

	public void setS_finishtime(String s_finishtime) {
		this.s_finishtime = s_finishtime;
	}

	public Integer getS_level() {
		return s_level;
	}

	public void setS_level(Integer s_level) {
		this.s_level = s_level;
	}

	public Integer getS_ccm() {
		return s_ccm;
	}

	public void setS_ccm(Integer s_ccm) {
		this.s_ccm = s_ccm;
	}

	public String getS_brief() {
		return s_brief;
	}

	public void setS_brief(String s_brief) {
		this.s_brief = s_brief;
	}

	public String getS_remark() {
		return s_remark;
	}

	public void setS_remark(String s_remark) {
		this.s_remark = s_remark;
	}

	@Override
	public String toString() {
		return "Software [s_id=" + s_id + ", s_name=" + s_name
				+ ", s_ispublished=" + s_ispublished + ", s_finishtime="
				+ s_finishtime + ", s_level=" + s_level + ", s_ccm=" + s_ccm
				+ ", s_brief=" + s_brief + ", s_remark=" + s_remark + "]";
	}

	
}
