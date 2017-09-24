<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ page import="com.bdk.conmon.SystemCons" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
     <meta charset="UTF-8">
    <title>报刊目录</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
  <%@include file="./commone/mete.jsp" %>
   <%@include file="./commone/style.jsp" %>
  
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/h5/plugin/swiper/swiper-3.3.1.min.css">
   		 <style type="text/css">
	
	</style>
  </head>
  <!--期刊主目录 -->
<body class="padd_40">
<!-- 	<div class="a">标题</div>-->
 <div style="position: absolute; top: -90rem;" ><img   src="/images/h5/h5_mete_logo.png"/> </div>
	
	     <header class="qk_header qk-header-articse">
         <section class="inner">
	          <article class="left">
	                <img  class="c_img" src="/upload/<%=SystemCons.getSysimgs().getSys_logo()%>">
	          </article>
	           <article class="rigth">
	              <span class="first" ></span>
	              <span class="one">第${periodcal.qknum}期</span>
	              <span class="two">
	                 <span>  <f:formatDate value="${periodcal.releasetime}" type="date"/></span>
	              </span>
	          </article>
          </section>
      </header>
 <!--      	<div class="tab">
		<a class="active" href="javascript:;">tab1</a>
		<a href="javascript:;">tab2</a>
		<a href="javascript:;">tab3</a>
	</div>  -->
	
	 <article  class="qk_box_one">
	   <header class="qk_fl tab"> 
	         <section class="qk_con">
	            <article class="inner">
			             <ul>
			                <li class="one active">
			                 <div class="qk-type-bg">
			                   <span>${Artypelist[0].type}</span>
			                </div>
			                </li>
			                <li>
				                  <div class="qk-type-bg">
				                 <span>${Artypelist[1].type}</span>
				                 </div>
			                </li>
			                <li>
				                <div class="qk-type-bg">
				                 <span>${Artypelist[2].type}</span>
				                 </div>
			                 </li>
			                <li>
				                 <div class="qk-type-bg">
				                  <span>${Artypelist[3].type}</span>
				                  </div>
			                 </li>
			              </ul>
	             </article>
	             </section> 
	          </header>
	</article>
	<div class="swiper-container">
		<div class="refreshtip" style="display: none;"><img src="/images/h5/loading.gif" /><span></span></div>
		<div class="swiper-wrapper w"><!-- 内容 -->
			<div class="swiper-slide d">
				<div class="init-loading  text-center" ></div>
				<div class="swiper-container2">
				<div class="swiper-wrapper">
					 <div class="swiper-slide list-group">
					 </div>
					<div class="swiper-slide list-group">
					</div>
					<div class="swiper-slide list-group">
					</div>
					<div class="swiper-slide list-group">
					</div>
				</div>
				</div>
			</div>
			
		</div>
		
		<div class="loadtip">上拉加载更多</div>
		<div class="swiper-scrollbar"></div><!--流动条-->
	</div>
        <footer class="xk_footer xk_qktype">
         <section class="ck_b_box">
           <article class="inner">
	            <button class="btn"><%=SystemCons.sysparams.getQkxq_dban()%></button>
	            <p class="xk_b_p"><%=SystemCons.sysparams.getSydb_bqwz()%></p>
            </article>
         </section>
      </footer>
        <!--项目路径  -->
        <input id="url" type="hidden" value="${pageContext.request.contextPath}">
        <input id="qknum" type="hidden" value="${periodcal.qknum}">
  </body>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/h5/p_list.css"> 
  <%@include file="./commone/script.jsp" %> 
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/h5/swiper.jquery.min.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/h5/p_list.js"></script>
     <script type="text/javascript">
        $(function(){
        	$(".xk_footer .btn").click(function(){
        		 window.location.href="${pageContext.request.contextPath}/period/qkDireList.do";
        		
        	});
        	
        });
     </script>
     
    
</html>
