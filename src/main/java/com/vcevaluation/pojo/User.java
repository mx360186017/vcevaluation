package com.vcevaluation.pojo;

/**
 * @author Administrator
 *
 */
public class User {
	
	private Integer user_id;
	private String  user_name;
	private String  user_pwd;
	private String  user_realname;
	private Integer user_type;
	private Integer user_age;
	private Integer user_gender;
	private Integer user_edu;
	private String  user_email;
	private String  user_remark;
	private Integer user_flag;
	private Integer user_url;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String user_name, String user_pwd, String user_realname,
			Integer user_type, Integer user_age, Integer user_gender,
			Integer user_edu, String user_email, String user_remark,
			Integer user_flag,Integer user_url) {
		super();
		this.user_name = user_name;
		this.user_pwd = user_pwd;
		this.user_realname = user_realname;
		this.user_type = user_type;
		this.user_age = user_age;
		this.user_gender = user_gender;
		this.user_edu = user_edu;
		this.user_email = user_email;
		this.user_remark = user_remark;
		this.user_flag = user_flag;
		this.user_url = user_url;
	}



	public Integer getUser_url() {
		return user_url;
	}

	public void setUser_url(Integer user_url) {
		this.user_url = user_url;
	}

	public Integer getUser_id() {
		return user_id;
	}



	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}



	public String getUser_name() {
		return user_name;
	}



	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}



	public String getUser_pwd() {
		return user_pwd;
	}



	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}



	public String getUser_realname() {
		return user_realname;
	}



	public void setUser_realname(String user_realname) {
		this.user_realname = user_realname;
	}



	public Integer getUser_type() {
		return user_type;
	}



	public void setUser_type(Integer user_type) {
		this.user_type = user_type;
	}



	public Integer getUser_age() {
		return user_age;
	}



	public void setUser_age(Integer user_age) {
		this.user_age = user_age;
	}



	public Integer getUser_gender() {
		return user_gender;
	}



	public void setUser_gender(Integer user_gender) {
		this.user_gender = user_gender;
	}



	public Integer getUser_edu() {
		return user_edu;
	}



	public void setUser_edu(Integer user_edu) {
		this.user_edu = user_edu;
	}



	public String getUser_email() {
		return user_email;
	}



	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}



	public String getUser_remark() {
		return user_remark;
	}



	public void setUser_remark(String user_remark) {
		this.user_remark = user_remark;
	}



	public Integer getUser_flag() {
		return user_flag;
	}



	public void setUser_flag(Integer user_flag) {
		this.user_flag = user_flag;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name
				+ ", user_pwd=" + user_pwd + ", user_realname=" + user_realname
				+ ", user_type=" + user_type + ", user_age=" + user_age
				+ ", user_gender=" + user_gender + ", user_edu=" + user_edu
				+ ", user_email=" + user_email + ", user_remark=" + user_remark
				+ ", user_flag=" + user_flag + ", user_url=" + user_url + "]";
	}




	
	

}
