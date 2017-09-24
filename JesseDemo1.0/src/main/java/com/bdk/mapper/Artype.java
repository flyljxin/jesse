package com.bdk.mapper;

import java.io.Serializable;

/**
 * 板块类型对象
 * ClassName: Artype 
 * @Description: 
 * @author ChenQuan
 * @date 2017年5月11日上午9:37:50
 */
public class Artype implements Serializable{

	private static final long serialVersionUID = -5056571224461838881L;
	
	/**
	 * 类型代码
	 */
	private int code;
	
	/**
	 * 类型名称
	 */
	private String type;

	public int getCode() {
		return code;
	}	

	public void setCode(int code) {
		this.code = code;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	
}
