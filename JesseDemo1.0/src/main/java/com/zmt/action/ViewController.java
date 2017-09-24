package com.zmt.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zmt.pojo.User;
import com.zmt.service.UserServiceI;

@Controller
public class ViewController {

//	@Autowired
	@Resource
	private UserServiceI userService;
	
    @RequestMapping("/view")
    public ModelAndView view(HttpServletRequest request){
        String path = request.getParameter("path") + "";
        ModelAndView mav = new ModelAndView();
        
        String contextPath = request.getContextPath();
        mav.addObject("contextPath", contextPath);
        mav.setViewName(path);
        return mav;
    }
    
    @RequestMapping("/register")
    public ModelAndView register(HttpServletRequest request){
        String path = request.getParameter("path") + "";
        ModelAndView mav = new ModelAndView();
        
        String contextPath = request.getContextPath();
        mav.addObject("contextPath", contextPath);
        mav.setViewName("register");
        return mav;
    }
    
    @RequestMapping("/saveUser")
    public ModelAndView saveUser(HttpServletRequest request){
    	String path = request.getParameter("path");
    	String name = request.getParameter("name");
    	String age = request.getParameter("age");
    	
    	User user = new User();
    	user.setAge(age);
    	user.setUserName(name);
    	userService.saveUser(user);
    	
        ModelAndView mav = new ModelAndView();
        
        String contextPath = request.getContextPath();
        mav.addObject("contextPath", contextPath);
        mav.setViewName("register_ok");
        return mav;
    }
}