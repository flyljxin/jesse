package com.bdk.wecat.model;

public class WeixinContext {
	 private static String accessToken;//token值
	 private static String accessTicket;//票据
	 public static void setAccessToken(String accessToken) {
		WeixinContext.accessToken=accessToken;
	}
	 
	 public static String getAccessToken() {
	     return 	WeixinContext.accessToken;
	}

	public static String getAccessTicket() {
		return accessTicket;
	}

	public static void setAccessTicket(String accessTicket) {
		WeixinContext.accessTicket = accessTicket;
	}
	 
	 
}
