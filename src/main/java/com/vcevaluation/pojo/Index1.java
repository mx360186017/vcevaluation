package com.vcevaluation.pojo;

public class Index1 {

	private Integer index_id;
	private Integer parent_id;
	private String  index_name;
	private String  index_remark;
	private String  index_type;
	
	public Index1(Integer parent_id, String index_name, String index_remark,
			String index_type) {
		super();
		this.parent_id = parent_id;
		this.index_name = index_name;
		this.index_remark = index_remark;
		this.index_type = index_type;
	}
	
	public Index1() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getIndex_id() {
		return index_id;
	}
	public void setIndex_id(Integer index_id) {
		this.index_id = index_id;
	}
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	public String getIndex_name() {
		return index_name;
	}
	public void setIndex_name(String index_name) {
		this.index_name = index_name;
	}
	public String getIndex_remark() {
		return index_remark;
	}
	public void setIndex_remark(String index_remark) {
		this.index_remark = index_remark;
	}
	public String getIndex_type() {
		return index_type;
	}
	public void setIndex_type(String index_type) {
		this.index_type = index_type;
	}

}
