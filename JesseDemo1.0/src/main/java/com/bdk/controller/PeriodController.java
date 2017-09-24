package com.bdk.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.bdk.conmon.ResultCode;
import com.bdk.conmon.ResultEntity;
import com.bdk.conmon.SystemCons;
import com.bdk.mapper.Article;
import com.bdk.mapper.Artype;
import com.bdk.mapper.Periodcal;
import com.bdk.mapper.Sysimages;
import com.bdk.mapper.Sysparams;
import com.bdk.service.IArticleService;
import com.bdk.service.IArtypeService;
import com.bdk.service.IPeriodcalService;
import com.bdk.service.ISysimagesService;
import com.bdk.service.ISysparamsService;
import com.bdk.utill.JSONUtils;
import com.bdk.utill.StringHelper;


/**
 * 前台H5
 * 期刊相关管理
 * ClassName: PeriodController 
 * @Description: 
 * @author ChenQuan
 * @date 2017年5月9日上午9:58:21
 */
@Controller
@RequestMapping("/period")
public class PeriodController extends  CommController{
	
	final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private IArticleService articleService;
	
	@Autowired
	private IPeriodcalService periodcalService;
	@Autowired
	private ISysimagesService sysimagesService;
	@Autowired
	private ISysparamsService sysparamsService;
	
	@Autowired
	private IArtypeService artypeService;
	
	private int pageNo =1; //当前页
	
	private int pageSize =7; //每页条数
	
	/**
	 *h5页面期刊首页
	 */
	@RequestMapping("/periodical.do")
	public String admin(HttpServletRequest request, Model model) {
	      //重新加载系统图标信息
		initparsmsInfo();
		return "/front/p_index";
	}


	
	/**
	 *期刊主目录数据
	 */

	@RequestMapping(value="/getQkData.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getQkData(HttpServletRequest request) {

		ResultEntity<Map<String,Object>> result = new ResultEntity<Map<String,Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		try{
			if(!StringHelper.isEmpty(request.getParameter("pageNo"))){
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			
			if(!StringHelper.isEmpty(request.getParameter("pageSize"))){
				pageSize = Integer.parseInt(request.getParameter("pageSize"));
			}			
			map.put("list", periodcalService.findMore(pageNo, pageSize));
			map.put("total", periodcalService.findMoreTotal());
			result.setData(map);
			logger.info("前台获取期刊主目录列表");
			return JSONUtils.toJSONString(result);
		}catch(Exception e){
			result.setCode(ResultCode.ERRO.getValue());
			result.setErrorMsg(ResultCode.ERRO.getName());
			logger.info("异常信息："+e.getMessage());
			return JSONUtils.toJSONString(result);
		}

	}
	/**
	 *最新一期 已发布ajaxjson数据
	 */
	@RequestMapping(value="/getSubData.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getSubData(HttpServletRequest request) {
		ResultEntity<Map<String, Object>> result = new ResultEntity<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		Article article = new Article();
		
		try{
			if(!StringHelper.isEmpty(request.getParameter("qknum"))){
				article.setQknum(request.getParameter("qknum"));
			}
			
			if(!StringHelper.isEmpty(request.getParameter("type"))){
				article.setType(request.getParameter("type"));
			}
			
			if(!StringHelper.isEmpty(request.getParameter("pageNo"))){
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			
			if(!StringHelper.isEmpty(request.getParameter("pageSize"))){
				pageSize = Integer.parseInt(request.getParameter("pageSize"));
			}
		
			List<Article> list=articleService.queryArticleListH5(article, pageNo, pageSize);
			map.put("period",periodcalService.findByQknum(article.getQknum()));
			map.put("list", list);
		    map.put("total", articleService.queryTotal(article));
			result.setData(map);
			logger.info("前台获取期刊二级目录列表");
			return JSONUtils.toJSONString(result);	
		}catch(Exception e){
			result.setCode(ResultCode.ERRO.getValue());
			result.setErrorMsg(ResultCode.ERRO.getName());
			logger.info("异常信息："+e.getMessage());
			return JSONUtils.toJSONString(result);
		}
	}
	
	/**
	 * 获取版本类型列表
	 * @Description:
	 * @param request
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月23日上午11:14:34
	 * @version:1.0.0
	 */
	@RequestMapping(value="/arTypeList.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getArTypeList(HttpServletRequest request) {
		ResultEntity<List<Artype>> result = new ResultEntity<List<Artype>>();
		try{
			result.setData(artypeService.getAllType());
			logger.info("前台获取版本类型列表");
			return JSONUtils.toJSONString(result);
		}catch(Exception e){
			result.setCode(ResultCode.ERRO.getValue());
			result.setErrorMsg(ResultCode.ERRO.getName());
			logger.info("异常信息："+e.getMessage());
			return JSONUtils.toJSONString(result);
		}
	}
	
	/**
	 * 获取最新一期期刊
	 * @Description:
	 * @param request
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月23日上午11:53:18
	 * @version:1.0.0
	 */
	@RequestMapping(value="/getLatestPeriodcal.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public Object getLatestPeriod(HttpServletRequest request) {
		ResultEntity<Periodcal> result = new ResultEntity<Periodcal>();
		try{
			result.setData(periodcalService.getLatestPeriodcal());
			logger.info("前台获取最新一期期刊信息");
			return JSONUtils.toJSONString(result);
		}catch(Exception e){
			result.setCode(ResultCode.ERRO.getValue());
			result.setErrorMsg(ResultCode.ERRO.getName());
			logger.info("异常信息："+e.getMessage());
			return JSON.toJSON(result);// Utils..toJSONObject(result);
		}
	}
	

	
	/**
	 *最新一期内容页面
	 */
	@RequestMapping("/qkList.do")
	public String qkListtest(HttpServletRequest request, Model model) {
		//最新个一期已发布期刊
		initparsmsInfo();
	    String qknum=	request.getParameter("qknum");
		Periodcal periodcal=periodcalService.findByQknum(qknum);	
		 List<Artype> Artypelist=artypeService.getAllType();
		 model.addAttribute("periodcal", periodcal);
		 model.addAttribute("Artypelist", Artypelist);

		return "/front/p_list";
	}
	
	/**
	 *期刊主目录
	 */
	@RequestMapping("/qkDireList.do")
	public String qkDireListtest(HttpServletRequest request, Model model) {
		
		return "/front/p_direList";
	}
	
	/**
	 *企业文化
	 */
	@RequestMapping("/culture.do")
	public String culture(HttpServletRequest request, Model model) {
		//获取最新已发布一期的id
		initparsmsInfo();
		 Periodcal periodca=periodcalService.getLatestPeriodcal();
		 model.addAttribute("periodca",periodca);
		return "/front/p_culture";
	}

	
	//第二期刊内容部分
	/**
	 * 1、查询期刊内容详情
	 */
	@RequestMapping("/articleInfo.do")
	public String articleInfo(HttpServletRequest request, Model model) {
		Article article = articleService.findId(Integer.parseInt(request.getParameter("id")));
		model.addAttribute("article", article);
		logger.info("前台查询期刊内容详情");
		return "/front/appArticle/articleInfo";
	}
	


}
