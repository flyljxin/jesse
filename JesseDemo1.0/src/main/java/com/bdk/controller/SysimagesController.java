package com.bdk.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bdk.conmon.ResultCode;
import com.bdk.conmon.ResultEntity;
import com.bdk.conmon.SystemCons;
import com.bdk.mapper.Sysimages;
import com.bdk.service.ISysimagesService;
import com.bdk.utill.FileUtil;
import com.bdk.utill.JSONUtils;
import com.bdk.utill.StringHelper;

/**
 * 图标管理控制层
 * ClassName: SysimagesController 
 * @Description: 
 * @author yuechongwu
 * @date 2017年5月10日上午11:31:36
 */
@Controller
@RequestMapping("/sysimgs")
public class SysimagesController {
	
	final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ISysimagesService sysimagesService;
	
	/**
	 * 图标管理首页
	 */
	@RequestMapping("/allSysimages.do")
	public String getAllSysimages(HttpServletRequest request, Model model) {
		if (SystemCons.checkLoging(request)) {
			Sysimages sysimages = sysimagesService.findAll();
			request.setAttribute("sysimages", sysimages);
			logger.info("执行查询图标信息操作");
			return "/admin/sysimgs/allSysimages";
		}
		return "redirect:/user/loginParent.do";
	}
	
	/**
	 * 跳转到编辑图标页面
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/getEditSysimages.do")
	public String getSysimages(Integer id, HttpServletRequest request, Model model) {
		if(SystemCons.checkLoging(request))
		{
			Sysimages sysimages = sysimagesService.findAll();
			request.setAttribute("sysimages", sysimages);
			logger.info("执行查询图标信息操作");
			return "/admin/sysimgs/editSysimages";
		}	
		return "redirect:/user/loginParent.do";
	}
	
	  /*** 
	   * 上传文件，并将文件名称存入数据库。
	   * 	用@RequestParam注解来指定表单上的file为MultipartFile 
	   * @param file 
	   * @return 
	   */
	  @RequestMapping(value = "/editSysimages.do", produces = "text/json;charset=UTF-8") 
	  @ResponseBody
	  public String filesUpload( HttpServletRequest request, MultipartFile[] files) { 
		ResultEntity<Sysimages> result = new ResultEntity<Sysimages>();
		FileUtil fu = new FileUtil();
		Sysimages sysimages = new Sysimages();
		sysimages.setId(Integer.parseInt(request.getParameter("id")));
		
		//校验用户是否已登录
		if(SystemCons.checkLoging(request)){
			try{
				if(StringHelper.isEmpty(request.getParameter("id")) || Integer.parseInt(request.getParameter("id")) < 1 ){
					result.setCode(ResultCode.PARAMERR.getValue());
					result.setErrorMsg(ResultCode.PARAMERR.getName());
					return JSONUtils.toJSONString(result);
				}
			    //判断file数组不能为空并且长度大于0 
			    if(files!=null&&files.length>0){ 
			      //循环获取file数组中得文件 
			      for(int i = 0;i<files.length;i++){
			    	  if(files[0].getSize()==0&&files[1].getSize()==0&&files[2].getSize()==0&&files[3].getSize()==0&&files[4].getSize()==0){
			    		    result.setCode(ResultCode.NOISEMPTY.getValue());
							result.setErrorMsg(ResultCode.NOISEMPTY.getName());  
			    		    return JSONUtils.toJSONString(result);
				    	}
			        MultipartFile file = files[i]; 
			        if(StringHelper.isEmpty(sysimages.getFmtp_info()) && files[0].getSize()>0){
			    		sysimages.setFmtp_info(fu.saveFile(request, files[0]));
			    	}
			        
			        if(StringHelper.isEmpty(sysimages.getSys_logo()) && files[1].getSize()>0){
			    		sysimages.setSys_logo(fu.saveFile(request, files[1]));
			    	}
			        
			    	if(StringHelper.isEmpty(sysimages.getSydb_logo()) && files[2].getSize()>0){
			    		 sysimages.setSydb_logo(fu.saveFile(request, files[2]));
			    	}
			    	
			    	if(StringHelper.isEmpty(sysimages.getTc_twocode()) && files[3].getSize()>0){
			    		 sysimages.setTc_twocode(fu.saveFile(request, files[3]));
			    	}
			    	
			    	if(StringHelper.isEmpty(sysimages.getQywh_info()) && files[4].getSize()>0){
			    		 sysimages.setQywh_info(fu.saveFile(request, files[4]));
			    	}
			      } 
			      
			      //保存图标信息到数据库
			      sysimagesService.update(sysimages);
			      //重新加载系统图标信息
			      Sysimages sysimgs = sysimagesService.findAll();
				  SystemCons.setSysimgs(sysimgs);
			    }
			      logger.info("编辑上传图标信息成功");
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
			logger.info("上传图标信息  -- 用户未登录");
			return JSONUtils.toJSONString(result);
		}
	  } 
	  
	  /*2、修改上传文件，并将文件名称存入数据库。*/
	  @RequestMapping(value = "/saveSysimages.do", produces = "text/json;charset=UTF-8") 
	  @ResponseBody
	  public String saveSysimages( HttpServletRequest request, Sysimages sysimages ) { 
		   ResultEntity<Sysimages> result = new ResultEntity<Sysimages>();
		   
			//校验用户是否已登录
			if(SystemCons.checkLoging(request)){
				try{
				      //保存图标信息到数据库
				      sysimagesService.update(sysimages);
				      //重新加载系统图标信息
				      Sysimages sysimgs = sysimagesService.findAll();
					  SystemCons.setSysimgs(sysimgs);
				      logger.info("编辑上传图标信息成功");
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
				logger.info("上传图标信息  -- 用户未登录");
				return JSONUtils.toJSONString(result);
			}
		   
	  }
	  
	  
}

