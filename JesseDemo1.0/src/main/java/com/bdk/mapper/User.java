package com.bdk.mapper;

import java.io.Serializable;

import com.bdk.conmon.PageEntity;

/**
 * 用户信息实体
 * ClassName: User 
 * @Description: 
 * @author ChenQuan
 * @date 2017年5月4日下午1:56:45
 */
public class User  extends PageEntity implements Serializable{
	
	private static final long serialVersionUID = -2495347883004134240L;
	
	private int id;
	private String name;
	private String password;
	private String tell;
	private String mail;
	private BDK_USER company;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String userName) {
		this.name = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public BDK_USER getCompany() {
		return company;
	}
	public void setCompany(BDK_USER company) {
		this.company = company;
	}
}