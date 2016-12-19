package com.vcevaluation.pojo;

public class Journal {

	private Integer j_id;
	private String  j_name;
	private Double  j_factor;
	private String  j_classfy;
	
	
	public Journal(String j_name, Double j_factor, String j_classfy) {
		super();
		this.j_name = j_name;
		this.j_factor = j_factor;
		this.j_classfy = j_classfy;
	}


	public Journal() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Integer getJ_id() {
		return j_id;
	}


	public void setJ_id(Integer j_id) {
		this.j_id = j_id;
	}


	public String getJ_name() {
		return j_name;
	}


	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}


	public Double getJ_factor() {
		return j_factor;
	}


	public void setJ_factor(Double j_factor) {
		this.j_factor = j_factor;
	}


	public String getJ_classfy() {
		return j_classfy;
	}


	public void setJ_classfy(String j_classfy) {
		this.j_classfy = j_classfy;
	}
	
	

}
