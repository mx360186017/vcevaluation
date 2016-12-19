package com.vcevaluation.pojo;

public class Score_record {

	private Integer sr_id;
	private Integer sr_eva_id;
	private Integer sr_item;
	private Double sr_score;
	private String  sr_reason;
	public Score_record() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Score_record(Integer sr_eva_id, Integer sr_item, Double sr_score,
			String sr_reason) {
		super();
		this.sr_eva_id = sr_eva_id;
		this.sr_item = sr_item;
		this.sr_score = sr_score;
		this.sr_reason = sr_reason;
	}
	public Integer getSr_id() {
		return sr_id;
	}
	public void setSr_id(Integer sr_id) {
		this.sr_id = sr_id;
	}
	public Integer getSr_eva_id() {
		return sr_eva_id;
	}
	public void setSr_eva_id(Integer sr_eva_id) {
		this.sr_eva_id = sr_eva_id;
	}
	public Integer getSr_item() {
		return sr_item;
	}
	public void setSr_item(Integer sr_item) {
		this.sr_item = sr_item;
	}
	public Double getSr_score() {
		return sr_score;
	}
	public void setSr_score(Double sr_score) {
		this.sr_score = sr_score;
	}
	public String getSr_reason() {
		return sr_reason;
	}
	public void setSr_reason(String sr_reason) {
		this.sr_reason = sr_reason;
	}
	@Override
	public String toString() {
		return "Score_record [sr_id=" + sr_id + ", sr_eva_id=" + sr_eva_id
				+ ", sr_item=" + sr_item + ", sr_score=" + sr_score
				+ ", sr_reason=" + sr_reason + "]";
	}
	
	
}
