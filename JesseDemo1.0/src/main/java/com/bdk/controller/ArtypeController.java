package com.bdk.controller;

import java.util.List;

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
import com.bdk.mapper.Artype;
import com.bdk.service.IArtypeService;
import com.bdk.utill.JSONUtils;
import com.bdk.utill.StringHelper;

@Controller
@RequestMapping("/artype")
public class ArtypeController {

	final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private IArtypeService artypeService;
	
	/**
	 * 展示所有类型
	 */
	@RequestMapping("/alltype.do")
	public String getAlltype(HttpServletRequest request, Model model) {
		if(SystemCons.checkLoging(request)){
			List<Artype> artype = artypeService.getAllType();
			request.setAttribute("artype", artype);
			logger.info("获取版本类型列表");
			return "/admin/artype/alltype";
		}
		return "redirect:/user/loginParent.do";
	}
	
	/**
	 * @Description:  修改版本类型
	 * @param request
	 * @param model
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月11日下午4:30:34
	 * @version:1.0.0
	 */
	@RequestMapping(value="/update.do",produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String update(HttpServletRequest request, Artype artype) {
		ResultEntity<Artype> result = new ResultEntity<Artype>();
		//校验用户是否已登录
		if(SystemCons.checkLoging(request)){
			if(artype.getCode() < 1 || StringHelper.isEmpty(artype.getType())){
				result.setCode(ResultCode.PARAMERR.getValue());
				result.setErrorMsg(ResultCode.PARAMERR.getName());
				return JSONUtils.toJSONString(result);
			}
			
			try{
				artypeService.updateType(artype);
				logger.info("修改版本类型成功");
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
			logger.info("修改版本类型 -- 用户未登录");
			return JSONUtils.toJSONString(result);
		}
		
	}
}
