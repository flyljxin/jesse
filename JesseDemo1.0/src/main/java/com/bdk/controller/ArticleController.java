package com.bdk.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.bdk.conmon.ResultCode;
import com.bdk.conmon.ResultEntity;
import com.bdk.conmon.SystemCons;
import com.bdk.mapper.Article;
import com.bdk.mapper.Artype;
import com.bdk.mapper.Periodcal;
import com.bdk.service.IArticleService;
import com.bdk.service.IArtypeService;
import com.bdk.service.IPeriodcalService;
import com.bdk.utill.FileUtil;
import com.bdk.utill.Imginfo;
import com.bdk.utill.Imgjson;
import com.bdk.utill.JSONUtils;
import com.bdk.utill.StringHelper;

/**
 * 期刊文章管理控制器 ClassName: ArticleController
 * 
 * @Description:
 * @author ChenQuan
 * @date 2017年5月11日下午2:20:29
 */

@Controller
@RequestMapping("/article")
public class ArticleController extends CommController{

	final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private IArticleService articleService;
	@Autowired
	private IPeriodcalService periodcalService;
	@Autowired
	private IArtypeService artypeService;
	
	private SystemCons systemCons;
	
public SystemCons getSystemCons() {
		return systemCons;
	}

	public void setSystemCons(SystemCons systemCons) {
		this.systemCons = systemCons;
	}

	/*	private int currPage = 1; // 默认当前页为第一页

	private int pageNums = 5; // 默认每页条数为5条
*/
	/** 
	 * 测试图片返回
	 */
	@RequestMapping(value = "/uploadImg.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String testimg(HttpServletRequest request, MultipartFile file) {
		try {
			FileUtil fUtil = new FileUtil();
			String fileName = fUtil.saveFile(request, file);
			String filePath = request.getContextPath()+ "/upload/" + fileName;
			Imgjson t = new Imgjson();
			t.setCode(0);// 0表示成功，其它失败
			t.setMsg("上传成功");// 提示信息 //一般上传失败后返回
			Imginfo c = new Imginfo();
			c.setSrc(filePath);// 图片路径
			c.setTitle(fileName);// 可选
			t.setData(c);
//			JSONObject ss = JSON.toJSONString(t);//.tUtils.toJSONObject(t);
			logger.info("期刊内容图片上传成功!");
//			return ss.toString();
			return JSON.toJSONString(t);
		} catch (Exception e) {
			Imgjson t = new Imgjson();
			t.setCode(-1);// 0表示成功，其它失败
			t.setMsg("上传失败");// 提示信息 //一般上传失败后返回
			//t.setData(c);
//			JSONObject ss = JSONUtils.toJSONObject(t);
			logger.info("期刊内容图片上传失败!");
//			return ss.toString();
			return JSON.toJSONString(t);
		}
		
	}

	/**
	 * 获取所有文章列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/artices.do")
	public String getAllArtices(HttpServletRequest request, Article article, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");  
		if (SystemCons.checkLoging(request)) {
			//List<Periodcal> periodList = periodcalService.findAll();
			initparsmsInfo();
			List<Periodcal> periodList = periodcalService.findList(); //期刊目录列表,取最新的最五条数据
			List<Artype> pertypes = artypeService.getAllType();
			List<Article> artices = articleService.queryArticleList(article, article.getCurrPage(), article.getPageNums());
			
			model.addAttribute("artices", artices);
			model.addAttribute("total", articleService.queryTotal(article));
			model.addAttribute("currPage", article.getCurrPage());
			model.addAttribute("pageNums", article.getPageNums());
			model.addAttribute("periodList", periodList);//期刊目录列表
			model.addAttribute("pertypes", pertypes);
			model.addAttribute("article", article);
			/*return "/admin/periodical/articleList";*/
			
