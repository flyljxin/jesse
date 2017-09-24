package com.bdk.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.bdk.conmon.SystemCons;
import com.bdk.mapper.Sysimages;
import com.bdk.mapper.Sysparams;
import com.bdk.service.ISysimagesService;
import com.bdk.service.ISysparamsService;

@Controller
public class CommController {
	@Autowired
	private ISysparamsService sysparamsService;
	
	@Autowired
	private ISysimagesService sysimagesService;
	/**
	 * 初始化参数 图片信息
	 */
	public void initparsmsInfo() {
		  Sysimages sysimgs = sysimagesService.findAll();
	      Sysparams sysparams=sysparamsService.findAll();
		  SystemCons.setSysimgs(sysimgs);
		  SystemCons.setSysparams(sysparams);
	}
	
	public void writeJson(Object object,HttpServletResponse response) {
		try {
			String json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss");
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write(json);
					response.getWriter().flush();
					response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
