<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
  <%@ page import="com.bdk.conmon.SystemCons" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>期刊内容管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/md5/MD5.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
	<%@include file="../common/style.jsp" %>
	<style type="text/css">
	.layui-form-item   .img-yulan-wape{
    width: 174;
    height: 120px;
    /* border-radius: 7px; */
    overflow: hidden;
    position: absolute;
    top: 8px;
    margin-left: 40px;
	  }
	 .layui-form-item  .img-yulan-wape img{
	        width: 174px;
    height: 120px;
	  }
	</style>
	
	
<!--预览模板样式-->
<style>
   #artic_view_phone{
      width: 380px;
    
      background: #dadada;
   }
   .art-header table{
     width: 100%;
         background: #0074d9;
         text-align: center;
             height: 55px;
   }
   .art-header>.inner{
       
   }
   .art-header .left img{
        width: 140PX;
        height: 28PX;
   }
    .art-header .rigth span{
    display: inline-block;
    float: left;
    height: 23px;
    line-height: 24px;
    font-size: 18px;
        color: white;
            margin-left: 4px;
    }
    .art-header .rigth .two{
    	background: #ffbb00;
    }
   .art-header .rigth .first{
          background: url(/images/h5/qk_s.png) center no-repeat;
          background-size: 100% 100%;
           width: 14px; 
   }
   .section>.inner{
     padding: 6px;
   }
   .art-content h1{
          font-size: 18px;
          word-wrap: break-word;
   }
    .art-content h2{
            font-size: 13px;
    color: #248de8;
    line-height: 13px;
    height: 13px;
    margin-top: 5px;
   }
   .art-content h2 .one{
    color: #248de8;
   }
   .art-content h2 .two{
    margin-left: 8px;
    color: #999999;
   }
.art-p{
/* text-align: justify; */
   /*  text-indent: 20px; */
    /* margin-top: 20px; */
    line-height: 27px;
    font-size: 16px;
    padding: 6px;
        min-height: 343px;
   }
   
 .art-p img{
    margin:5px 0 5px;      
    width: 100%;
   }
   .art-p img[src$=".gif"]{
       width:auto;
    }
   .art-footer{
     text-align: center;
   }
   .art-footer img{
           width: 226px;
   }
   .art-footer p{
         font-size: 13px;
    /* line-height: 2.3rem; */
    /* height: .3rem; */
    margin-top:10px;
    /* margin-bottom: .55rem; */
    color: #808080;
   }
  .layui-form-item .layui-input-inline{
   width: 263px;
   }
</style>
  </head>
  <body>
    <div class="qk_dialog">
     <div class="inner">
       <form id="article_edit_form" class="layui-form"  method="post">
              <input type="hidden" name="id" value="${article.id}">
              <input type="hidden" name="writetimestr" value="<fmt:formatDate value="${article.writetime}" type="both"/>"> 

    								<div class="layui-form-item">
										   <label class="layui-form-label">所属期刊：</label>
										   <div class="layui-input-inline" >
										      <select name="qkid" lay-filter="qktype" lay-verify="required"  lay-search >
										           <option value="">带搜索的选择框</option>
										           <c:forEach items="${periodList}" var="art" varStatus="ist"> 
										               <option  value="${art.id}" data-name="${art.qkname}" data-number="${art.qknum}"<c:if test="${art.id==article.qkid}">selected</c:if> >第${art.qknum}期--${art.qkname}</option>
										            </c:forEach>  
										      </select>
										       <input name="qknumber" type="hidden" value="${article.qknum}">
										       <input name="qkChinaName" type="hidden"  value="${article.qkname}">
										   </div>
										   <label class="layui-form-label">文章标题：</label>
											<div class="layui-input-inline">
												<input type="text" name="title" value="${article.title}" lay-verify="required" class="layui-input">
											</div>
										 </div>
										<div class="layui-form-item">
										   <label class="layui-form-label">版块：</label>
										   <div class="layui-input-inline">
										     <select name="type" lay-filter="bktype" value="${article.type}" lay-verify="required">
										         <c:forEach items="${artypeList}" var="tl"> 
										               <option  value="${tl.code}"  <c:if test="${tl.code == article.type}">selected</c:if> >${tl.type}</option>
										         </c:forEach>  
										     </select>
										      <input name="bkChinaName" type="hidden"  value="${article.typename}">
										   </div>
										   
										   <label class="layui-form-label">文章主图：</label>
											<div class="layui-input-inline">
												 <input type="hidden" name="wzimage"  value="${article.wzimage}" class="layui-input"  data-code="${(article.wzimage!=null&&article.wzimage!='')?'0':'1'}">
												<input type="file" name="file" class="layui-upload-file"  >
										           <div class="layui-form-mid layui-word-aux " style="position: absolute;width: 300px;">请上传规定尺寸宽174(px)高120(px)像素</div>
											</div>
											
										    <div class="layui-input-inline img-yulan-wape">
											    <div>
											       <img id="qk-edit-img"  alt="图片预览" src="${article.wzimage}">
											    </div>
											</div>
											<!--  <div id="img-upload-info"  class=" layui-form-mid layui-word-aux">图片小于1M,格式img|png|jpg|jpeg</div> -->
										 </div>
										 
									    <div class="layui-form-item layui-form-text" style="margin-top: 28px;">
										    <label class="layui-form-label">文章内容:</label>
										    <div class="layui-input-block">
										      <textarea class="layui-textarea layui-hide" name="wzinfo"  id="article_edit_editor"  >${article.wzinfo}</textarea>
										    </div>
										  </div>
									    
										<div class="layui-form-item">
											 <div class="layui-input-block">
											   <!--  <button class="layui-btn" lay-submit="" lay-filter="article_return_btn" onclick="javascript:window.history.go(-1);">返回</button> -->
											<button class="layui-btn" lay-submit="" lay-filter="article_edit_view">预览</button> 
									            <button class="layui-btn" lay-submit="" lay-filter="article_edit_save">修改</button>
									            <!-- <button  type="reset" class="layui-btn layui-btn-primary">重置</button> -->
									          </div>
										</div>
