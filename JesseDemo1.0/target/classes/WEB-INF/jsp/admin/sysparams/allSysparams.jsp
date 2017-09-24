<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@page import="com.bdk.mapper.Sysparams"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">  
    <title>参数管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
	<style type="text/css">
	   table tbody tr td:nth-child(1){
	         color: #202020;
             font-weight: bold;
	   }
	</style>
  </head>
    <body>  
        <blockquote class="layui-elem-quote">
     		 参数信息
    	</blockquote>
			<table class="layui-table" style="width: 800px">
			  <colgroup>
			    <col width="150">
			    <col width="200">
			  </colgroup>
			  <tbody>
			    <tr>
			      <td>首页下方左侧按钮:</td>
			      <td>${sysparams.sydb_zcan}</td>
			    </tr>
			     <tr>
			  
			      <td>首页下方右侧按钮:</td>
			      <td>${sysparams.sydb_ycan}</td>
			    </tr>
			    
			    <tr>
			      <td>首页底部版权文字:</td>
			      <td>${sysparams.sydb_bqwz}</td>
			     
			    </tr>
			    
			    <tr>
			        <td>企业文化页面底部按钮文字:</td>
			      <td>${sysparams.qywh_dban}</td>
			    </tr>
			      <tr>
			      <td>期刊详情页面底部按:</td>
			      <td>${sysparams.qkxq_dban}</td>
			    </tr>
			    <tr>
			      <td colspan="2" align="center">
			           <button id="params-edit-btn" class="layui-btn">修改</button>
			      </td>
			    </tr>
			  </tbody>
			</table>
    	
    	<%-- <form class="layui-form">
    	  <input name="id" type="hidden" value="${sysparams.id}"/>
		  <div class="layui-form-item">
		    	首页下方左侧按钮:&nbsp;&nbsp;${sysparams.sydb_zcan}
		  </div>
    	  <div class="layui-form-item">
		    	首页下方右侧按钮:&nbsp;&nbsp;${sysparams.sydb_ycan}
		  </div>
		  <div class="layui-form-item">
		  		首页底部版权文字:&nbsp;&nbsp;${sysparams.sydb_bqwz}
		  </div>
		  <div class="layui-form-item">
		   		企业文化页面底部按钮文字:&nbsp;&nbsp;${sysparams.qywh_dban}
		  </div>
		  <div class="layui-form-item">
		    	期刊详情页面底部按钮:&nbsp;&nbsp;${sysparams.qkxq_dban}
		  </div>
			<div>
				<button class="layui-btn" onclick="editSysparams()">编辑</button>
			</div>
		</form> --%>
    </body>  
    <script src="${pageContext.request.contextPath}/js/layui/lay/dest/layui.all.js"></script>
    <script type="text/javascript">  
    var layer = layui.layer,form = layui.form(),$=layui.jquery,laydate = layui.laydate,element=layui.element(),laypage=layui.laypage,layedit = layui.layedit,laytpl = layui.laytpl;
      $(function(){
    	  $("#params-edit-btn").click(function(){
    		  layer.open({
    	    	    type: 2,
    	    	    title: "修改参数信息",
    	    	    area: ['600px', '450px'],
    	    	    content: "${pageContext.request.contextPath}/sysparams/getEditSysparams.do?id="+${sysparams.id}, //iframe的url，no代表不显示滚动条
    	    	  });
    	  });
    	//iframe窗
    	 
    	  
      });
    
    
		function editSysparams(){  
		    var form = document.forms[0];  
		    form.action = "<%=basePath%>sysparams/getEditSysparams.do";  
		    form.method="post";  
		    form.submit();  
		}  
	</script> 
</html>  