			logger.info("执行查询文章列表操作");
			return "/admin/article/articleIndex";
		}
		return "forward:/user/loginParent.do";
	}

	/**
	 * 跳转到添加文章界面
	 * 
	 * @Description:
	 * @param request
	 * @param model
	 * @return
	 * @author ChenQuan
	 * @date 2017年5月11日下午2:21:40
	 * @version:1.0.0
	 */
	@RequestMapping("/toaddartice.do")
	public String toAddartice(HttpServletRequest request, Model model) {
		if(SystemCons.checkLoging(request))
		{
			return "/admin/article/articleAdd";
		}
		return "redirect:/user/loginParent.do";

	}

	/**
	 * 添加文章内容
	 * 
	 * @Description:
	 * @param request
	 * @param article
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月17日上午11:37:25
	 * @version:1.0.0
	 */
	@RequestMapping(value = "/addArticle.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String addArticle(HttpServletRequest request, Article article) {
		ResultEntity<Article> result = new ResultEntity<Article>();

		// 校验用户是否已登录
		if (SystemCons.checkLoging(request)) {
			try {
				if (article == null || StringHelper.isEmpty(article.getQkid())) {
					result.setCode(ResultCode.PARAMERR.getValue());
					result.setErrorMsg(ResultCode.PARAMERR.getName());
					return JSONUtils.toJSONString(result);
				}
				article.setWritetime(new Date());
				articleService.insertArticle(article);
				logger.info("新增文章信息成功");
				return JSONUtils.toJSONString(result);
			} catch (Exception e) {
				result.setCode(ResultCode.ERRO.getValue());
				result.setErrorMsg(ResultCode.ERRO.getName());
				logger.info("异常信息："+e.getMessage());
				return JSONUtils.toJSONString(result);
			}
		} else {
			result.setCode(ResultCode.NOTLOGIN.getValue());
			result.setErrorMsg(ResultCode.NOTLOGIN.getName());
			logger.info("新增文章信息  -- 用户未登录");
			return JSONUtils.toJSONString(result);
		}
	}
	
	/**
	 * 编辑期刊内容
	 */
	@RequestMapping(value = "/editArticle.do")
	public String editArticle(HttpServletRequest request,Model model) {
		if (SystemCons.checkLoging(request)) {
			initparsmsInfo();
			Article article = articleService.findId(Integer.parseInt(request.getParameter("id")));
			List<Periodcal> periodList = periodcalService.findAll();
			//Periodcal periodcal = periodcalService.findById(Integer.parseInt(article.getQkid()));
			List<Artype> artypeList=artypeService.getAllType();
			model.addAttribute("article", article);
			//model.addAttribute("periodcal", periodcal);
			model.addAttribute("periodList", periodList);
			model.addAttribute("artypeList", artypeList);
			return "/admin/article/articleEdit";
		}
		return "redirect:/user/loginParent.do";
	}
	
	/**
	 * 更新期刊内容信息
	 * @Description:
	 * @param request
	 * @param article
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月18日下午3:45:46
	 * @version:1.0.0
	 */
	@RequestMapping(value = "/updateArticle.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String updateArticle(HttpServletRequest request, Article article) {
		ResultEntity<Article> result = new ResultEntity<Article>();

		// 校验用户是否已登录
		if (SystemCons.checkLoging(request)) {
			try {
				if (article == null || article.getId()<1) {
					result.setCode(ResultCode.PARAMERR.getValue());
					result.setErrorMsg(ResultCode.PARAMERR.getName());
					return JSONUtils.toJSONString(result);
				}
				article.setWritetime(new Date());//更新录入时间
				articleService.updateArticle(article);
				logger.info("修改文章信息成功");
				return JSONUtils.toJSONString(result);
			} catch (Exception e) {
				result.setCode(ResultCode.ERRO.getValue());
				result.setErrorMsg(ResultCode.ERRO.getName());
				logger.info("异常信息："+e.getMessage());
				return JSONUtils.toJSONString(result);
			}
		} else {
			result.setCode(ResultCode.NOTLOGIN.getValue());
			result.setErrorMsg(ResultCode.NOTLOGIN.getName());
			logger.info("修改文章信息  -- 用户未登录");
			return JSONUtils.toJSONString(result);
		}
	}
	

	/**
	 * 删除文章
	 * 
	 * @Description:
	 * @param request
	 * @param article
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月17日上午11:38:09
	 * @version:1.0.0
	 */
	@RequestMapping(value = "/delArticle.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String delArticle(HttpServletRequest request) {
		ResultEntity<Article> result = new ResultEntity<Article>();
	String idstr=request.getParameter("id");
		// 校验用户是否已登录
		if (SystemCons.checkLoging(request)) {
			try {
				if (StringHelper.isEmpty(request.getParameter("id"))) {
					result.setCode(ResultCode.PARAMERR.getValue());
					result.setErrorMsg(ResultCode.PARAMERR.getName());
					return JSONUtils.toJSONString(result);
				}
				
				//批量刪除
				if(request.getParameter("id").indexOf(",") != -1){
					String[] ids = request.getParameter("id").split(",");
					for(String id : ids){
						articleService.delById(Integer.parseInt(id));
					}
					logger.info("批量删除文章成功");
				}
				//单个删除
				else{
					articleService.delById(Integer.parseInt(request.getParameter("id")));
					logger.info("删除单篇文章成功");
				}
				return JSONUtils.toJSONString(result);
			} catch (Exception e) {
				result.setCode(ResultCode.ERRO.getValue());
				result.setErrorMsg(ResultCode.ERRO.getName());
				logger.info("异常信息："+e.getMessage());
				return JSONUtils.toJSONString(result);
			}
		} else {
			result.setCode(ResultCode.NOTLOGIN.getValue());
			result.setErrorMsg(ResultCode.NOTLOGIN.getName());
			logger.info("删除文章  -- 用户未登录");
			return JSONUtils.toJSONString(result);
		}
	}

}
