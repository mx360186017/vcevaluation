package com.vcevaluation.pojo;

public class Score_index {

	private Integer sri_id;
	private Integer sri_eva_id;
	private Integer sri_item;
	private Double sri_score;
	private String  sri_reason;
	
	public Score_index() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Score_index(Integer sri_eva_id, Integer sri_item, Double sri_score,
			String sri_reason) {
		super();
		this.sri_eva_id = sri_eva_id;
		this.sri_item = sri_item;
		this.sri_score = sri_score;
		this.sri_reason = sri_reason;
	}

	public Integer getSri_id() {
		return sri_id;
	}

	public void setSri_id(Integer sri_id) {
		this.sri_id = sri_id;
	}

	public Integer getSri_eva_id() {
		return sri_eva_id;
	}

	public void setSri_eva_id(Integer sri_eva_id) {
		this.sri_eva_id = sri_eva_id;
	}

	public Integer getSri_item() {
		return sri_item;
	}

	public void setSri_item(Integer sri_item) {
		this.sri_item = sri_item;
	}

	public Double getSri_score() {
		return sri_score;
	}

	public void setSri_score(Double sri_score) {
		this.sri_score = sri_score;
	}

	public String getSri_reason() {
		return sri_reason;
	}

	public void setSri_reason(String sri_reason) {
		this.sri_reason = sri_reason;
	}

	@Override
	public String toString() {
		return "Score_index [sri_id=" + sri_id + ", sri_eva_id=" + sri_eva_id
				+ ", sri_item=" + sri_item + ", sri_score=" + sri_score
				+ ", sri_reason=" + sri_reason + "]";
	}
	
	
}
