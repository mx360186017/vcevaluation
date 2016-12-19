package com.vcevaluation.pojo;

public class Resultprovider {

	private Integer rp_id;
	private String  rp_qualification;
	private String  rp_field;
	private String  rp_research;	
	
	public Resultprovider() {
		// TODO Auto-generated constructor stub
	}
	
	public Resultprovider(String rp_qualification, String rp_field,
			String rp_research) {
		super();
		this.rp_qualification = rp_qualification;
		this.rp_field = rp_field;
		this.rp_research = rp_research;
	}

	public Integer getRp_id() {
		return rp_id;
	}

	public void setRp_id(Integer rp_id) {
		this.rp_id = rp_id;
	}

	public String getRp_qualification() {
		return rp_qualification;
	}

	public void setRp_qualification(String rp_qualification) {
		this.rp_qualification = rp_qualification;
	}

	public String getRp_field() {
		return rp_field;
	}

	public void setRp_field(String rp_field) {
		this.rp_field = rp_field;
	}

	public String getRp_research() {
		return rp_research;
	}

	public void setRp_research(String rp_research) {
		this.rp_research = rp_research;
	}

	@Override
	public String toString() {
		return "Resultprovider [rp_id=" + rp_id + ", rp_qualification="
				+ rp_qualification + ", rp_field=" + rp_field
				+ ", rp_research=" + rp_research + "]";
	}

	
}
