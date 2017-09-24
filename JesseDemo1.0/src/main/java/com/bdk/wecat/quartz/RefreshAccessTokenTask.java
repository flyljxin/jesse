package com.bdk.wecat.quartz;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;





import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.bdk.wecat.json.AccessTicket;
import com.bdk.wecat.json.AccessToken;
import com.bdk.wecat.json.ErrorEntity;
import com.bdk.wecat.model.WeixinContext;
import com.bdk.wecat.model.WeixinFianlValue;


public class RefreshAccessTokenTask {
	public static final String at="Mrezi48s6ih1_bIoJ56C-9681m00pJtGnYvve50zU9mriOWkaSYYksoilsY6D6-_chGdLs7lGgA40p7lR-d_cA9XFckLYYr4CB4_q-15HbpcP_7hyRYhkq5FnqcEl0kBGDHhAAATQU";
	final Logger logger = LoggerFactory.getLogger(getClass());
   //刷新token
	public void refreshToken() {
		HttpGet get=null;
		CloseableHttpResponse resp=null;
		CloseableHttpClient client=null;
		try {
			 client=HttpClients.createDefault();
			String url=WeixinFianlValue.ACCESS_TOKEN_URL;
			url=url.replaceAll("APPID", WeixinFianlValue.APPID);
			url=url.replaceAll("APPSECRET", WeixinFianlValue.APPSECRET);
			 logger.info(url);
			 get=new HttpGet(url);
			 resp=client.execute(get);
			int statusCode=resp.getStatusLine().getStatusCode();//得到状态代码200 
			if(statusCode>=200&&statusCode<300){
				 HttpEntity entity=resp.getEntity();//得到请求的信息网页的内容
				 String content= EntityUtils.toString(entity);
				 //成功返回{"access_token":"PXInNlqesOv55vKLRUX_6LlLTruR1tK_cTuaQA7y-qN7grMF3gZC9PTx4t-HuNF7JwYH5OV8ZQErtwlKecz75pn9GYL1U3oJLJIXu_YVXgbN71dCVsiNVW23BBhiAsWIHXMdAIAMCR","expires_in":7200}
				try {
					 AccessToken at=JSON.parseObject(content, AccessToken.class);
					 WeixinContext.setAccessToken(at.getAccess_token());
					 
					 getTicketObj(at);//通过AccessToken 获取jsapi_ticket 调用凭证
					  logger.info("token凭据"+at.getAccess_token());
					 //每隔6000秒再请求一次
					 logger.info("token时效"+at.getExpires_in());
					 logger.info(content);
				} catch (Exception e) {
					ErrorEntity err=JSON.parseObject(content, ErrorEntity.class);
					logger.info("获取token异常:"+err.getErrcode()+","+err.getErrmsg());
					refreshToken();
				}
			}
			 logger.info("请求token接口的任务状态"+String.valueOf(statusCode) );
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
				   try {
					if(resp!=null) resp.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				try {
					if(client!=null) client.close();
				} catch (IOException e) {
					e.printStackTrace();
				} 
		}
    }
	
	//获取票据信息
	public void getTicketObj(AccessToken accessToken){
		HttpGet get=null;
		CloseableHttpResponse resp=null;
		CloseableHttpClient client=null;
		try {
			 client=HttpClients.createDefault();
			 String url=WeixinFianlValue.ACCESS_TICKET_URL;
			 url=url.replaceAll("ACCESS_TOKEN", accessToken.getAccess_token());
			
			 logger.info(url);
			 get=new HttpGet(url);
			 resp=client.execute(get);
			int statusCode=resp.getStatusLine().getStatusCode();//得到状态代码200 
			if(statusCode>=200&&statusCode<300){
				 HttpEntity entity=resp.getEntity();//得到请求的信息网页的内容
				 String content= EntityUtils.toString(entity);
				 //成功返回{"access_token":"PXInNlqesOv55vKLRUX_6LlLTruR1tK_cTuaQA7y-qN7grMF3gZC9PTx4t-HuNF7JwYH5OV8ZQErtwlKecz75pn9GYL1U3oJLJIXu_YVXgbN71dCVsiNVW23BBhiAsWIHXMdAIAMCR","expires_in":7200}
				try {
					AccessTicket ac=JSON.parseObject(content, AccessTicket.class);
					 WeixinContext.setAccessTicket(ac.getTicket());
					  logger.info("jsapi_ticket调用凭证"+ac.getTicket());
					 //每隔6000秒再请求一次
					 logger.info("jsapi_ticket调用凭证时效"+ac.getExpires_in());
					 logger.info("AccessTicket对象字符串"+content);
				} catch (Exception e) {
					ErrorEntity err=JSON.parseObject(content, ErrorEntity.class);
					logger.info("jsapi_ticket调用凭证异常:"+err.getErrcode()+","+err.getErrmsg());
					refreshToken();
				}
			}
			 logger.info("请求jsapi_ticket接口的任务状态"+String.valueOf(statusCode) );
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
				   try {
					if(resp!=null) resp.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				try {
					if(client!=null) client.close();
				} catch (IOException e) {
					e.printStackTrace();
				} 
		}
	}
	
	public void TestTimer(int second) {
		Timer timer = new Timer();
		//每隔4秒执行一次
		timer.schedule(new MyTimeTask(), 0, second*1000);
		
	}
	
	private class MyTimeTask extends TimerTask {
		@Override
		public void run() {
			System.out.println("timetask is run!");
			refreshToken();
		}
	}
}
