package com.zmt;

public class TestProperty {
	
	private String driverClassName;
	private String username;
	
	public void getProperty(){
		System.out.println("---driverClassName="+driverClassName);
	}

	public String getDriverClassName() {
		return driverClassName;
	}

	public void setDriverClassName(String driverClassName) {
		this.driverClassName = driverClassName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	

	
}
