package com.bdk.conmon;

import javax.servlet.http.HttpServletRequest;

import com.bdk.mapper.Sysimages;
import com.bdk.mapper.Sysparams;
import com.bdk.mapper.User;

public class SystemCons {
	
	public static final String ADMIN_SESSION="ADMIN_SESSION_USER";
	
	/**
	 * 公用校验登录方法
	 * @Description:
	 * @param request
	 * @return
	 * @author ChenQuan
	 * @date 2017年5月11日下午2:42:01
	 * @version:1.0.0
	 */
	public static boolean checkLoging(HttpServletRequest request)
	{
		if(request.getSession().getAttribute(ADMIN_SESSION) == null)
		{
			return false;
		}
		return true;
	}
	
	/**
	 * 获取当前用户信息
	 * @param request
	 * @return
	 */
	public static User getUser(HttpServletRequest request)
	{
		return (User)request.getSession().getAttribute(ADMIN_SESSION);
	}
	
	public static Sysparams sysparams;
	public static Sysimages sysimgs;

	public static Sysparams getSysparams() {
		return sysparams;
	}

	public static void setSysparams(Sysparams sysparams) {
		SystemCons.sysparams = sysparams;
	}

	public static Sysimages getSysimgs() {
		return sysimgs;
	}

	public static void setSysimgs(Sysimages sysimgs) {
		SystemCons.sysimgs = sysimgs;
	}
}
