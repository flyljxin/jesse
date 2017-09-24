<%@page import="java.awt.Window"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" class="no-js">

    <head>
        <meta charset="utf-8">
        <title>奔达康企业期刊后台管理系统登录</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/supersized.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/style.css">
    </head>
    
    <body>
        <div class="page-container">
            <h1 style="color: white;" >企业报刊后台系统登录</h1>
            <form id="userform" action="${pageContext.request.contextPath}/user/checkLogin.do" method="post">
                <input type="text" name="username" class="username" placeholder="用户名">
                <input type="password" name="password" class="password" placeholder="你的密码">
                <button id="okbtn" type="submit" onclick="javascript:return false;">确认</button>
                <div class="error"><span>+</span></div>
            </form>
        </div>
        <!-- Javascript -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/supersized.3.2.7.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/supersized-init.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/scripts.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/md5/MD5.js"></script>
		<script src="${pageContext.request.contextPath}/js/layui/lay/dest/layui.all.js"></script>  
	<script type="text/javascript">
         $(function(){
        	 $("#okbtn").click(function(){
        		 var form=$("#userform");
        		   var name=form.find(".username").val();
        		   var pwd=form.find(".password").val();
        		   if(name==""||name==null){
        			   layer.msg("用户名为空!", {icon: 5});
        			   form.find(".username").focus();
        		   }else if(pwd==""||pwd==null){
        			   layer.msg("密码为空!", {icon: 5});
        			   form.find(".password").focus();
        		   }else {
        			    $.post("${pageContext.request.contextPath}/user/checkLogin.do",
        			    		{username:name,password:hex_md5(pwd)},function(data){
        			    			var json=data;//[0];
        			    			if(json.code=='100'){
        			    				 layer.msg('正在登录...', {
        			    					  icon: 16
        			    					  ,shade: 0.6,
        			    					  time: 700
        			    					},function(data){
        			    						 window.location.href="${pageContext.request.contextPath}/user/index.do";
        			    					});
        			    			}else{
        			    				 layer.msg(json.errorMsg, {icon: 5});
        			    			}
        			    		});
        		   }
        	 });
         });
	</script>
    </body>
</html>

