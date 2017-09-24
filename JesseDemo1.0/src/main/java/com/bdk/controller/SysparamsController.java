package com.bdk.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdk.conmon.ResultCode;
import com.bdk.conmon.ResultEntity;
import com.bdk.conmon.SystemCons;
import com.bdk.mapper.Sysparams;
import com.bdk.service.ISysparamsService;
import com.bdk.utill.JSONUtils;

/**
 * 参数管理控制层
 * ClassName: SysparamsController 
 * @Description: 
 * @author yuechongwu
 * @date 2017年5月9日上午9:36:27
 */
@Controller
@RequestMapping("/sysparams")
public class SysparamsController {
	
	final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ISysparamsService sysparamsService;
	
	
	/**
	 * 编辑参数json数据
	 */
	@RequestMapping("/editSysparamsjson.do")
	@ResponseBody
	public String editSysparamsjson(Sysparams sysparams, HttpServletRequest request, Model model) {
		 ResultEntity<Sysparams> result = new ResultEntity<Sysparams>();
			  if(SystemCons.checkLoging(request)){//校验用户是否已登录
				  try{
					  sysparamsService.update(sysparams);
					  logger.info("修改参数信息成功");
					  return JSONUtils.toJSONString(result);
				  }catch(Exception e){
						result.setCode(ResultCode.ERRO.getValue());
						result.setErrorMsg(ResultCode.ERRO.getName());
						logger.info("异常信息："+e.getMessage());
						return JSONUtils.toJSONString(result);
				  }
			  }else{
					result.setCode(ResultCode.NOTLOGIN.getValue());
					result.setErrorMsg(ResultCode.NOTLOGIN.getName());
					logger.info("修改用户信息  -- 用户未登录");
					return JSONUtils.toJSONString(result);
			  }
	}
	
	/**
	 * 编辑参数
	 */
	@RequestMapping("/editSysparams.do")
	public String editSysparams(Sysparams sysparams, HttpServletRequest request, Model model) {
		if (sysparamsService.update(sysparams)>0) {
			sysparams = sysparamsService.findById(sysparams.getId());
			request.setAttribute("sysparams", sysparams);
			model.addAttribute("sysparams", sysparams);
			//更新静态参数对象
			SystemCons.setSysparams(sysparams);
			logger.info("编辑参数信息成功");
			return "redirect:/sysparams/allSysparams.do";
		} else {
			logger.info("编辑参数信息失败");
			return "/error";
		}
	}
	
	/**
	 * 参数列表页面、新增页面
	 */
	@RequestMapping("/allSysparams.do")
	public String getAllSysparams(HttpServletRequest request, Model model) {
		Sysparams sysparams = sysparamsService.findAll();
		request.setAttribute("sysparams", sysparams);
		logger.info("执行查询参数信息操作");
		return "/admin/sysparams/allSysparams";
	}
	
	/**
	 * 跳转到编辑参数页面
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/getEditSysparams.do")
	public String getUser(Integer id, HttpServletRequest request, Model model) {
		if(SystemCons.checkLoging(request))
		{
			request.setAttribute("sysparams", sysparamsService.findById(id));
			model.addAttribute("sysparams", sysparamsService.findById(id));
			return "/admin/sysparams/editSysparams";
		}
		return "redirect:/user/loginParent.do";
	}
	
}
