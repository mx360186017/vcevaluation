package com.vcevaluation.pojo;

public class Patent {

	private Integer patent_id;
	private String  pa_name;
	private String  pa_number;
	private String  pa_inventor;
	private String pa_pubtime;
	private String pa_abstract;
	private Integer pa_type;
	private String pa_details;
	private String  pa_remark;	
	
	public Patent() {
		// TODO Auto-generated constructor stub
	}
	
	public Patent(String pa_name, String pa_number, String pa_inventor,
			String pa_pubtime, String pa_abstract, Integer pa_type,
			String pa_details, String pa_remark) {
		super();
		this.pa_name = pa_name;
		this.pa_number = pa_number;
		this.pa_inventor = pa_inventor;
		this.pa_pubtime = pa_pubtime;
		this.pa_abstract = pa_abstract;
		this.pa_type = pa_type;
		this.pa_details = pa_details;
		this.pa_remark = pa_remark;
	}


	public Integer getPatent_id() {
		return patent_id;
	}

	public void setPatent_id(Integer patent_id) {
		this.patent_id = patent_id;
	}

	public String getPa_name() {
		return pa_name;
	}

	public void setPa_name(String pa_name) {
		this.pa_name = pa_name;
	}

	public String getPa_number() {
		return pa_number;
	}

	public void setPa_number(String pa_number) {
		this.pa_number = pa_number;
	}

	public String getPa_inventor() {
		return pa_inventor;
	}

	public void setPa_inventor(String pa_inventor) {
		this.pa_inventor = pa_inventor;
	}

	public String getPa_pubtime() {
		return pa_pubtime;
	}

	public void setPa_pubtime(String pa_pubtime) {
		this.pa_pubtime = pa_pubtime;
	}

	public String getPa_abstract() {
		return pa_abstract;
	}

	public void setPa_abstract(String pa_abstract) {
		this.pa_abstract = pa_abstract;
	}

	public Integer getPa_type() {
		return pa_type;
	}

	public void setPa_type(Integer pa_type) {
		this.pa_type = pa_type;
	}

	public String getPa_details() {
		return pa_details;
	}

	public void setPa_details(String pa_details) {
		this.pa_details = pa_details;
	}

	public String getPa_remark() {
		return pa_remark;
	}

	public void setPa_remark(String pa_remark) {
		this.pa_remark = pa_remark;
	}

	@Override
	public String toString() {
		return "Patent [patent_id=" + patent_id + ", pa_name=" + pa_name
				+ ", pa_number=" + pa_number + ", pa_inventor=" + pa_inventor
				+ ", pa_pubtime=" + pa_pubtime + ", pa_abstract=" + pa_abstract
				+ ", pa_type=" + pa_type + ", pa_details=" + pa_details
				+ ", pa_remark=" + pa_remark + "]";
	}

	
	
}
