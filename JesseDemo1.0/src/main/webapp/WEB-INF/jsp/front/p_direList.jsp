<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ page import="com.bdk.conmon.SystemCons" %> 

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>期刊目录</title>
    <meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="奔达康,奔达康报,奔达康集团">
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimal-ui" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no, email=no" />
   <!-- 启用360浏览器的极速模式(webkit) -->
<meta name="renderer" content="webkit">
<!-- 避免IE使用兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 针对手持设备优化，主要是针对一些老的不识别viewport的浏览器，比如黑莓 -->
<meta name="HandheldFriendly" content="true">
<!-- 微软的老式浏览器 -->
<meta name="MobileOptimized" content="320">
<!-- uc强制竖屏 -->
<meta name="screen-orientation" content="portrait">
<!-- QQ强制竖屏 -->
<meta name="x5-orientation" content="portrait">
<!-- UC强制全屏 -->
<meta name="full-screen" content="yes">
<!-- QQ强制全屏 -->
<meta name="x5-fullscreen" content="true">
<!-- UC应用模式 -->
<meta name="browsermode" content="application">
<!-- QQ应用模式 -->
<meta name="x5-page-mode" content="app">
<!-- windows phone 点击无高光 -->
<meta name="msapplication-tap-highlight" content="no">
<meta itemprop="name" content="奔达康报"/>
<meta itemprop="image" content="/images/h5/h5_mete_logo.png" />
<meta name="description" itemprop="description" content="" />
    <%@include file="./commone/style.jsp" %>
      <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/h5/plugin/swiper/swiper-3.3.1.min.css">
  </head>
   
  <body class="qk_body"> 
 <div style="position: absolute; top: -90rem;" ><img   src="/images/h5/h5_mete_logo.png"/> </div>
         <header class="qk_header">
         <section class="inner">
	          <article class="left">
	                <img  class="c_img" alt="" src="/upload/<%=SystemCons.getSysimgs().getSys_logo()%>">
	          </article>
	           <article class="rigth">
	              <span class="first" ></span>
	              <span class="one">目录</span>
	              <span class="two">
	                 <span>CONTENTS</span>
	              </span>
	          </article>
          </section>
      </header>
      <!-- 第二部分 -->
     <section class="qk_two">
       <!-- <article class="inner"> -->
         <div class="swiper-container"> 
                <div class="refreshtip">下拉可以刷新</div> 
             	<div class="swiper-wrapper w"><!-- 内容 -->
			       <div class="swiper-slide d">
			                 	<div class="init-loading list-group-item text-center" style="display: none;">下拉可以刷新</div>
					             <table class="qk_sub_table">
						            
					             </table>
			         		</div>
		                 </div>
		                   <div class="loadtip">上拉加载更多</div>
		                    <div class="swiper-scrollbar"></div><!--流动条-->
			         </div><!--swiper-container end-->
			  
          <!--  </article> -->
      </section>  
      <!--底部  -->
      <footer class="sub_footer dire-footer">
          <p><%=SystemCons.sysparams.getSydb_bqwz()%></p>
      </footer>
    <!--   <footer class="xk_footer">
         <section class="ck_b_box">
           <article class="inner">
	            <button class="btn">查看更多期刊</button>
	            <p class="xk_b_p">深圳市心感力量文化传播有限公司</p>
            </article>
         </section>
      </footer> -->
       <!--项目路径  -->
        <input id="url" type="hidden" value="${pageContext.request.contextPath}">
  </body>
   
     <%@include file="./commone/script.jsp" %>
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/layer_mobile/layer.js"></script>
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/h5/swiper.jquery.min.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/h5/p_direList.js"></script>
     <script type="text/javascript">
        $(function(){
        	$(".xk_footer .btn").click(function(){
        		layer.open({
        		    type: 2
        		    ,content: '加载中'
        		  });
        	});
        	
        	/* 点击第几期 */
			$(".qk_sub_table .qk_title").click(function(){
			    window.location.href="${pageContext.request.contextPath}/period/qkList.do";
			});        	
        });
     </script>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/h5/p_sublist.css">
</html>
