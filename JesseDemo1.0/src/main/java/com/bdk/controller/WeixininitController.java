package com.bdk.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONWriter;
import com.bdk.wecat.kit.SecurtiyKit;
import com.bdk.wecat.kit.Sign;
import com.bdk.wecat.model.WeixinContext;
import com.bdk.wecat.model.WeixinFianlValue;
import com.bdk.wecat.quartz.RefreshAccessTokenTask;

/**
 * 
 * 
 * @Description:
 * @author ChenQuan
 * @date 2017年5月11日下午2:20:29
 * 微信初始化的接入
 */

@Controller
@RequestMapping("/wxchat")
public class WeixininitController extends CommController{
	final Logger logger = LoggerFactory.getLogger(getClass());
public static  final String TOKEN="luojianxin";
 
    //微信验证配置是否成功
	@RequestMapping("/init.do")
	public void init(HttpServletRequest req,HttpServletResponse resp) throws Exception {
//		signature	微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数。
//		timestamp	时间戳
//		nonce	随机数
//		echostr 随机字符串
		String signature = req.getParameter("signature");
		String timestamp = req.getParameter("timestamp");
		String nonce = req.getParameter("nonce");
		String echostr = req.getParameter("echostr");
		logger.info("######signature"+signature);
		logger.info("######timestamp"+timestamp);
		logger.info("######nonce"+nonce);
		logger.info("######echostr"+echostr);
		String[] arrs={WeixininitController.TOKEN,nonce,timestamp};
		Arrays.sort(arrs);
		StringBuffer sb=new StringBuffer();
		for(String a:arrs){
			sb.append(a);
		}
		String sha1=SecurtiyKit.sha1(sb.toString());
		
		if(sha1.equals(signature)){
			
			resp.getWriter().println(echostr);
			logger.info("######echostr"+echostr);
		}
		
		
	}
	
	

	
	/**
	 * 测试取taken值
	 * @throws Exception 
	 * 
	 */
	@RequestMapping("/at.do")
	public void name(HttpServletResponse resp) throws Exception {
		RefreshAccessTokenTask f=new RefreshAccessTokenTask();
		f.TestTimer(6000);
		resp.getWriter().println(WeixinContext.getAccessToken());
	}

	//获取配置信息
	@RequestMapping("/getConfig.do")
	public void getConfig(HttpServletRequest req,HttpServletResponse resp){
		 Map<String, String> ret = new HashMap<String, String>();  
		 String url= req.getParameter("urlstr");
		 logger.info("#######获取的当前url为:"+url);
		 ret= Sign.sign(WeixinContext.getAccessTicket(), url);
		 ret.put("appId", WeixinFianlValue.APPID);
		 writeJson(ret, resp);
	}
	
}
