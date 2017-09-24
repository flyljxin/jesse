package com.bdk.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bdk.utill.SignUtil;



/**
 * 
 * 
 * @Description:
 * @author ChenQuan
 * @date 2017年5月11日下午2:20:29
 */

@Controller
@RequestMapping("/wechat")
public class WeixinController extends CommController{

	final Logger logger = LoggerFactory.getLogger(getClass());
	
	 //private static Logger logger = LoggerFactory.getLogger(getClass());
	
	
	
    /**
     * 
     * @Description: 用于接收 get 参数，返回验证参数
     * @param @param request
     * @param @param response
     * @param @param signature 微信加密签名，signature结合开发者填写的token参数和请求中的timestamp参数、nonce参数
     * @param @param timestamp 时间戳
     * @param @param nonce 随机数
     * @param @param echostr  随机字符串
     * @author dapengniao
     * @date 2016 年 3 月 4 日 下午 6:20:00
     */
    @RequestMapping(value = "security.do", method = RequestMethod.GET)
    public void doGet(
            HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "signature", required = true) String signature,
            @RequestParam(value = "timestamp", required = true) String timestamp,
            @RequestParam(value = "nonce", required = true) String nonce,
            @RequestParam(value = "echostr", required = true) String echostr) {
        try {
        	 logger.info("#####进入security.do");
            if (SignUtil.checkSignature(signature, timestamp, nonce)) {
                PrintWriter out = response.getWriter();
                out.print(echostr);
                out.close();
            } else {
                logger.info("这里存在非法请求！");
            }
        } catch (Exception e) {
            logger.error("异常", e);
            
        }
    }

    @RequestMapping(value = "security.do", method = RequestMethod.POST)
    // post 方法用于接收微信服务端消息
    public void DoPost() {
        System.out.println("这是 post 方法！");
    }


}
