package com.bdk.wecat.json;

//微信错误返回类
public class ErrorEntity {
	private String errcode;//异常编号
	private String errmsg;//异常信息
	public String getErrcode() {
		return errcode;
	}
	public void setErrcode(String errcode) {
		this.errcode = errcode;
	}
	public String getErrmsg() {
		return errmsg;
	}
	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}
}
