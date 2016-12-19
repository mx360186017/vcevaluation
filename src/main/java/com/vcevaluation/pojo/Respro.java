package com.vcevaluation.pojo;

public class Respro {

	private Integer rpro_id;
	private Integer rpro_res_id;
	private Integer rpro_pro_id;
	private String  rpro_remark;
	
	public Respro(Integer rpro_res_id, Integer rpro_pro_id, String rpro_remark) {
		super();
		this.rpro_res_id = rpro_res_id;
		this.rpro_pro_id = rpro_pro_id;
		this.rpro_remark = rpro_remark;
	}

	public Respro() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getRpro_id() {
		return rpro_id;
	}

	public void setRpro_id(Integer rpro_id) {
		this.rpro_id = rpro_id;
	}

	public Integer getRpro_res_id() {
		return rpro_res_id;
	}

	public void setRpro_res_id(Integer rpro_res_id) {
		this.rpro_res_id = rpro_res_id;
	}

	public Integer getRpro_pro_id() {
		return rpro_pro_id;
	}

	public void setRpro_pro_id(Integer rpro_pro_id) {
		this.rpro_pro_id = rpro_pro_id;
	}

	public String getRpro_remark() {
		return rpro_remark;
	}

	public void setRpro_remark(String rpro_remark) {
		this.rpro_remark = rpro_remark;
	}
	
	
	
}
