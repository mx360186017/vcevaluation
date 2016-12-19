package com.vcevaluation.pojo;

public class Paper {

	private Integer paper_id;
	private String  paper_name;
	private String  paper_pubtime;
	private Integer paper_cited;
	private String  paper_keywords;
	private Integer paper_category;
	private Integer published_journals;
	private String  paper_remark;
	
	public Paper() {
		// TODO Auto-generated constructor stub
	}
	
	public Paper(String paper_name, String paper_pubtime, Integer paper_cited,
			String paper_keywords, Integer paper_category,
			Integer published_journals, String paper_remark) {
		super();
		this.paper_name = paper_name;
		this.paper_pubtime = paper_pubtime;
		this.paper_cited = paper_cited;
		this.paper_keywords = paper_keywords;
		this.paper_category = paper_category;
		this.published_journals = published_journals;
		this.paper_remark = paper_remark;
	}



	public Integer getPaper_id() {
		return paper_id;
	}

	public void setPaper_id(Integer paper_id) {
		this.paper_id = paper_id;
	}

	public String getPaper_name() {
		return paper_name;
	}

	public void setPaper_name(String paper_name) {
		this.paper_name = paper_name;
	}

	public String getPaper_pubtime() {
		return paper_pubtime;
	}

	public void setPaper_pubtime(String paper_pubtime) {
		this.paper_pubtime = paper_pubtime;
	}

	public Integer getPaper_cited() {
		return paper_cited;
	}

	public void setPaper_cited(Integer paper_cited) {
		this.paper_cited = paper_cited;
	}

	public String getPaper_keywords() {
		return paper_keywords;
	}

	public void setPaper_keywords(String paper_keywords) {
		this.paper_keywords = paper_keywords;
	}

	public Integer getPaper_category() {
		return paper_category;
	}

	public void setPaper_category(Integer paper_category) {
		this.paper_category = paper_category;
	}

	public Integer getPublished_journals() {
		return published_journals;
	}

	public void setPublished_journals(Integer published_journals) {
		this.published_journals = published_journals;
	}

	public String getPaper_remark() {
		return paper_remark;
	}

	public void setPaper_remark(String paper_remark) {
		this.paper_remark = paper_remark;
	}

	@Override
	public String toString() {
		return "Paper [paper_id=" + paper_id + ", paper_name=" + paper_name
				+ ", paper_pubtime=" + paper_pubtime + ", paper_cited="
				+ paper_cited + ", paper_keywords=" + paper_keywords
				+ ", paper_category=" + paper_category
				+ ", published_journals=" + published_journals
				+ ", paper_remark=" + paper_remark + "]";
	}
	

}
