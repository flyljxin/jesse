package com.bdk.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.bdk.mapper.User;
import com.bdk.service.IUserService;
import com.bdk.utill.JSONUtils;
import com.bdk.utill.StringHelper;

/**
 * 用户相关操作
 * ClassName: UserController 
 * @Description: 
 * @author ChenQuan
 * @date 2017年5月4日下午1:55:49
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private IUserService userService;
	
	/**
	 * 退出登录
	 */
	@RequestMapping("/exitLogin.do")
	public String exitLogin(HttpServletRequest request, Model model) {
		HttpSession s=request.getSession();
		s.removeAttribute(SystemCons.ADMIN_SESSION);
		s.setAttribute(SystemCons.ADMIN_SESSION, null);
		return "redirect:/user/login.do";
	}
	
	/**
	 * 跳转到后台登录界面
	 */
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request, Model model) {
		return "/admin/login";
	}
	
	/**
	 * session失效自动跳转到登录页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/loginParent.do")
	public String loginParent(HttpServletRequest request, Model model) {
		
		if(SystemCons.checkLoging(request)){
		    return "/admin/login";
		}
		 return "/admin/loginParent";
	}
	
	/**
	 * 提交后台登录
	 * 登录后台进入后台主页
	 */
	@RequestMapping(value = "/checkLogin.do",produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String checkLogin(HttpServletRequest request, Model model) {
		ResultEntity<User> result = new ResultEntity<User>();
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		if(!StringHelper.isEmpty(name))
		{
			if(StringHelper.isEmpty(password))
			{
				result.setCode(ResultCode.USERNAMEORPASSERRO.getValue());
				result.setErrorMsg(ResultCode.USERNAMEORPASSERRO.getName());
			}
			else
			{
				User user = userService.login(name, StringHelper.encodPayPwd(password));
				if(null == user)
				{
					result.setCode(ResultCode.USERNAMEORPASSERRO.getValue());
					result.setErrorMsg(ResultCode.USERNAMEORPASSERRO.getName());
				}
				else
				{
					HttpSession session = request.getSession();  
				    session.setAttribute(SystemCons.ADMIN_SESSION, user);  
					result.setData(user);
					logger.info("用户登录成功");
				}
			}
			
		}
		else{
			result.setCode(ResultCode.USERNAMEORPASSERRO.getValue());
			result.setErrorMsg(ResultCode.USERNAMEORPASSERRO.getName());
		}
		return JSON.toJSONString(result);//JSONUtils.toJSONString(result);
	}
	
	/**
	 * 进入系统主界面
	 */
	@RequestMapping("/index.do")
	public String index(HttpServletRequest request, Model model) {

		if(SystemCons.checkLoging(request))
		{
			return "/admin/admin";
		}
		return "/admin/login";
	}
	
	/**
	 * 主页
	 */
	@RequestMapping("/sysindex.do")
	public String sysindex(HttpServletRequest request, Model model) {
		if(SystemCons.checkLoging(request))
		{
			return "/admin/index";
		}
		return "/admin/loginParent";
	}
	
	/**
	 * 根据条件查询用户列表
	 * @Description:
	 * @param request
	 * @param model
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月16日下午1:51:44
	 * @version:1.0.0
	 */
	@RequestMapping("/muser.do")
	public String getAllUser(HttpServletRequest request, User user, Model model) {
		String queryString = request.getParameter("queryString");
	    
		if(SystemCons.checkLoging(request))
		{
			List<User> periodList = userService.queryUserList(queryString,user.getCurrPage(),user.getPageNums());
			
			model.addAttribute("userList", periodList);
			model.addAttribute("total", userService.queryTotal(queryString));
			model.addAttribute("currPage", user.getCurrPage());
			model.addAttribute("pageNums", user.getPageNums());
			model.addAttribute("queryString", queryString);
			
			logger.info("执行查询用户列表操作");
			return "/admin/user/muser";
		}
		return "redirect:/user/loginParent.do";
	}
	
	/**
	 * 根据id查询单个用户跳转到编辑用户页面
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/getEditUser.do")
	public String getUser(int id, HttpServletRequest request, Model model) {
		if(SystemCons.checkLoging(request))
		{
			request.setAttribute("user", userService.findById(id));
			model.addAttribute("user", userService.findById(id));
			return "/admin/user/editUser";
		}
		return "/admin/loginParent";
	}
	
	/**
	 * 编辑
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/updateUser.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String updateUser(User user, HttpServletRequest request, Model model) {
		 ResultEntity<User> result = new ResultEntity<User>();
		 
		//校验用户是否已登录
		  if(SystemCons.checkLoging(request)){
			  try{
				  User loginUser = SystemCons.getUser(request);
				  user.setCompany(loginUser.getCompany());
				  userService.update(user);				  
				  logger.info("修改用户信息成功");
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
	 * 添加用户并重定向
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/addUser.do",produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String addUser(HttpServletRequest request, User user) {
	  ResultEntity<User> result = new ResultEntity<User>();
 	  String name = request.getParameter("name");
 	  String rePassword = request.getParameter("repassword");
 	 System.out.println(userService.queryUserName(name));
	  //校验用户是否已登录
	  if(SystemCons.checkLoging(request)){
		  try{
		      if(StringHelper.isEmpty(user.getPassword()) || StringHelper.isEmpty(rePassword)){
					result.setCode(ResultCode.PARAMERR.getValue());
					result.setErrorMsg(ResultCode.PARAMERR.getName());
					return JSONUtils.toJSONString(result);
		      }
		      if(null != userService.queryUserList(user.getName(), 1, 1) && userService.queryUserName(name)>0)
		      {
		    	    result.setCode(ResultCode.USERNAMEISUSED.getValue());
					result.setErrorMsg(ResultCode.USERNAMEISUSED.getName());
					return JSONUtils.toJSONString(result);
		      }
		      //校验两次密码是否一致
		      if(!user.getPassword().equals(rePassword)){
					result.setCode(ResultCode.NOTEQUALPWD.getValue());
					result.setErrorMsg(ResultCode.NOTEQUALPWD.getName());
					return JSONUtils.toJSONString(result);
		      }
			  
			  user.setPassword(StringHelper.encodPayPwd(user.getPassword()));
			  //设置添加用户默认所属公司
			  User loginUser = SystemCons.getUser(request);
			  user.setCompany(loginUser.getCompany());
			  userService.save(user);  
			  logger.info("新增用户成功");
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
			logger.info("新增用户  -- 用户未登录");
			return JSONUtils.toJSONString(result);
	  }
	}
	


	/**
	 * 删除用户
	 * @param id
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/delUser.do", produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String delUser(int id, HttpServletRequest request) {
		  ResultEntity<User> result = new ResultEntity<User>();
			
		  //校验用户是否已登录
		  if(SystemCons.checkLoging(request)){
			  try{
				  if(id<1){
						result.setCode(ResultCode.PARAMERR.getValue());
						result.setErrorMsg(ResultCode.PARAMERR.getName());
						return JSONUtils.toJSONString(result);
			      }
				  
				  userService.delete(id);
				  logger.info("删除用户成功");
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
				logger.info("删除用户  -- 用户未登录");
				return JSONUtils.toJSONString(result);
		  }
	}
	
	/**
	 * 修改登录密码
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/updatePassword.do",produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String updatePassword(HttpServletRequest request) {
		ResultEntity<User> result = new ResultEntity<User>();
		String newPwd = request.getParameter("newpwd");
		String oldPwd = request.getParameter("oldpwd");
		String reNewPwd = request.getParameter("renewpwd");
		
		//校验用户是否已登录
	    if(SystemCons.checkLoging(request)){
	    	try{
	    		User user = SystemCons.getUser(request);
	    		
		    	if(StringHelper.isEmpty(newPwd) || StringHelper.isEmpty(oldPwd)){
					result.setCode(ResultCode.PARAMERR.getValue());
					result.setErrorMsg(ResultCode.PARAMERR.getName());
					return JSONUtils.toJSONString(result);
		    	}

		    	//校验两次密码是否一致
		    	if(!newPwd.equals(reNewPwd)){
		    		result.setCode(ResultCode.NOTEQUALPWD.getValue());
					result.setErrorMsg(ResultCode.NOTEQUALPWD.getName());
					return JSONUtils.toJSONString(result);
		    	}
		    	
		    	//校验旧密码是否正确
		    	if(!StringHelper.encodPayPwd(oldPwd).equals(user.getPassword())){
					result.setCode(ResultCode.NOTOLDPWD.getValue());
					result.setErrorMsg(ResultCode.NOTOLDPWD.getName());
					return JSONUtils.toJSONString(result);
		    	}
		    	
		    	//校验新密码是否与旧密码相同
		    	if(StringHelper.encodPayPwd(newPwd).equals(user.getPassword())){
					result.setCode(ResultCode.CANTEQUALPWD.getValue());
					result.setErrorMsg(ResultCode.CANTEQUALPWD.getName());
					return JSONUtils.toJSONString(result);
		    	}
	    		
	    		user.setPassword(StringHelper.encodPayPwd(newPwd));
				userService.updatePassword(user);
				logger.info("修改登录密码成功");
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
			logger.info("修改登录密码 -- 用户未登录");
			return JSONUtils.toJSONString(result);
	    }
	}
}
