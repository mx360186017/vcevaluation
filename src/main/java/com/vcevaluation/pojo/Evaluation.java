package com.vcevaluation.pojo;

public class Evaluation {

	private Integer eva_id;
	private Integer eva_pro_id;
	private Integer eva_res_id;
	private Integer eva_ex_id;
	private Double  eva_manual_value;
	private Double  eva_auto_value;
	private String  eva_time;
	private String  eva_report;
	private Integer eva_type;
	private String  eva_short;
	

	public Evaluation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Evaluation(Integer eva_pro_id, Integer eva_res_id,
			Integer eva_index_id, Integer eva_ex_id, Double eva_manual_value,
			Double eva_auto_value, String eva_time, String eva_report,
			Integer eva_type) {
		super();
		this.eva_pro_id = eva_pro_id;
		this.eva_res_id = eva_res_id;
	
		this.eva_ex_id = eva_ex_id;
		this.eva_manual_value = eva_manual_value;
		this.eva_auto_value = eva_auto_value;
		this.eva_time = eva_time;
		this.eva_report = eva_report;
		this.eva_type = eva_type;
	}
	public Integer getEva_id() {
		return eva_id;
	}
	public void setEva_id(Integer eva_id) {
		this.eva_id = eva_id;
	}
	public Integer getEva_pro_id() {
		return eva_pro_id;
	}
	public void setEva_pro_id(Integer eva_pro_id) {
		this.eva_pro_id = eva_pro_id;
	}
	public Integer getEva_res_id() {
		return eva_res_id;
	}
	public void setEva_res_id(Integer eva_res_id) {
		this.eva_res_id = eva_res_id;
	}

	public Integer getEva_ex_id() {
		return eva_ex_id;
	}
	public void setEva_ex_id(Integer eva_ex_id) {
		this.eva_ex_id = eva_ex_id;
	}
	public Double getEva_manual_value() {
		return eva_manual_value;
	}
	public void setEva_manual_value(Double eva_manual_value) {
		this.eva_manual_value = eva_manual_value;
	}
	public Double getEva_auto_value() {
		return eva_auto_value;
	}
	public void setEva_auto_value(Double eva_auto_value) {
		this.eva_auto_value = eva_auto_value;
	}
	public String getEva_time() {
		return eva_time;
	}
	public void setEva_time(String eva_time) {
		this.eva_time = eva_time;
	}
	public String getEva_report() {
		return eva_report;
	}
	public void setEva_report(String eva_report) {
		this.eva_report = eva_report;
	}
	public Integer getEva_type() {
		return eva_type;
	}
	public void setEva_type(Integer eva_type) {
		this.eva_type = eva_type;
	}
	public String getEva_short() {
		return eva_short;
	}
	public void setEva_short(String eva_short) {
		this.eva_short = eva_short;
	}
	@Override
	public String toString() {
		return "Evaluation [eva_id=" + eva_id + ", eva_pro_id=" + eva_pro_id
				+ ", eva_res_id=" + eva_res_id + ", eva_ex_id=" + eva_ex_id
				+ ", eva_manual_value=" + eva_manual_value
				+ ", eva_auto_value=" + eva_auto_value + ", eva_time="
				+ eva_time + ", eva_report=" + eva_report + ", eva_type="
				+ eva_type + "]";
	}
	
	
}
