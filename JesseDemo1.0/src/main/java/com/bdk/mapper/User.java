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
	private String userType;
	private String roleId;
	private String mark;
	
	private String testobj;//测试类12
	public String getTestobj() {
		////33355555---2221113344
		return testobj;
	}
	public void setTestobj(String testobj) {
		this.testobj = testobj;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
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