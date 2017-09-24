<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ page import="com.bdk.conmon.SystemCons" %> 
<!DOCTYPE html>
<html>
  <head>
    <title>报刊内容</title>
   <%@include file="../commone/mete.jsp" %>
   <%@include file="../commone/style.jsp" %> 
   <style type="text/css">
   body{
    background: none;
   }
     .article-header h1{
       font-size: .32rem;
     }
      .article-header h2{
               margin-top: .05rem;
    font-size: .22rem;
     }
      .article-header h2 .one{
          color: #248de8;
      }
        .article-header h2 .two{
             margin-left: .1rem;
    color: #999999;
      }
      
     .article-content img{
          margin-top: .2rem;
          width: 100%;
     }
     
     .article-content img[src$=".gif"]{
        width:auto;
     }
      .article-main{
        min-height: 9rem;
      }
     .article-main>.inner{
        padding: .2rem; 
     }
     .article-content{
        /*  text-align: justify; */
           margin-top:.27rem;
            /*  text-indent: .2rem; */
			    margin-top: .2rem;
			    line-height: .5rem;
			    font-size: .32rem;
     }
     .article-content p{
       text-align: left;
        /* text-align: justify; */
     }
   
     .qk_footer{
              padding: .2rem 0 .1rem;
     }
   </style>
  </head>

  <body  >
   <div class="mete_logo" style="position: absolute; top: -90rem;" ><img   src="/images/h5/h5_mete_logo.png"/> </div>
   <div>
     <header class="qk_header">
         <section class="inner">
	          <article class="left">
	                 <img  class="c_img" src="/upload/<%=SystemCons.getSysimgs().getSys_logo()%>">
	                <%-- <img  class="c_img" src="${pageContext.request.contextPath}/images/h5/qk_logo.png"> --%>
	          </article>
	           <article class="rigth">
	              <span class="first" ></span>
	              <span class="one">第${article.qknum}期</span>
	              <span class="two">
	                 <span><%-- <f:formatDate value="${article.releasetime}" type="date"/> --%>${article.releasetime}</span>
	              </span>
	               
	          </article>
          </section>
      </header>
  
    <section class="article-main">
        <article class="inner">
		     <header class="article-header" >
		          <h1  >${article.title}</h1>
		          <h2  >
		              <span class="one">${article.qkname}</span>
		              <span class="two"><f:formatDate value="${article.writetime}" type="both"/></span>
		          </h2>
		     </header>
		     <div class="article-content">
		          ${article.wzinfo}
		     </div>
	     </article>
     </section>
      <footer class="qk_footer">
              <img class="c_img" alt="" src="/upload/<%=SystemCons.getSysimgs().getSydb_logo()%>">	
              <%-- <img class="c_img" alt="" src="${pageContext.request.contextPath}/images/h5/h5_logo.png">--%>
                 <p><%=SystemCons.sysparams.getSydb_bqwz()%></p>
      </footer>
    </div>

  
	        <!--项目路径  -->
        <input id="url" type="hidden" value="${pageContext.request.contextPath}">  
  </body>
   <%@include file="../commone/script.jsp" %> 
   <style type="text/css">

	</style>
    <script type="text/javascript">
    
	   $(function(){
		   //分享图片取内容文章内容图片的第一张，默认图片为bdk标志
		   var imgArry=$(".article-content").find("img");
		   if(imgArry.first().length>0){
			  var img= imgArry.first();
			  $(".mete_logo img").attr("src",img.attr("src"));
		   }
	   }); 
	</script>
</html>
