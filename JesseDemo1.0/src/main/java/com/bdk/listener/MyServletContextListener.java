package com.bdk.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bdk.wecat.quartz.RefreshAccessTokenTask;

public class MyServletContextListener implements ServletContextListener 
{
	final Logger logger = LoggerFactory.getLogger(getClass());
 public void contextDestroyed(ServletContextEvent arg0) 
 {

 }

 public void contextInitialized(ServletContextEvent arg0) 
 {
     System.out.println("项目启动加载token值");
     //重新获取token值再放开
//     RefreshAccessTokenTask r=new   RefreshAccessTokenTask();
//     r.TestTimer(6000);
     logger.info("初始化");
 }
 
 
}
