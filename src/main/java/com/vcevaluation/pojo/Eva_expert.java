package com.vcevaluation.pojo;

public class Eva_expert {

	private Integer ex_id;
	private String  ex_qualification;
	private String  ex_expertise;
	private String  ex_businessfield;
	private String  ex_remark;
	
	public Eva_expert() {
		// TODO Auto-generated constructor stub
	}

	public Eva_expert(String ex_qualification, String ex_expertise,
			String ex_businessfield, String ex_remark) {
		super();
		this.ex_qualification = ex_qualification;
		this.ex_expertise = ex_expertise;
		this.ex_businessfield = ex_businessfield;
		this.ex_remark = ex_remark;
	}



	public Integer getEx_id() {
		return ex_id;
	}

	public void setEx_id(Integer ex_id) {
		this.ex_id = ex_id;
	}

	public String getEx_qualification() {
		return ex_qualification;
	}

	public void setEx_qualification(String ex_qualification) {
		this.ex_qualification = ex_qualification;
	}

	public String getEx_expertise() {
		return ex_expertise;
	}

	public void setEx_expertise(String ex_expertise) {
		this.ex_expertise = ex_expertise;
	}

	public String getEx_businessfield() {
		return ex_businessfield;
	}

	public void setEx_businessfield(String ex_businessfield) {
		this.ex_businessfield = ex_businessfield;
	}

	public String getEx_remark() {
		return ex_remark;
	}

	public void setEx_remark(String ex_remark) {
		this.ex_remark = ex_remark;
	}

	@Override
	public String toString() {
		return "Eva_expert [ex_id=" + ex_id + ", ex_qualification="
				+ ex_qualification + ", ex_expertise=" + ex_expertise
				+ ", ex_businessfield=" + ex_businessfield + ", ex_remark="
				+ ex_remark + "]";
	}

	
}
