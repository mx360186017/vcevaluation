package com.vcevaluation.pojo;

public class Factor {

	private Integer factor_id;
	private Integer factor_index_id;
	private String  factor_name;
	private String  factor_parameter;
	private Double  factor_weight;
	private String  factor_remark;
	public Factor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Factor(Integer factor_index_id, String factor_name,
			String factor_parameter, Double factor_weight, String factor_remark) {
		super();
		this.factor_index_id = factor_index_id;
		this.factor_name = factor_name;
		this.factor_parameter = factor_parameter;
		this.factor_weight = factor_weight;
		this.factor_remark = factor_remark;
	}
	public Integer getFactor_id() {
		return factor_id;
	}
	public void setFactor_id(Integer factor_id) {
		this.factor_id = factor_id;
	}
	public Integer getFactor_index_id() {
		return factor_index_id;
	}
	public void setFactor_index_id(Integer factor_index_id) {
		this.factor_index_id = factor_index_id;
	}
	public String getFactor_name() {
		return factor_name;
	}
	public void setFactor_name(String factor_name) {
		this.factor_name = factor_name;
	}
	public String getFactor_parameter() {
		return factor_parameter;
	}
	public void setFactor_parameter(String factor_parameter) {
		this.factor_parameter = factor_parameter;
	}
	public Double getFactor_weight() {
		return factor_weight;
	}
	public void setFactor_weight(Double factor_weight) {
		this.factor_weight = factor_weight;
	}
	public String getFactor_remark() {
		return factor_remark;
	}
	public void setFactor_remark(String factor_remark) {
		this.factor_remark = factor_remark;
	}

}
