package com.bdk.wecat.json;

public class AccessToken {
  private String access_token;//返回是公众号的全局唯一接口调用凭据access_token的有效期目前为2个小时，需定时刷新，重复获取将导致上次获取的access_token失效。
  private String expires_in;//有效时间  7200秒
public String getAccess_token() {
	return access_token;
}
public void setAccess_token(String access_token) {
	this.access_token = access_token;
}
public String getExpires_in() {
	return expires_in;
}
public void setExpires_in(String expires_in) {
	this.expires_in = expires_in;
}
  
}
