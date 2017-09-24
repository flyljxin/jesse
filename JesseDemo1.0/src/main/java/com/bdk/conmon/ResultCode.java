package com.bdk.conmon;

public enum ResultCode {
		OK("100","成功"), 		
		ERRO("200","系统异常"),
		USERNAMEORPASSERRO("101","用户名或密码错误"), 
		PARAMERR("102","参数错误"), 	//参数错误
		NOTLOGIN("103","用户未登录"), 	
		NOTOLDPWD("104","旧密码错误"),
		NOTEQUALPWD("105","两次密码不一致"),
		CANTEQUALPWD("106","新密码不能与旧密码相同"),
		THEQIKANISCUNZAI("107","期刊号重复"),
		USERNAMEISUSED("108","该用户名已存在"),
		NOTZERO("109","期刊号不能等于0"),
		NOISEMPTY("110","上传文件不能为空");
		
		private String value;
		private String name;
		
		ResultCode(String value , String name ) {
			this.value = value;
			this.name = name;
		}

		public String getValue() {
			return this.value;
		}
		public String getName() {
			return this.name;
		}
	}