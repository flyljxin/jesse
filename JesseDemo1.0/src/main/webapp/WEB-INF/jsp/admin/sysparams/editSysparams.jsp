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
    
    <div class="paras-edit-dialog" style="padding: 10px">
     	  <form id="article_edit_form" class="layui-form"  >
	     	<table class="layui-table" >
				  <colgroup>
				    <col width="150">
				    <col width="200">
				  </colgroup>
				  <tbody>
				    <tr>
				      <td>首页下方左侧按钮:</td>
				      <td>
				        <input  type="hidden" name="id" value="${sysparams.id}">
				        <input type="text" name="sydb_zcan" value="${sysparams.sydb_zcan}" maxlength="10" class="layui-input" lay-verify="required" >
				      </td>
				    </tr>
				     <tr>
				  
				      <td>首页下方右侧按钮:</td>
				      <td>
				          <input type="text" name="sydb_ycan" value="${sysparams.sydb_ycan}" maxlength="10" class="layui-input" lay-verify="required">
				      </td>
				    </tr>
				    
				    <tr>
				      <td>首页底部版权文字:</td>
				      <td>
				          <input type="text" name="sydb_bqwz" value="${sysparams.sydb_bqwz}" maxlength="20" class="layui-input" lay-verify="required">
				      </td>
				     
				    </tr>
				    
				    <tr>
				        <td>企业文化页面底部按钮文字:</td>
				      <td>
				         <input type="text" name="qywh_dban" value="${sysparams.qywh_dban}" maxlength="15" class="layui-input" lay-verify="required">
				      </td>
				    </tr>
				      <tr>
				      <td>期刊详情页面底部按:</td>
				      <td>
				         <input type="text" name="qkxq_dban" value="${sysparams.qkxq_dban}" maxlength="10" class="layui-input" lay-verify="required">
				      </td>
				    </tr>
				    <tr>
				      <td colspan="2" align="center" style="border: 0 ">
				           <button id="params-editsave-btn" class="layui-btn" style="margin-top: 20px;" lay-submit="" lay-filter="params_edit_btn"  >修改</button>
				      </td>
				    </tr>
				  </tbody>
				</table>
			
			</form>  
    </div>
    </body>  
       <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
      <script src="${pageContext.request.contextPath}/js/layui/lay/dest/layui.all.js"></script>
      <script src="${pageContext.request.contextPath}/js/modules/layerValidation.js"></script>
      <script src="${pageContext.request.contextPath}/js/jquery.form.js"></script> 
    <script type="text/javascript">  
    var layer = layui.layer,form = layui.form(),$=layui.jquery,laydate = layui.laydate,element=layui.element(),laypage=layui.laypage,layedit = layui.layedit,laytpl = layui.laytpl;
  var params_form=$("#article_edit_form");
    $(function(){
    	   /*1、修改 */
		    form.on('submit(params_edit_btn)', function(data){
		    	/*  layer.alert(JSON.stringify(data.field), {
		    	      title: '最终的提交信息'
		    	    }) */
		    	$.post("${pageContext.request.contextPath}/sysparams/editSysparamsjson.do",
		    			{id:data.field.id,sydb_zcan:data.field.sydb_zcan,sydb_ycan:data.field.sydb_ycan,sydb_bqwz:data.field.sydb_bqwz,qywh_dban:data.field.qywh_dban,qkxq_dban:data.field.qkxq_dban},function(data){
		    		  var obj=data[0];
	  	        	  if(obj.code==100){//success
	  	        		  layer.alert('修改成功!',{title:"温馨提示",closeBtn:false,icon:6},function(){
	  	        			 parent.layer.closeAll()
	  	        			 parent.location.reload();  
	  	        		  });
	  	        	  }else if(obj.code=='103'){//nologin
	  	        		  layer.alert('请先登录再修改！',{title:"温馨提示",closeBtn:false,icon:5},function(){
	  	          			   window.location.href="${pageContext.request.contextPath}/user/loginParent.do";
	  	          		  });
	  	        	  }else{
	  	        		  layer.alert(obj.errorMsg,{title:"温馨提示",closeBtn:false,icon:5},function(index){
	  	       			      layer.close(index);
	  	       		      });
	  	        	  }
		    	},"json");
		    	    
		    	return false;
		    });
     });
		function updateSysparams(){  
		    var form = document.forms[0];  
		    form.action = "<%=basePath%>sysparams/editSysparams.do";  
		    form.method="post";  
		    form.submit();  
		}  
	</script> 
</html>  
