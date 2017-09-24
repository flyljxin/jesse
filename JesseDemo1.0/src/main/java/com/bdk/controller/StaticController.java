package com.bdk.controller;

import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;

import com.bdk.conmon.SystemCons;
import com.bdk.mapper.Sysimages;
import com.bdk.mapper.Sysparams;
import com.bdk.service.ISysimagesService;
import com.bdk.service.ISysparamsService;

/**
 * 项目启动，加载系统配置资源
 * ClassName: StaticController 
 * @Description: 
 * @author ChenQuan
 * @date 2017年5月11日下午2:32:35
 */
@Controller
public class StaticController extends HttpServlet implements ApplicationContextAware{
	
	/**
	 */
	private static final long serialVersionUID = 4154078774521331841L;
	
	final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ISysparamsService SysparamsService;
	@Autowired
	private ISysimagesService sysimagesService;
	

	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		Sysparams params = SysparamsService.findAll();
		SystemCons.setSysparams(params);
		Sysimages sysimgs = sysimagesService.findAll();
		SystemCons.setSysimgs(sysimgs);
		logger.info("系统配置资源加载完成");
	}

}
