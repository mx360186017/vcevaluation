package com.vcevaluation.pojo;

public class Algorithm {

	private Integer a_id;
	private String  a_name;
	private String  a_detail;
	private String  a_reg;
	public Algorithm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Algorithm(String a_name, String a_detail, String a_reg) {
		super();
		this.a_name = a_name;
		this.a_detail = a_detail;
		this.a_reg = a_reg;
	}
	public Integer getA_id() {
		return a_id;
	}
	public void setA_id(Integer a_id) {
		this.a_id = a_id;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_detail() {
		return a_detail;
	}
	public void setA_detail(String a_detail) {
		this.a_detail = a_detail;
	}
	public String getA_reg() {
		return a_reg;
	}
	public void setA_reg(String a_reg) {
		this.a_reg = a_reg;
	}
	

}
