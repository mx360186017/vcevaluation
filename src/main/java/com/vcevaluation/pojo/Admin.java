package com.vcevaluation.pojo;

public class Admin {

	private Integer admin_id;
	private String  admin_name;
	private String  admin_pwd;
	

	public Admin() {
		// TODO Auto-generated constructor stub
	}
	
	public Admin(String admin_name, String admin_pwd) {
		super();
		this.admin_name = admin_name;
		this.admin_pwd = admin_pwd;
	}

	public Integer getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getAdmin_pwd() {
		return admin_pwd;
	}

	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}

	@Override
	public String toString() {
		return "admin [admin_id=" + admin_id + ", admin_name=" + admin_name
				+ ", admin_pwd=" + admin_pwd + "]";
	}

	
}
