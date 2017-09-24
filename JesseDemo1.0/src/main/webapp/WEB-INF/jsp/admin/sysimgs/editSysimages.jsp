<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@page import="com.bdk.mapper.Sysimages"%>
<%@page import="com.dimeng.util.ObjectHelper"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Sysimages sysimages = ObjectHelper.convert(request.getAttribute("sysimages"), Sysimages.class);
%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">  
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
	<title>图标管理</title>  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">

    </head>  
    <body>  
        <blockquote class="layui-elem-quote">
     		 编辑图标信息
    	</blockquote>
    	<form id="sysimages_edit_form " class="layui-form" action="">
		    	 <input id="sysid" type="hidden" name="id" id="sysimagesId" value="${sysimages.id}" class="layui-input"/>
		    	<div class="layui-form-item">
				 <!--1、封面整张图片  -->
				  <div class="layui-inline">
				     <div class="layui-input-inline" >
				        <span style="color:red; ">图片按尺寸：616x734像素(px)的1/3比例显示,如超出尺寸请重新编辑上传。</span>
				        <input id="fmtpinfo"  type="hidden"   value="<%=sysimages.getFmtp_info()%>" >
				        <div class="img-wrap" >
				          <img src="${pageContext.request.contextPath}/upload/<%=sysimages.getFmtp_info()%>" width="160" height="200" />
				         </div>
				        <input id="fmtp_info" type="file" name="file" class="layui-upload-file">
				     </div>
				  </div>
				  <!--2、系统通用顶部log图片  -->
				  <div class="layui-inline">
				    <div class="layui-input-inline" >
				       <span style="color:red; ">图片按尺寸：229x47像素(px)的1/1比例显示,如超出尺寸请重新编辑上传。</span>
				        <input id="syslogo" type="hidden"   value="<%=sysimages.getSys_logo()%>" >
				        <div class="img-wrap" >
				           <img src="${pageContext.request.contextPath}/upload/<%=sysimages.getSys_logo()%>" width="160" height="60" style="background: #1e9fff;" />
				        </div>
				        <input id="sys_logo" type="file" name="file" class="layui-upload-file">
				    </div>
		          </div>
		          <!--3、首页底部LOGO  -->
		           <div class="layui-inline">
				    <div class="layui-input-inline" >
				        <span style="color:red; ">图片按尺寸：386x78像素(px)的1/2比例显示,如超出尺寸请重新编辑上传。</span>
				         <input id="sydblogo" type="hidden" "  value="<%=sysimages.getSydb_logo()%>" >
				         <div class="img-wrap" >
				        <img src="${pageContext.request.contextPath}/upload/<%=sysimages.getSydb_logo()%>" width="160" height="60" />
				        </div>
				       <input id="sydb_logo" type="file" name="file" class="layui-upload-file">
				    </div>
				  </div>
				  <!--4、弹出二维码  -->
				  <div class="layui-inline">
				    <div class="layui-input-inline" > 
				        <span style="color:red; ">图片按尺寸：386x78像素(px)的1/3比例显示,如超出尺寸请重新编辑上传。</span>
				         <input id="tctwocode" type="hidden"   value="<%=sysimages.getTc_twocode()%>" >
				         <div class="img-wrap" >
				        <img src="${pageContext.request.contextPath}/upload/<%=sysimages.getTc_twocode()%>" width="150" height="150" />
				        </div>
				       <input id=tc_twocode type="file" name="file" class="layui-upload-file">
				    </div>
		          </div>
		          <!--5、企业文化整张图片  -->
		           <div class="layui-inline">
				    <div class="layui-input-inline" >
				      <span style="color:red; ">图片按尺寸：386x78像素(px)的1/3比例显示,如超出尺寸请重新编辑上传。</span>
				       <input id="qywhinfo" type="hidden"  value="<%=sysimages.getQywh_info()%>" >
				        <div class="img-wrap" >
				       <img src="${pageContext.request.contextPath}/upload/<%=sysimages.getQywh_info()%>" width="160" height="200" />
				       </div>
				       <input id="qywh_info" type="file" name="file" class="layui-upload-file">
				    </div>
				  </div>
				  
				
				  
		        </div>
		        
		        <div class="layui-form-item">
					 <div class="layui-input-block">
					     <button id="sysimages_edit_btn" class="layui-btn"  onclick="javascript:return false;" >修改</button> 
					     <button id="sysimages_reselt_btn" class="layui-btn"  onclick="javascript:return false;" >刷新</button> 
			          </div>
				  </div>
      </form>
	    
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/layui/lay/dest/layui.all.js"></script>  
    <script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>    
    <script type="text/javascript">
    var layer = layui.layer,form = layui.form(),$=layui.jquery,laydate = layui.laydate,element=layui.element(),laypage=layui.laypage,layedit = layui.layedit,laytpl = layui.laytpl;
    var sysimages_edit_form=$("#sysimages_edit_form");
    $(function(){
    	
    	/*6、刷新 */
    	  $("#sysimages_reselt_btn").click(function(){
    		  window.location.reload();
    	  });
    	    /*5、修改按钮*/
    	   $("#sysimages_edit_btn").click(function(){
    	    var sysid=	$("#sysid").val();
    	    var fmtpinfo=	$("#fmtpinfo").val();
    	    var syslogo=	$("#syslogo").val();
    	    var sydblogo=	$("#sydblogo").val();
    	    var tctwocode=	$("#tctwocode").val();
    	    var qywhinfo=	$("#qywhinfo").val();
	    		layer.alert('确认修改吗?', {title:"温馨提示",icon: 3,offset: '200px'},function(){ 
	    	    	$.post("${pageContext.request.contextPath}/sysimgs/saveSysimages.do",
	    	    			{id:sysid,fmtp_info:fmtpinfo,sys_logo:syslogo,sydb_logo:sydblogo,tc_twocode:tctwocode,qywh_info:qywhinfo},
	    	    			function(data){
	    	    		 var obj=data[0];
	     	        	  if(obj.code==100){//success
	     	        		  layer.alert('修改成功!',{title:"温馨提示",closeBtn:false,icon:6},function(){
	     	        			 layer.closeAll();
	     	        			 /* location.reload(); */  
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
	    	    	});
	    		  });
    	    });
    	    
    	   	/*1、封面整张图片*/
	    	layui.upload({
	    		  url: '${pageContext.request.contextPath}/article/uploadImg.do',
	    		  elem:'#fmtp_info',
	    		  title:"上传封面图片",
	    	      before:function(input){
	    	    	  layer.msg('上传中', {
	    	    		  icon: 16
	    	    		  ,shade: 0.01,
	    	    		time:500
	    	    		});
	    	    
	    			  }
	    		  ,success: function(res){
	    		       if(res.code==0){
	    		    	   setTimeout(function(){
	    		    		     layer.msg("上传成功！");
	    		    		      $("#fmtpinfo").val(res.data.title);
	    		    		      $("#fmtpinfo").next().find("img").attr("src",res.data.src)
	    		    		 }, 500);
	    		       }else{
	    		    	   setTimeout(function(){
	    		    		     layer.msg("上传失败！");
	    		    		 }, 500);
	    		       }
	    		  }
	    		});
    	    /*2、系统通用顶部log图片  */
	    	layui.upload({
	    		  url: '${pageContext.request.contextPath}/article/uploadImg.do',
	    		  elem:'#sys_logo',
	    		  title:"上传顶部LOGO",
	    	      before:function(input){
	    	    	  layer.msg('上传中', {
	    	    		  icon: 16
	    	    		  ,shade: 0.01,
	    	    		time:500
	    	    		});
	    	    
	    			  }
	    		  ,success: function(res){
	    		       if(res.code==0){
	    		    	   setTimeout(function(){
	    		    		   layer.msg("上传成功！");
	    		    		     $("#syslogo").val(res.data.title);
	    		    		      $("#syslogo").next().find("img").attr("src",res.data.src)
	    		    		 }, 500);
	    		       }else{
	    		    	   setTimeout(function(){
	    		    		     layer.msg("上传失败！");
	    		    		    /*  article_edit_form.find("input[name='wzimage']").val("").attr("data-code",1); */
	    		    		 }, 500);
	    		       }
	    		  }
	    		});
    	
    	    
	    	  /*3、首页底部LOGO  */
	    	layui.upload({
	    		  url: '${pageContext.request.contextPath}/article/uploadImg.do',
	    		  elem:'#sydb_logo',
	    		  title:"上传底部LOGO",
	    	      before:function(input){
	    	    	  layer.msg('上传中', {
	    	    		  icon: 16
	    	    		  ,shade: 0.01,
	    	    		time:500
	    	    		});
	    	    
	    			  }
	    		  ,success: function(res){
	    		       if(res.code==0){
	    		    	   setTimeout(function(){
	    		    		   layer.msg("上传成功！");
	    		    		     $("#sydblogo").val(res.data.title);
	    		    		      $("#sydblogo").next().find("img").attr("src",res.data.src)
	    		    		 }, 500);
	    		       }else{
	    		    	   setTimeout(function(){
	    		    		     layer.msg("上传失败！");
	    		    		    /*  article_edit_form.find("input[name='wzimage']").val("").attr("data-code",1); */
	    		    		 }, 500);
	    		       }
	    		  }
	    		});
    	
	  	  /*4、弹出二维码  */
	    	layui.upload({
	    		  url: '${pageContext.request.contextPath}/article/uploadImg.do',
	    		  elem:'#tc_twocode',
	    		  title:"上传二维码",
	    	      before:function(input){
	    	    	  layer.msg('上传中', {
	    	    		  icon: 16
	    	    		  ,shade: 0.01,
	    	    		time:500
	    	    		});
	    	    
	    			  }
	    		  ,success: function(res){
	    		       if(res.code==0){
	    		    	   setTimeout(function(){
	    		    		   layer.msg("上传成功！");
	    		    		      $("#tctwocode").val(res.data.title);
	    		    		      $("#tctwocode").next().find("img").attr("src",res.data.src)
	    		    		 }, 500);
	    		       }else{
	    		    	   setTimeout(function(){
	    		    		     layer.msg("上传失败！");
	    		    		    /*  article_edit_form.find("input[name='wzimage']").val("").attr("data-code",1); */
	    		    		 }, 500);
	    		       }
	    		  }
	    		});
	  	  
	    	 /*5、企业文化整张图片*/
	    	layui.upload({
	    		  url: '${pageContext.request.contextPath}/article/uploadImg.do',
	    		  elem:'#qywh_info',
	    		  title:"上传企业文化",
	    	      before:function(input){
	    	    	  layer.msg('上传中', {
	    	    		  icon: 16
	    	    		  ,shade: 0.01,
	    	    		time:500
	    	    		});
	    	    
	    			  }
	    		  ,success: function(res){
	    		       if(res.code==0){
	    		    	   setTimeout(function(){
	    		    		   layer.msg("上传成功！");
	    		    		   $("#qywhinfo").val(res.data.title);
	    		    		      $("#qywhinfo").next().find("img").attr("src",res.data.src)
	    		    		 }, 500);
	    		       }else{
	    		    	   setTimeout(function(){
	    		    		     layer.msg("上传失败！");
	    		    		     /* article_edit_form.find("input[name='wzimage']").val("").attr("data-code",1); */
	    		    		 }, 500);
	    		       }
	    		  }
	    		});
	    	  
	  	  //弹窗监听提交
		$("#subbtn").click(function(){
			 var arryfs=$("#logoform input[type='file']");
			 for(var i=0;i<arryfs.length;i++){
				   if(arryfs[i].files[0]!=undefined){
					   var filepath=arryfs[i].value;
					   var extStart=filepath.lastIndexOf(".");
					   var ext=filepath.substring(extStart,filepath.length);
					   if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(ext)){
						   layer.alert('图片类型必须是.gif,jpeg,jpg,png中的一种!',{title:"温馨提示",closeBtn:false,icon:5,offset: '200px'});
				           return false;
						  }
					   if( arryfs[i].files[0].size>1048576){
						   layer.alert('您上传的文件不能大于500KB!',{title:"温馨提示",closeBtn:false,icon:5,offset: '200px'});
						   return false;
					  }
				   }
			 }
			$("#logoform").ajaxSubmit({
              	     type:"post",
              	     dataType:"json",
   		         url: '${pageContext.request.contextPath}/sysimgs/editSysimages.do',
   		         success:function(data){
   		        	  var obj=data[0];
   		        	  if(obj.code==100){//success
   		        		  layer.alert('修改成功!',{title:"温馨提示",closeBtn:false,icon:6,offset: '200px'},function(){
   		        			  layer.closeAll();
   		        			  window.location.href="${pageContext.request.contextPath}/sysimgs/allSysimages.do";
   		        		  });
   		        	  }else if(obj.code=='103'){//nologin
   		        		  layer.alert('请先登录再修改！',{title:"温馨提示",closeBtn:false,icon:5,offset: '200px'},function(){
   		          			   window.location.href="${pageContext.request.contextPath}/user/loginParent.do";
   		          		  });
   		        	  }else if(obj.code=='110'){//nologin
   		        		  layer.alert('请选择需要上传的文件！',{title:"温馨提示",closeBtn:false,icon:5,offset: '200px'},function(){
   		        			   var id = document.getElementById("sysimagesId").value;
  		          			   var url="${pageContext.request.contextPath}/sysimgs/getEditSysimages.do?id="+id;
   		        			   window.location.href=url;
  		          		  });
  		        	  }else{
   		        		  layer.alert(obj.errorMsg,{title:"温馨提示",closeBtn:false,icon:5,offset: '200px'},function(index){
   		       			      layer.close(index);
   		       		      });
   		        	  }
   		        }
	    	});
	 	   	return false;
		});
	});
	</script>	
<style type="text/css">
	  .layui-input-inline .img-wrap{
	    	height: 215px;
        display: table-cell;
        vertical-align: middle;
         padding-bottom: 11px;
	  }
	</style>   
    </body>  
</html>  
