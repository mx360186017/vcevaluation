package com.vcevaluation.pojo;

public class Result {

	private Integer res_id;
	private Integer res_type;
	private String  res_name;
	private Integer res_provider;
	private String  res_introduction;
	private Integer res_url;
	private Integer res_flag;
	private double  res_evalue;
	private String  res_eva_deadline;
	private String  res_protime;
	private Integer res_times;
	

	public Result() {
		// TODO Auto-generated constructor stub
	}
	
	public Result(Integer res_type, String res_name, Integer res_provider,
			String res_introduction, Integer res_url, Integer res_flag,
			double res_evalue, String res_eva_deadline,String  res_protime,Integer res_times) {
		super();
		this.res_type = res_type;
		this.res_name = res_name;
		this.res_provider = res_provider;
		this.res_introduction = res_introduction;
		this.res_url = res_url;
		this.res_flag = res_flag;
		this.res_evalue = res_evalue;
		this.res_eva_deadline = res_eva_deadline;
		this.res_protime = res_protime;
		this.res_times = res_times;
	}

	public Integer getRes_type() {
		return res_type;
	}

	public void setRes_type(Integer res_type) {
		this.res_type = res_type;
	}

	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public Integer getRes_provider() {
		return res_provider;
	}

	public void setRes_provider(Integer res_provider) {
		this.res_provider = res_provider;
	}

	public String getRes_introduction() {
		return res_introduction;
	}

	public void setRes_introduction(String res_introduction) {
		this.res_introduction = res_introduction;
	}

	public Integer getRes_url() {
		return res_url;
	}

	public void setRes_url(Integer res_url) {
		this.res_url = res_url;
	}

	public Integer getRes_flag() {
		return res_flag;
	}

	public void setRes_flag(Integer res_flag) {
		this.res_flag = res_flag;
	}

	public Integer getRes_id() {
		return res_id;
	}

	public void setRes_id(Integer res_id) {
		this.res_id = res_id;
	}

	public double getRes_evalue() {
		return res_evalue;
	}

	public void setRes_evalue(double res_evalue) {
		this.res_evalue = res_evalue;
	}

	public String getRes_eva_deadline() {
		return res_eva_deadline;
	}

	public void setRes_eva_deadline(String res_eva_deadline) {
		this.res_eva_deadline = res_eva_deadline;
	}

	public String getRes_protime() {
		return res_protime;
	}

	public void setRes_protime(String res_protime) {
		this.res_protime = res_protime;
	}

	public Integer getRes_times() {
		return res_times;
	}

	public void setRes_times(Integer res_times) {
		this.res_times = res_times;
	}

	@Override
	public String toString() {
		return "Result [res_id=" + res_id + ", res_type=" + res_type
				+ ", res_name=" + res_name + ", res_provider=" + res_provider
				+ ", res_introduction=" + res_introduction + ", res_url="
				+ res_url + ", res_flag=" + res_flag + ", res_evalue="
				+ res_evalue + ", res_eva_deadline=" + res_eva_deadline
				+ ", res_protime=" + res_protime + ", res_times=" + res_times
				+ "]";
	}





	
}
