<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 	<title>期刊管理</title>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
  </head>
    
  <body>
  <div class="layui-tab-item layui-show">
		      <!--tab -->
		      <div id="layri-tabqk" class="layui-tab" lay-filter="periodiclal_tab">
				  <ul class="layui-tab-title">
				    <li lay-id="1-1" class="layui-this"><i class="layui-icon">&#xe62d;</i>期刊列表</li>
				    <li lay-id="2-2" ><i class="layui-icon">&#xe61f;</i>增加新期刊</li>
				    <!-- <li lay-id="3-3" >期刊内容列表</li> -->
				  </ul>
				  <div class="layui-tab-content" style="height: 100px;">
				    <div class="layui-tab-item layui-show"><!-- layui-tab-item 1 -->
                         <form id="qkform" class="layui-form layui-form-pane search-form">
						     <div class="layui-form-item">
						       <label class="layui-form-label">期刊号</label>
						       <div class="layui-input-inline">
						         <input type="text" name="number" value="" lay-verify="" placeholder="请输入期刊号搜索" maxlength="8" autocomplete="off" class="layui-input">
						       </div>
						       <label class="layui-form-label">期刊名称</label>
						       <div class="layui-input-inline">
						         <input type="text" name="name" value="" lay-verify="" placeholder="请输入期刊名称搜索" autocomplete="off" class="layui-input">
						       </div>
						       <button class="layui-btn" lay-submit="" lay-filter="qkSearchBtn"><i class="layui-icon">&#xe615;</i>搜索</button>
						       <button  name="resetBtn" class="layui-btn layui-btn-primary" onclick="javascript:return false;"><i class="layui-icon">&#xe639;</i>重置</button>
						        <button name="qkreload" class="layui-btn"  onclick="javascript:return false;" ><i class="layui-icon">&#x1002;</i>刷新</button>
						     </div>
						   </form>
						   <div id="pagecontent"></div><!-- 内容 -->
						   <div id="layer-Pages"></div><!--导航条 -->
                    </div><!-- layui-tab-item 1 end -->
				    <div class="layui-tab-item"><!-- layui-tab-item 2 -->
				              <!--2、添加期刊 通过js引入-->
                     </div><!-- layui-tab-item 2 end -->
			
				  </div>
				</div> <!--tab end  -->
      </div>
  
  
  <!--5添加期刊内容模板 -->
