<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="com.bdk.conmon.SystemCons" %>  
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>企业文化</title>
   <%@include file="./commone/mete.jsp" %>
   <%@include file="./commone/style.jsp" %>
	 <style type="text/css">
	 .cul_two .inner{
	   padding: .2rem;
	 }
	    .cul_two{
	     
	    }
	     .cul_two img{
	      width: 100%;
	     }
	 </style>
  </head>
  <body> 
  <div style="position: absolute; top: -90rem;" ><img   src="/upload/<%=SystemCons.getSysimgs().getQywh_info()%>"/> </div>
         <header class="qk_header">
         <section class="inner">
	          <article class="left">
	                <img  class="c_img" alt="" src="/upload/<%=SystemCons.getSysimgs().getSys_logo()%>">
	          </article>
	           <article class="rigth">
	              <span class="first" ></span>
	              <span class="one">企业文化</span>
	              <span class="two">
	                 <span>心感力量</span>
	              </span>
	          </article>
          </section>
      </header>
      <!-- 第二部分 -->
      <section class="cul_two">
          <div class="inner">
              <img  class="c_img" alt="" src="/upload/<%=SystemCons.getSysimgs().getQywh_info()%>">
           </div>
      </section> 
      
      <!-- 通用底部带按钮GG  -->
      <footer class="xk_footer">
         <section class="ck_b_box">
           <article class="inner">
	            <button  class="btn"><%=SystemCons.sysparams.getQywh_dban()%></button>
	            <p class="xk_b_p"><%=SystemCons.sysparams.getSydb_bqwz()%></p>
            </article>
         </section>
      </footer>
      
       
        <input id="priod_top1__id" type="hidden" value="${periodca.id}"><!-- 最新期刊已发布id  -->
        <input id="priod_top1__qknum" type="hidden" value="${periodca.qknum}"><!-- 最新期已发布刊号 -->
        <input id="url" type="hidden" value="${pageContext.request.contextPath}"><!--项目路径  -->
  </body>
     <%@include file="./commone/script.jsp" %>
   <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/h5/p_list.js"></script> --%>
  <script type="text/javascript">
      $(function(){
    	  var qknum=$("#priod_top1__qknum").val();
    	 var cul_two=  $(".cul_two")
    	  if(qknum!=null&&''!=qknum){
    		  cul_two.on("click",function(){
    			  window.location.href="${pageContext.request.contextPath}/period/qkList.do?qknum="+qknum;
    		  });
    	  }else{
    		  cul_two.unbind("click"); 
    		  cul_two.on("click",function(){
    			  layer.open({
  	    		    content: '还没有发布期刊,敬请期待！'
  	    		    ,btn: '确定'
  	    		  });
    		  });
    	  }
    	  
    	/*   $(".cul_two").click(function(){
    		  var qknum=$("#priod_top1__qknum").val();
    		  window.location.href="${pageContext.request.contextPath}/period/qkList.do?qknum="+qknum;
    	  }); */
    	  $(".xk_footer .btn").click(function(){
    		  var qknum=$("#priod_top1__qknum").val();
    		  if(qknum!=null&&''!=qknum){
    			    window.location.href="${pageContext.request.contextPath}/period/qkList.do?qknum="+qknum;
    		  }else{
    			  layer.open({
    	    		    content: '还没有发布期刊,敬请期待！'
    	    		    ,btn: '确定'
    	    		  });
    		   }
    		  
    	  });
      });
  </script>
</html>
