<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="com.bdk.conmon.SystemCons" %>

<%-- <%  
//签名  
String url = request.getScheme()+"://";  
url+=request.getHeader("host");     
url+=request.getRequestURI();     
if(request.getQueryString()!=null){  
    url+="?"+request.getQueryString();     
}  
  
Map<String,String> sign = WxUtil.getSign(url);  
String timestamp = sign.get("timestamp");  
String nonceStr = sign.get("nonceStr");  
String jsapi_ticket = sign.get("jsapi_ticket");  
String signature = sign.get("signature");  
//String url = sign.get("url");  
  
%>  --%> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>奔达康报</title>
   <%@include file="./commone/mete.jsp" %>
   <%@include file="./commone/style.jsp" %>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/h5/p_index.css">
  </head>
  
  <body> 
  
       <section class="wrapper">
                <article id="content">
				   <section class="inner">
					     <%-- <img id="c_img_one"  class="c_img" alt="" src="${pageContext.request.contextPath}/images/h5/h5_i_con.png"> --%>
					     <img id="c_img_one"  class="c_img" alt="" src="${pageContext.request.contextPath}/upload/<%=SystemCons.getSysimgs().getFmtp_info()%>">
						<aside class="c_bootom" >
						    <button id="yaolingbtn" class="btn one"><%=SystemCons.sysparams.getSydb_zcan()%></button>
						    <button id="hunyingbtn" class="btn two"><%=SystemCons.sysparams.getSydb_ycan()%></button>
						</aside>
					</section>
				</article>
       </section>
       <footer id="footer">
                 <img class="c_img" alt="" src="${pageContext.request.contextPath}/upload/<%=SystemCons.getSysimgs().getSydb_logo()%>">	
                 <p><%=SystemCons.sysparams.getSydb_bqwz()%></p>
        </footer>
        <!--项目路径  -->
        <input id="url" type="hidden" value="${pageContext.request.contextPath}">
  </body>
     <%@include file="./commone/script.jsp" %>
     <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
   <script type="text/javascript">
   var url=$("#url").val();
   var comurl=window.location.href;

   $(function(){
	   getConfigFun();
	   //1、获取配置信息
	   function getConfigFun(){
		   var url=window.location.href;
		   $.post("${pageContext.request.contextPath}/wxchat/getConfig.do",{urlstr:url},function(data){
			   console.log(data);
			   console.log(data.jsapi_ticket);
			   configFun(data);
		   },"json");
	   }
	  function configFun(data){ 
		   wx.config({  
			    debug: true,  
			    appId: data.appId,  
			    timestamp: data.timestamp,  
			    nonceStr: data.nonceStr,  
			    signature: data.signature,  
			    jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage', 'onMenuShareQQ', 'onMenuShareWeibo', 'onMenuShareQZone'] // 功能列表，我们要使用JS-SDK的什么功能  
			});  
	  }  
		// config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在 页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready 函数中。  
		wx.ready(function(){  
		    // 获取"分享到朋友圈"按钮点击状态及自定义分享内容接口  
		    wx.onMenuShareTimeline({  
		        title: '奔达康报', // 分享标题  
		        link: 'http://fcbc.v228.10000net.cn',  
		        imgUrl: 'http://fcbc.v228.10000net.cn/images/h5/h5_mete_logo.png' // 分享图标  
		    });  
		      
		    // 获取"分享给朋友"按钮点击状态及自定义分享内容接口  
		    wx.onMenuShareAppMessage({  
		        title: '奔达康报', // 分享标题  
		        desc: '奔达康报描述信息', // 分享描述  
		        link: 'http://fcbc.v228.10000net.cn',  
		        imgUrl:'http://fcbc.v228.10000net.cn/images/h5/h5_mete_logo.png', // 分享图标  
		        type: 'link' // 分享类型,music、video或link，不填默认为link  
		    });  
		    //获取"分享到QQ"按钮点击状态及自定义分享内容接口  
		    wx.onMenuShareQQ({  
		    title: '奔达康报', // 分享标题  
		    desc: '奔达康报描述信息', // 分享描述  
		    link: 'http://fcbc.v228.10000net.cn', // 分享链接  
		    imgUrl:'http://fcbc.v228.10000net.cn/images/h5/h5_mete_logo.png' // 分享图标  
		    });  
		    //获取"分享到腾讯微博"按钮点击状态及自定义分享内容接口  
		    wx.onMenuShareWeibo({  
		    title: '奔达康报', // 分享标题  
		    desc: '奔达康报描述信息', // 分享描述  
		    link: 'http://fcbc.v228.10000net.cn', // 分享链接  
		    imgUrl: 'http://fcbc.v228.10000net.cn/images/h5/h5_mete_logo.png' // 分享图标  
		    });  
		      
		    //获取"分享到QQ空间"按钮点击状态及自定义分享内容接口  
		    wx.onMenuShareQZone({  
		    title: '奔达康报', // 分享标题  
		    desc: '奔达康报描述信息', // 分享描述  
		    link: 'http://fcbc.v228.10000net.cn', // 分享链接  
		    imgUrl: 'http://fcbc.v228.10000net.cn/images/h5/h5_mete_logo.png' // 分享图标  
		    });  
		});   
	   
   	$("#c_img_one").click(function(){
   		  window.location.href=url+"/period/culture.do";
   	});
	  	    /* 邀您分享 */
		   	$("#yaolingbtn").click(function(){
		   		layer.open({
		   		   style: 'background-color: rgba(0,0,0,0);position:fixed;left: .03rem;top: -.29rem; width:100%; height:100%; border: none; -webkit-animation-duration: .5s; animation-duration: .5s;',
		   		   content:'<img class="c_img" alt="" src="${pageContext.request.contextPath}/images/h5/share.png">'
		   		});
	   		/*灰色部分关闭分享*/
	   		$(".layui-m-layermain").click(function(){layer.closeAll();});
	   	});
	  	    
	  	   
		    /* 邀您分享 */
		   	$("#hunyingbtn").click(function(){
		   		/* 欢迎投稿 */
		   		layer.open({
		   			className:'share-btn',
		   		    content:'<img class="c_img" alt="" src="../upload/<%=SystemCons.getSysimgs().getTc_twocode()%>">'
		   		});
	   	});
	  	    
		   
   });
   </script>
</html>
