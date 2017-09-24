<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
  <head>
    <title>期刊内容管理</title>
   <%@include file="/WEB-INF/jsp/front/commone/mete.jsp" %>
   <%@include file="/WEB-INF/jsp/front/commone/style.jsp" %> 
  </head>

  <body>
     <header>
          <h1>美媒：中国战机东海上空拦截美侦察机 距离46米</h1>
          <h2><span>奔达康金融</span><span>05-19 10:02</span></h2>
     </header>
     <div>
           <img alt="" src="${pageContext.request.contextPath}/images/h5/h5_news_img.jpg">
            <p>
                                    【环球网报道记者赵衍龙】美国国家广播公司5月18日报道称，两名美国军方官员透露称，中国两架喷气式战斗机周三在东海上空对美国一架核侦察机进行了拦截。CNN称，中国两架战机距离美侦察机约150英尺(约46米)，其中一架战机直接在美军机面前作了桶滚动作。
           </p>
     </div>
     <footer>
      
     </footer>
    
<%-- <table class="layui-table">
    <colgroup>
      <col width="150">
       <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="200">
      <col width="200">
      <col>
    </colgroup>
    
    <tbody>
      <tr>
        <td>所属期刊</td>
        <td>${article.qknum}</td>
        <td>文章标题</td>
        <td>${article.title}</td>
        <td>版块</td>
        <td>${article.type}</td>
        <td>文章主图</td>
        <td>${article.wzimage}</td>
      </tr>
      <tr>
           <td colspan="8">${article.wzinfo}</td>
       </tr>
    </tbody>
  </table> --%>
  
	        <!--项目路径  -->
        <input id="url" type="hidden" value="${pageContext.request.contextPath}">  
  </body>
   <%@include file="/WEB-INF/jsp/front/commone/script.jsp" %> 
    <script type="text/javascript">
	   $(function(){
			
	   }); 
	</script>
</html>
