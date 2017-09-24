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
import org.springframework.web.servlet.ModelAndView;

import com.bdk.conmon.ResultCode;
import com.bdk.conmon.ResultEntity;
import com.bdk.conmon.SystemCons;
import com.bdk.mapper.Periodcal;
import com.bdk.service.IPeriodcalService;
import com.bdk.utill.JSONUtils;
import com.bdk.utill.StringHelper;

/**
 * 期刊管理后台
 * ClassName: PeriodAdminController 
 * @Description: 
 * @author ChenQuan
 * @date 2017年5月11日下午1:36:21
 */
@Controller
@RequestMapping("/peradmin")
public class PeriodAdminController {
	
	final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private IPeriodcalService periodcalService;
	
	/**
	 * 期刊添加页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/articleAddPage.do")
	public String articleAddPage(HttpServletRequest request, Model model) {
		if(SystemCons.checkLoging(request))
		{
			//List<Periodcal> periodList = periodcalService.findAll();
			//model.addAttribute("periods", 123);
			return "/admin/periodical/articleAddPage";
		}
		return "redirect:/user/loginParent.do";
	}
	
	/**
	 * 期刊主页
	 * @param request
	 * @return
	 */
	@RequestMapping("/periods.do")
	public String getAllperiod(HttpServletRequest request, Model model) {
		if(SystemCons.checkLoging(request))
		{
			return "/admin/periodical/periodical";
		}
		return "redirect:/user/loginParent.do";
	}

	/**
	 * 分页查询期刊列表
	 * @Description:
	 * @param request
	 * @param model
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月15日下午6:00:12
	 * @version:1.0.0
	 */
	@RequestMapping("/periodsList.do")
	public String periodsList(HttpServletRequest request, Model model) {
		int currPage = Integer.parseInt(request.getParameter("currPage"));
		int pageNums = Integer.parseInt(request.getParameter("pageNums"));
		String queryString = request.getParameter("queryString");
		String number = request.getParameter("number");
		if(SystemCons.checkLoging(request))
		{
			List<Periodcal> periodList = periodcalService.queryPeriodcalList(queryString, number,currPage, pageNums);
			
			model.addAttribute("periods", periodList);
			model.addAttribute("total", periodcalService.queryTotal(queryString, number));
			model.addAttribute("currPage", currPage);
			logger.info("查询期刊列表");
			/*return "/admin/periodical/periodicalList";*/
			return "/admin/periodical/periodicalList";
		}
		return "redirect:/user/loginParent.do";
	}
	
	
	/**
	 * 跳转到新增期刊页面
	 * @Description:
	 * @param request
	 * @param model
	 * @return
	 * @author ChenQuan
	 * @date 2017年5月11日下午1:39:19
	 * @version:1.0.0
	 */
	@RequestMapping("/toAddPeriod.do")
	public String toAddPeriod(HttpServletRequest request, Model model){
		if(SystemCons.checkLoging(request)){
			return "/admin/periodical/toAddPeriod";
		}
		return "redirect:/user/loginParent.do";
	}

	/**
	 * 跳转到新增期刊页面
	 * @Description:
	 * @param request
	 * @param model
	 * @return
	 * @author ChenQuan
	 * @date 2017年5月11日下午1:39:19
	 * @version:1.0.0
	 */
	@RequestMapping(value = "/addPeriod.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String addPeriod(HttpServletRequest request, Periodcal periodcal){
		ResultEntity<Periodcal> result = new ResultEntity<Periodcal>();
		
		if(SystemCons.checkLoging(request)){
	    	if(periodcal == null || periodcal.getIsnew() == null || StringHelper.isEmpty(periodcal.getQkname())){
				result.setCode(ResultCode.PARAMERR.getValue());
				result.setErrorMsg(ResultCode.PARAMERR.getName());
				return JSONUtils.toJSONString(result);
	    	}
	    	
	    	if(periodcal.getQknum() < 1){
				result.setCode(ResultCode.NOTZERO.getValue());
				result.setErrorMsg(ResultCode.NOTZERO.getName());
				return JSONUtils.toJSONString(result);
	    	} 
			
			try{
				if(periodcal.getId()>0){
					//修改
					Periodcal periodcalisHis = periodcalService.findByQknum(periodcal.getQknum()+"");
					Periodcal temp = periodcalService.findById(periodcal.getId());
			    	if(null != periodcalisHis && periodcal.getQknum() != temp.getQknum())
			    	{
			    		result.setCode(ResultCode.THEQIKANISCUNZAI.getValue());
						result.setErrorMsg(ResultCode.THEQIKANISCUNZAI.getName());
						return JSONUtils.toJSONString(result);
			    	}
					periodcalService.updatePeriodcal(periodcal);
					logger.info("修改期刊成功");
				}else{
					//新增
					Periodcal periodcalisHis = periodcalService.findByQknum(periodcal.getQknum()+"");
			    	if(null != periodcalisHis)
			    	{
			    		result.setCode(ResultCode.THEQIKANISCUNZAI.getValue());
						result.setErrorMsg(ResultCode.THEQIKANISCUNZAI.getName());
						return JSONUtils.toJSONString(result);
			    	}
					periodcalService.insertPeriodcal(periodcal);
					logger.info("新增期刊成功");
				}
				
				result.setCode(ResultCode.OK.getValue());
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
			logger.info("新增或修改期刊  -- 用户未登录");
			return JSONUtils.toJSONString(result);
		}
	}
	
	/**
	 * 期刊发布
	 * @Description:
	 * @param request
	 * @param periodcal
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月19日下午3:44:34
	 * @version:1.0.0
	 */
	@RequestMapping(value = "/releasePeriod.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String releasePeriod(HttpServletRequest request){
		ResultEntity<Periodcal> result = new ResultEntity<Periodcal>();
		
		if(SystemCons.checkLoging(request)){
	    	if(StringHelper.isEmpty(request.getParameter("id"))){
				result.setCode(ResultCode.PARAMERR.getValue());
				result.setErrorMsg(ResultCode.PARAMERR.getName());
				return JSONUtils.toJSONString(result);
	    	}
			
			try{
				periodcalService.releasePeriodcal(Integer.parseInt(request.getParameter("id")));
				logger.info("发布期刊成功");
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
			logger.info("发布期刊 -- 用户未登录");
			return JSONUtils.toJSONString(result);
		}
	}
	
	/**
	 * 取消发布
	 * @Description: 
	 * @param request
	 * @return
	 * @author 岳崇武
	 * @date 2017年5月31日上午10:07:46
	 * @version:1.0.0
	 */
	@RequestMapping(value = "/cancelReleasePeriod.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cancelReleasePeriod(HttpServletRequest request){
		ResultEntity<Periodcal> result = new ResultEntity<Periodcal>();
		if(SystemCons.checkLoging(request)){
	    	if(StringHelper.isEmpty(request.getParameter("id"))){
				result.setCode(ResultCode.PARAMERR.getValue());
				result.setErrorMsg(ResultCode.PARAMERR.getName());
				return JSONUtils.toJSONString(result);
	    	}
			try{
				periodcalService.cancelReleasePeriodcal(Integer.parseInt(request.getParameter("id")));
				logger.info("取消发布期刊成功");
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
			logger.info("取消发布期刊 -- 用户未登录");
			return JSONUtils.toJSONString(result);
		}
	}
}