<%--   <div id="qk_detial_temp" style="display: none;">
			   <c:import url="./articleAddPage.jsp"></c:import> 
  </div> --%>
   <%@include file="../common/style.jsp" %>
   	<script src="${pageContext.request.contextPath}/js/layui/lay/dest/layui.all.js"></script>   
   	 <script src="${pageContext.request.contextPath}/js/modules/layerValidation.js"></script>
   	<script type="text/javascript">
   	var layer = layui.layer,form = layui.form(),$=layui.jquery,laydate = layui.laydate,element=layui.element(),laypage=layui.laypage,layedit = layui.layedit;
   	var indexUedit;//layerUedit
   	var qkform=$("#qkform");
    var lock = true; // 锁住表单    1.这里定义一把锁
   	$(function(){
   		
   		/*10、刷新按钮 */
   		 	qkform.find("button[name='qkreload']").click(function(){
    		  window.location.reload();
    	   });
   		/* 9、 重置按钮*/
   		qkform.find("button[name='resetBtn']").click(function(){
   			 qkform.find("input[name='number']").val("");
   			 qkform.find("input[name='name']").val("");
   			
   		});
   	   /*1、搜索条件*/
	   	 form.on('submit(qkSearchBtn)', function(data){
	   	     var reg = /^\d+$/;
	     	var number= qkform.find("input[name='number']").val();
	    	if(number==null||number==''){
	    	   getPagesFun(1,5);
	    	 }
	    	 else if(!reg.test(number)){
	   		   layer.msg("期刊号只能为数字！");
	   		   return false;
	    	 }else{
	    		  getPagesFun(1,5);
	    	 }
	   		   
	   	  	    return false;
	 	  });
   		
   	   /*2、添加期刊信息*/
	   	 form.on('submit(add_submit)', function(data){
	   		 
	   	  if(!lock){    // 2.判断该锁是否打开，如果是关闭的，则直接返回
			     return false;
			  }
		    lock = false  //3.进来后，立马把锁锁住
		    var indesave = layer.msg('保存中', {
		    	    icon: 16
		    	  ,shade: 0.01
		    	});
	   		 
	   		 var isnew;
	   		 if(data.field.isnew!="Y"){
	   			isnew="N";
	   		 }else{
	   			isnew="Y";
	   		 }
	       	$.post("${pageContext.request.contextPath}/peradmin/addPeriod.do",{qknum:data.field.qknum,qkname:data.field.qkname,isnew:isnew},function(data){
	       		  var obj=data[0];
	       		  if(obj.code=='100'){
	           		  layer.alert('增加期刊成功!',{title:"温馨提示",closeBtn:false,icon:6},function(){
	           			  $(data.form).find("input").val("");
	           			  layer.closeAll();
	           			  window.location.reload();
	          		  });
	           	  }else if(obj.code=='103'){//nologin
	           		  layer.alert('请先登录再添加！',{title:"温馨提示",closeBtn:false,icon:5},function(){
	             			   window.location.href="${pageContext.request.contextPath}/user/loginParent.do";
	             		  });
	           	  }else{
	           		  layer.alert(obj.errorMsg,{title:"温馨提示",closeBtn:false,icon:5},function(index){
	          			       layer.close(index);
	          			       lock = true;// 4.1  业务逻辑执行失败了，打开锁
	          		   });
	           	  }
	       		 layer.close(indesave);
	       	  }); 
	   	  	    return false;
	 	  });
	  	 
   	   /*3、监听tab*/
	   	element.on('tab(periodiclal_tab)', function(data){
	   		var  currItem= $("#layri-tabqk .layui-tab-content .layui-tab-item");
	   	
	   		console.log(this); //当前Tab标题所在的原始DOM元素
		   	  console.log(data.index); //得到当前Tab的所在下标
		   	  console.log(data.elem); //得到当前的Tab大容器
		   if(data.index==1){//添加期刊引入页面	  
		    	$(currItem[data.index]).load("${pageContext.request.contextPath}/peradmin/toAddPeriod.do",function(data){
		    		form.render();
		    	});
		   }
	   	});

	    //4、tab触发事件
	    var i=4;//动态添加tab期刊详细内容的tab
	    var title="";
	    var id;
	   
     /*初始化分页 第一次加载期刊列表*/
     getPagesFun(1,5);
     /* 5、分页条件查询返回的数据列表  */
	function getPagesFun(currPage,pageNums){    
	 	  var name=$("#qkform input[name='name']").val();//期刊名称
	 	  var number=$("#qkform input[name='number']").val();//期刊号
		  $("#pagecontent").load("${pageContext.request.contextPath}/peradmin/periodsList.do",{currPage:currPage,pageNums:pageNums,queryString:name,number:number},function(data){
				/*请求成功 bind添加子项事件*/  
		     var total=$("#ptotal").val();//总条数	
		     form.render();
			 	laypage({
			        cont: 'layer-Pages'
			       ,pages: Math.ceil(total/pageNums) //得到总页数
			       ,skip: true,
			       curr: function(){ //通过url获取当前页，也可以同上（pages）方式获取
			    	   var currPage=$("#currPage").val();
			    	    return currPage ? currPage : 1;
			    	  }(),
			       jump: function(obj,first){
			         /*  document.getElementById('biuuu_city_list').innerHTML = render(data, obj.curr); */
			         if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
			        	 getPagesFun(obj.curr,pageNums);
			           }
			       }
			     });
		      
			 	/*6、预览期刊*/
			 	$(".qk_preview_btn").click(function(){
			 		var qknum=$(this).attr("data-value");
				 	layer.open({
						    type: 2,
							scrollbar: false,
							title: false, //不显示标题
							offset: '10px',
							area:['380px', '550px'], 
				  			content: '${pageContext.request.contextPath}/period/qkList.do?qknum='+qknum
				 	}); 
			 	});
			 	
		         /*7、修改期刊页面*/
		         $(".qk_edit_btn").click(function(){
		        	      var othis=$(this);
		        	      var id=othis.attr("data-id");
		        	      var name=othis.attr("data-name");
		        	      var value=othis.attr("data-value");
		        	      var isnew=othis.attr("data-isnew");
		        	      var time=othis.attr("data-time");
		        	      layer.open({
		            		  type: 1,
		            		  title: "修改期刊",
		            		   area: '700px',
		            		  shadeClose: true,
		            		  content: $('#p_edit_dialog'),
		            		  success: function(layero, index){
		            			  var pe=$("#qk_edit_Form");
		            			   pe.find("input[name='id']").val(id);
		            			   pe.find("input[name='qknum']").val(value);
		            			   pe.find("input[name='qkname']").val(name);
		            			   pe.find("input[name='releasetime']").val(time);
		            			   pe.find("input[name='isnew']").val(isnew);
		            			   var ischecked=pe.find("input[name='isnew']");
		            			   if(isnew=="Y"){
		            				     ischecked.attr("checked",true);
		            				     ischecked.next("div").addClass("layui-form-onswitch").find("em").text("是");
		            		   		 }else{
		            		   			 ischecked.attr("checked",false);
		            		   			 ischecked.next("div").removeClass("layui-form-onswitch").find("em").text("否");
		            		   		 }
		            			  
		            			  }
		            		});
		          });
		         
		         /*8、发布期刊页面*/
		         $(".qk_release_btn").click(function(){
		        	    var othis=$(this);
		        	    var id=othis.attr("data-id");
		        	    layer.alert('发布期刊后就不能进行修改，确认要发布该期刊吗?', {title:"温馨提示",icon: 3},function(){
		        	    	$.post("${pageContext.request.contextPath}/peradmin/releasePeriod.do",{id:id},function(data){
				  	       		  var obj=data[0];
				  	       		  if(obj.code=='100'){
				  	           		  layer.alert('发布期刊成功!',{title:"温馨提示",closeBtn:false,icon:6},function(){
				  	           			  $(data.form).find("input").val("");
				  	           			  layer.closeAll();
				  	           			  window.location.reload();
				  	          		  });
				  	           	  }else if(obj.code=='103'){//nologin
				  	           		  layer.alert('请先登录再添加！',{title:"温馨提示",closeBtn:false,icon:5},function(){
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
		         /*9、取消发布 cannel_isrelease_btn */
		           $(".cannel_isrelease_btn").click(function(){
		        	    var othis=$(this);
		        	    var id=othis.attr("data-id");
		        	    layer.alert('确认要取消已经发布的期刊吗?', {title:"温馨提示",icon: 3},function(){
		        	    	$.post("${pageContext.request.contextPath}/peradmin/cancelReleasePeriod.do",{id:id},function(data){
				  	       		  var obj=data[0];
				  	       		  if(obj.code=='100'){
				  	           		  layer.alert('取消成功!',{title:"温馨提示",closeBtn:false,icon:6},function(){
				  	           			  $(data.form).find("input").val("");
				  	           			  layer.closeAll();
				  	           			  window.location.reload();
				  	          		  });
				  	           	  }else if(obj.code=='103'){//nologin
				  	           		  layer.alert('请先登录！',{title:"温馨提示",closeBtn:false,icon:5},function(){
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
		         
		         editBtninfoFun();//
		         
		         /*设为最新值的改变*/
		         form.on('switch(isnew_checkbox)', function(data){
		        	  console.log(data.elem); //得到checkbox原始DOM对象
		        	  console.log(data.elem.checked); //开关是否开启，true或者false
		        	 if(data.elem.checked){
		        		 $(data.elem).val("Y");
		        	 }else{
		        		 $(data.elem).val("N");
		        	 }
		        	  console.log(data.value); //开关value值，也可以通过data.elem.value得到
		        	  console.log(data.othis); //得到美化后的DOM对象
		        	  console.log("后"+data.elem); //得到checkbox原始DOM对象
		        	}); 
		         
		   	});
	}
	 /* 8、编辑期刊修改提交按钮  */
	 function editBtninfoFun(){
         form.on('submit(qk_edit_submit)', function(data){
        	 var isnew;
	   		 if(data.field.isnew!="Y"){
	   			isnew="N";
	   		 }else{
	   			isnew="Y";
	   		 }
        	 
        	 $.post("${pageContext.request.contextPath}/peradmin/addPeriod.do",{id:data.field.id,qknum:data.field.qknum,qkname:data.field.qkname,isnew:isnew,releasetimeString:data.field.releasetime},function(data){
	       		  var obj=data[0];
	       		  if(obj.code=='100'){
	           		  layer.alert('修改期刊成功!',{title:"温馨提示",closeBtn:false,icon:6},function(){
	           			  $(data.form).find("input").val("");
	           			  layer.closeAll();
	           			  window.location.reload();
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
        	 return false;
         });
	 }

  
  /*7、期刊详细内容保存按钮*/
    	 form.on('submit(qk_c_add_submit)', function(data){
    		 var wzinfoEdit=layedit.getContent(indexUedit);
        	 $.post("${pageContext.request.contextPath}/article/addArticle.do",{qkid:data.field.qkid,title:data.field.title,wzimage:data.field.wzimage,wzinfo:wzinfoEdit,type:data.field.type},function(data){
	       		  var obj=data[0];
	       		  if(obj.code=='100'){
	           		  layer.alert('修改期刊成功!',{title:"温馨提示",closeBtn:false,icon:6},function(){
	           			  $(data.form).find("input").val("");
	           			  layer.closeAll();
	           			  window.location.reload();
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
	   		  // layer.msg("12344");
	   	  	    return false;
	 	  });
   	});
   	
   	</script>   
  </body>
  
</html>
