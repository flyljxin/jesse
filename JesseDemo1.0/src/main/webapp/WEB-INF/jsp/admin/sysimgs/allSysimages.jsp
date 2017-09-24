<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@page import="com.bdk.mapper.Sysimages"%>
<%@page import="com.dimeng.util.ObjectHelper"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
Sysimages sysimages = ObjectHelper.convert(request.getAttribute("sysimages"), Sysimages.class);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>
	<base href="<%=basePath%>">  
	<title>图标管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
	<style>
	.max{width:100%;height:auto;}
	.min{width:100px;height:auto;}
	</style>
  	</head>
	
	<body">
		<blockquote class="layui-elem-quote">
			图标信息
		</blockquote>
			<form class="layui-form">
			  	<div>
			  		<table width="100%" border="0" cellspacing="0" cellpadding="3" class="yhgl_table tc">
				  		<tr>
				  			<th>封面图片</th>
				  			<th>顶部通用LOGO</th>
				  			<th>首页底部LOGO</th>
				  			<th>弹出二维码</th>
				  			<th>企业文化整张图片</th>
				  			<th>操作</th>
				  		</tr>
				  		<tr>
				  			<th align="center"><div style=" border:1px solid #000; width: 205px; height: 245px; overflow: hidden;"><img style="width: 100%;" src="/upload/<%=sysimages.getFmtp_info()%>"/></div><span style="color:red; font-weight:normal; font-size:15px;">图片按尺寸：616x734像素(px)的1/3比例显示,如超出尺寸请重新编辑上传。</span></th>
				  			<th align="center"><div style=" border:1px solid #000; background: #1e9fff; width: 229px; height: 47px; overflow: hidden;"><img style="width: 100%;" src="/upload/<%=sysimages.getSys_logo()%>"/></div><span style="color:red; font-weight:normal; font-size:15px;">图片按尺寸：229x47像素(px)的1/1比例显示,如超出尺寸请重新编辑上传。</span></th>
				  			<th align="center"><div style=" border:1px solid #000; width: 193px; height: 39px; overflow: hidden;"><img style="width: 100%;" src="/upload/<%=sysimages.getSydb_logo()%>"/></div><span style="color:red; font-weight:normal; font-size:15px;">图片按尺寸：386x78像素(px)的1/2比例显示,如超出尺寸请重新编辑上传。</span></th>
				  			<th align="center"><div style=" border:1px solid #000; width: 160px; height: 160px; overflow: hidden;"><img style="width: 100%;" src="/upload/<%=sysimages.getTc_twocode()%>"/></div><span style="color:red; font-weight:normal; font-size:15px;">图片按尺寸：386x78像素(px)的1/3比例显示,如超出尺寸请重新编辑上传。</span></th>
				  			<th align="center"><div style=" border:1px solid #000; width: 230px; height: 273px; overflow: hidden;"><img style="width: 100%;" src="/upload/<%=sysimages.getQywh_info()%>"/></div><span style="color:red; font-weight:normal; font-size:15px;">图片按尺寸：386x78像素(px)的1/3比例显示,如超出尺寸请重新编辑上传。</span></th>
				  			<th>
								<button class="layui-btn" onclick="editSysimages('${sysimages.id}')">编辑</button>
							</th>
			            </tr>
					</table>
			  	</div>
			</form>
	</body>
	<script type="text/javascript">  
		function editSysimages(id){  
		    var form = document.forms[0];  
		    form.action = "<%=basePath%>sysimgs/getEditSysimages.do?id="+id;
		    form.method="post";  
		    form.submit();  
		}  
	</script>
</html>