</form>  
</div>
</div>

        <!--编辑预览的弹窗-->
        
<div id="view">

</div> 
 
 <script id="artic_view_phone_temp"   type="text/html">
  <div id="artic_view_phone" class="dialog" style="display: none;" >
	<div class="art-header">
	  <div class="inner">
			<table lay-even lay-skin="nob">
			   <tr>
			       <td class="left">
			          <img  class="c_img" src="/upload/<%=SystemCons.getSysimgs().getSys_logo()%>">
			       </td>
			       <td class="rigth">
			                  <span class="first" ></span>
			              <span class="one">第{{ d.qknum }}期</span>
			              <span class="two">
			              	<span>{{d.qktime}}</span>
			              </span>
			          </td>
			   </tr>
			</table>
		</div>
	</div>
	<div class="section art-content">
	      <div class="inner">
	          <h1>{{d.title}}</h1>
	          <h2><span class="one">{{d.qkname}}[{{d.type}}]</span><span class="two">{{d.qkwirtetime}}</span></h2>
	      </div>
	</div>
	<div class="section art-p">
	          {{d.wzinfo}}
	</div>
	<div class="section art-footer">
	     <div class="inner">
                 <img class="c_img" alt="" src="/upload/<%=SystemCons.getSysimgs().getSydb_logo()%>">	
                 <p><%=SystemCons.sysparams.getSydb_bqwz()%></p>
	     </div>
	</div>
</div>

