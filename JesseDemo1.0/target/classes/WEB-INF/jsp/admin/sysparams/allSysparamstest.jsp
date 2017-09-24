<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@page import="com.bdk.mapper.Sysparams"%>
<%@ page import="com.bdk.conmon.SystemCons" %>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pc/sysparams/allSysparams.css">
  </head>
    <body>  
       
       <!-- 
        <blockquote class="layui-elem-quote">
     		 参数信息
    	</blockquote> -->
    <%-- 	<form class="layui-form">
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
		
		
<fieldset class="layui-elem-field layui-inline qk-params">
  <legend>首页</legend>
  <div class="layui-field-box" >
      <div class="wrap-main ">
		       <section class="wrapper params-index">
		               <article class="content">
					   <section class="inner">
						    <div class="img-container"><!--固定图片尺寸超出部分隐藏-->
						         <img id="c_img_one"  class="c_img" alt="" src="/upload/<%=SystemCons.getSysimgs().getFmtp_info()%>">
						    </div> 
							<aside class="c_bootom" >
							    <button id="yaolingbtn" class="btn one"><%=SystemCons.sysparams.getSydb_zcan()%></button>
							    <button id="hunyingbtn" class="btn two"><%=SystemCons.sysparams.getSydb_ycan()%></button>
							</aside>
						</section>
					</article>
		      </section> 
		      <footer class="params-footer">
                 <img class="c_img" alt="" src="/upload/<%=SystemCons.getSysimgs().getSydb_logo()%>">	
                 <p><%=SystemCons.sysparams.getSydb_bqwz()%></p>
              </footer>
             <section>
                <button id="qk_index_btn" class="layui-btn"><i class="layui-icon">&#xe642;</i>   编辑</button>
             </section>
       </div>  
  </div>
  <%@include file="./paramsEdit.jsp" %>
  <!--  -->
</fieldset>

<fieldset class="layui-elem-field layui-inline">
  <legend>企业文化</legend>
  <div class="layui-field-box" >
         <div class="wrap-main ">
		       <section class="wrapper params-index">
		               <article id="content">
					   <section class="inner">
						     <img id="c_img_one"  class="c_img" alt="" src="/upload/<%=SystemCons.getSysimgs().getFmtp_info()%>">
							<aside class="c_bootom" >
							    <button id="yaolingbtn" class="btn one"><%=SystemCons.sysparams.getSydb_zcan()%></button>
							    <button id="hunyingbtn" class="btn two"><%=SystemCons.sysparams.getSydb_ycan()%></button>
							</aside>
						</section>
					</article>
		      </section> 
		      <footer id="footer">
                 <img class="c_img" alt="" src="/upload/<%=SystemCons.getSysimgs().getSydb_logo()%>">	
                 <p><%=SystemCons.sysparams.getSydb_bqwz()%></p>
              </footer>
       </div>  
  </div>
</fieldset>	

<fieldset class="layui-elem-field layui-inline">
  <legend>期刊概要</legend>
  <div class="layui-field-box" >
           <div class="wrap-main ">
		       <section class="wrapper params-index">
		               <article id="content">
					   <section class="inner">
						     <img id="c_img_one"  class="c_img" alt="" src="/upload/<%=SystemCons.getSysimgs().getFmtp_info()%>">
							<aside class="c_bootom" >
							    <button id="yaolingbtn" class="btn one"><%=SystemCons.sysparams.getSydb_zcan()%></button>
							    <button id="hunyingbtn" class="btn two"><%=SystemCons.sysparams.getSydb_ycan()%></button>
							</aside>
						</section>
					</article>
		      </section> 
		      <footer id="footer">
                 <img class="c_img" alt="" src="/upload/<%=SystemCons.getSysimgs().getSydb_logo()%>">	
                 <p><%=SystemCons.sysparams.getSydb_bqwz()%></p>
              </footer>
       </div>  
  </div>
</fieldset>		
		
    </body>  
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
 	<script src="${pageContext.request.contextPath}/js/layui/lay/dest/layui.all.js"></script>
    <script type="text/javascript">  
    var layer = layui.layer,form = layui.form(),$=layui.jquery,laydate = layui.laydate,element=layui.element(),laypage=layui.laypage,layedit = layui.layedit,laytpl = layui.laytpl;
	var    params_edit_form=$("#params_edit_form");//主页表单
    $(function(){
	    	/*一、首页*/
	    	/*1、更换首页图片*/
	    		layui.upload({
	    		  url: '${pageContext.request.contextPath}/article/uploadImg.do',
	    		  elem: '#indeximg',//指定原始元素，默认直接查找class="layui-upload-file"
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
	    		    		     params_edit_form.find("img[name='indexImg']").attr("src",res.data.src);
	 	    		    	    /*  $("#img-upload-info").text(res.data.title); */
	    		    		    /*  $(".img-yulan-wape img").attr("src",res.data.src);  */
	    		    		 }, 500);
	    		       }else{
	    		    	   setTimeout(function(){
	    		    		     layer.msg("上传失败！");
	    		    		    /*  article_edit_form.find("input[name='wzimage']").val("").attr("data-code",1);失败 */
	    		    		 }, 500);
	    		       }
	    		  }
	    		});
	    	
	    	 	/*2、更换底部图片*/
	    		layui.upload({
	    		  url: '${pageContext.request.contextPath}/article/uploadImg.do',
	    		  elem: '#bottomimg',//指定原始元素，默认直接查找class="layui-upload-file"
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
	    		    		     params_edit_form.find("img[name='bottomImg']").attr("src",res.data.src);
	 	    		    	   /*  $("#img-upload-info").text(res.data.title); */
	    		    		     /* $(".img-yulan-wape img").attr("src",res.data.src);  */
	    		    		 }, 500);
	    		       }else{
	    		    	   setTimeout(function(){
	    		    		     layer.msg("上传失败！");
	    		    		    /*  article_edit_form.find("input[name='wzimage']").val("").attr("data-code",1);失败 */
	    		    		 }, 500);
	    		       }
	    		  }
	    		});
	    	
	    	 $("#qk_index_btn").click(function(){
	    		  layer.open({
	          		  type: 1,
	          		  title: "",
	          		  area: '600px',
	          		  shadeClose: false,
	          		  content: $('#qk-index-dialog'),
	          		  success: function(layero, index){
            			  }
	          	  });
	    	 });
	    });
		function editSysparams(){  
		    var form = document.forms[0];  
		    form.action = "<%=basePath%>sysparams/getEditSysparams.do";  
		    form.method="post";  
		    form.submit();  
		}  
	</script> 
</html>  