</script>  
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/layui/lay/dest/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/js/modules/layerValidation.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>  
    <script type="text/javascript">
    var layer = layui.layer,form = layui.form(),$=layui.jquery,laydate = layui.laydate,element=layui.element(),laypage=layui.laypage,layedit = layui.layedit,laytpl = layui.laytpl;
    var getTpl = artic_view_phone_temp.innerHTML;//预览模板  
    $(function(){
		   var article_edit_form=$("#article_edit_form");
		   
		   
		   /*5、监听select的值*/
		     var qkChinaName;//期刊名
		     var qknumber;//期刊编号
		     var bkChinaName;//版块名
		    form.on('select(qktype)', function(data){
		    	  qkChinaName= article_edit_form.find("input[name='qkChinaName']");
		    	  qknumber= article_edit_form.find("input[name='qknumber']");
		    	  qkChinaName.val($(data.elem).find("option[value='"+data.value+"']").attr("data-name"));
		    	  qknumber.val($(data.elem).find("option[value='"+data.value+"']").attr("data-number"));//期刊编号
		    	 });  
		    form.on('select(bktype)', function(data){
		    	bkChinaName= article_edit_form.find("input[name='bkChinaName']");
		    	bkChinaName.val($(data.elem).find("option[value='"+data.value+"']").text());
		  	 }); 
		   
		   /*1、富文本上传图片*/
		      layedit.set({
	    		  uploadImage: {
	    		     url: '${pageContext.request.contextPath}/article/uploadImg.do' //接口url
	    		    ,type: 'post', //默认post
	    		    success:function(data){
	    		    	// alert(data);
	    		    },error:function(e){
	    		    	//alert(e);
	    		    }
	    		  },
	    		    height: 350
	    		});
		   editUedit = layedit.build('article_edit_editor');
		   
		   	/*2文章主图*/
	    	layui.upload({
	    		  url: '${pageContext.request.contextPath}/article/uploadImg.do',
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
	    		    		     article_edit_form.find("input[name='wzimage']").val(res.data.src).attr("data-code",res.code);
	 	    		    	   /*  $("#img-upload-info").text(res.data.title); */
	    		    		     $(".img-yulan-wape img").attr("src",res.data.src); 
	    		    		 }, 1000);
	    		       }else{
	    		    	   setTimeout(function(){
	    		    		     layer.msg("上传失败！");
	    		    		     article_edit_form.find("input[name='wzimage']").val("").attr("data-code",1);/*失败*/
	    		    		 }, 1000);
	    		       }
	    		  }
	    		});
		   	
		   	/*3、修改预览*/
	    	   form.on('submit(article_edit_view)', function(data){
	    		 var writetimestr=  article_edit_form.find("input[name='writetimestr']").val();
	    		   var datatemp = { qknum:"" ,qkname:"",qktime:"",title:"",  type:"",wzimage:"",wzinfo:"",qkwirtetime:"",releasetime:""};
		   		   datatemp.qktime=getNowFormatDate(1);//获取当前时间2016-1-01-06
		   		  datatemp.qkwirtetime=writetimestr;
		   		   datatemp.qknum=article_edit_form.find("input[name='qknumber']").val();//期刊号
		   		   datatemp.qkname=article_edit_form.find("input[name='qkChinaName']").val();//期刊名
		   		   datatemp.title=data.field.title;//标题 
		   		   datatemp.type=article_edit_form.find("input[name='bkChinaName']").val();//版块
		   		   datatemp.wzinfo=layedit.getContent(editUedit);//文章内容
    	      laytpl(getTpl).render(datatemp, function(html){
    		        view.innerHTML = html;
    		   });
    			   layer.open({
 	        		  type: 1,
 	        		  scrollbar: false,
 	        		  title: false, //不显示标题
 	        		  offset: '10px',
 	        		  area:['390px', '550px'],
 	        		  content:$('#artic_view_phone').html(), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
 	        		  cancel: function(){
 	        			    
 	        		  }
 	        		});
	    		   
	    		   return false;
	    	   })
	    	
		   	
		   /*4、保存  */
		    form.on('submit(article_edit_save)', function(data){
		    	 var textarea=layedit.getContent(editUedit);
		    		var imgcode= article_edit_form.find("input[name='wzimage']").attr("data-code");
		    		if(imgcode==null||imgcode==""||imgcode=='1'){
		    			 layer.msg('请上传文章主图', {icon: 5});
		    			 return false;
		    		 } 
		    		article_edit_form.find("textarea[name='wzinfo']").val(textarea);
		    		editsaveFun(article_edit_form);
		    	return false;
		    });
	   }); 
	   
	  function editsaveFun(article_edit_form){
			article_edit_form.ajaxSubmit({
       	     type:"post",
       	     dataType:"json",
  	         url: '${pageContext.request.contextPath}/article/updateArticle.do',
  	         success:function(data){
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
  	        }
  	}); 
		  
	  }
	  
	//js获取当前日期时间“yyyy-MM-dd HH:MM:SS”
	    function getNowFormatDate(type) {
	    	var date = new Date();
	        var seperator1 = "-";
	        var seperator2 = ":";
	        var month = date.getMonth() + 1;
	        var strDate = date.getDate();
	        if (month >= 1 && month <= 9) {
	            month = "0" + month;
	        }
	        if (strDate >= 0 && strDate <= 9) {
	            strDate = "0" + strDate;
	        }
	        var currentdate;
	        if(type==1){
	        	 currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
	        }else if(type==0){
	         currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
	                + " " + date.getHours() + seperator2 + date.getMinutes()
	                + seperator2 + date.getSeconds();
	        }
	        return currentdate;
	    }
	</script>    
  </body>
</html>
