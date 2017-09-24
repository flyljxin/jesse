<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
 
   <!--保存预览模板-->
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
   .art-header .rigth .first{
       background: url(/images/h5/qk_s.png) center no-repeat;
       background-size: 100% 100%;
       width: 14px; 
   }
   .art-header .rigth .two{
       background: #ffbb00;
   }
   .section>.inner{
     padding: 6px;
   }
   .art-content h1{
          font-size: 18px;
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
text-align: justify;
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
   
</style>
  </head>
  <body>
  <div class="layui-tab-item layui-show" >
     <div id="layri-tabqk" class="layui-tab" lay-filter="periodiclal_tab">
				  <ul class="layui-tab-title">
				    <li lay-id="1-1" class="layui-this"><i class="layui-icon">&#xe62d;</i>期刊内容列表</li>
				    <li lay-id="2-2" ><i class="layui-icon">&#xe61f;</i>添加期刊内容</li>
				  </ul>
				  <div class="layui-tab-content" >
				    <div class="layui-tab-item layui-show"><!-- layui-tab-item 1 -->
                          <%@include file="./articleList.jsp" %>
                    </div>
				    <div class="layui-tab-item"><!-- layui-tab-item 2 -->
				           <%@include file="./articleAdd.jsp" %>
                     </div>
				  </div>
				</div> 
      </div>
       <%@include file="../common/style.jsp" %>
       <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
      <script src="${pageContext.request.contextPath}/js/layui/lay/dest/layui.all.js"></script>
      <script src="${pageContext.request.contextPath}/js/modules/layerValidation.js"></script>
      <script src="${pageContext.request.contextPath}/js/jquery.form.js"></script> 
     <script type="text/javascript">
    var layer = layui.layer,form = layui.form(),$=layui.jquery,laydate = layui.laydate,element=layui.element(),laypage=layui.laypage,layedit = layui.layedit,laytpl = layui.laytpl;
    var article_form=$("#article_form");
    var article_add_form=$("#article_add_form");//添加信息变量
    var getTpl = artic_view_phone_temp.innerHTML;//预览模板
    var lock = true; // 锁住表单    1.这里定义一把锁
    $(function(){
    	/* 15、 重置按钮*/
   		article_form.find("button[name='resetBtn']").click(function(){
   			article_form.find("input[name='qknum']").val("");
   			article_form.find("input[name='title']").val("");
   			article_form.find("select").next("div").children("div").children("input").val("");
   			article_form.find("select option:selected").attr("selected",false);
   		});
    	/*12、搜索按钮*/
    	 form.on('submit(articleSearchBtn)',function(data){
    		article_form.find("input[name='currPage']").val("1");
     		article_form.find("input[name='pageNums']").val("5");
     		article_form.submit();
    		 return false;
    	 });
    	
    	/*11、添加期刊内容--重置按钮  */
	   article_add_form.find("button[name='article_return_clear']").on('click',function(){
		     article_add_form.clearForm();
		     article_add_form.find("input").val("");
		     article_add_form.find(".img-yulan-wape img").attr("src","");
		     $($("iframe")[0]).contents().find("body").text("");
		     
	   })
    	/*10-4、刷新页面*/
    	article_form.find("button[name='qkreload']").click(function(){
    		article_form.find("input").val("");
    		article_form.find("select").val("");
    		article_form.find("input[name='currPage']").val("1");
    		article_form.find("input[name='pageNums']").val("5");
    		article_form.submit();
    		//window.location.reload();
    	});
    	
    	/*10-3、批量删除按钮事件*/
    	article_form.find("button[name='qkAllDel']").click(function(){
    		  var arrys=$(".layui-table input[name='qkCheckbox']");
    		  var checkedNum = $(".layui-table input[name='qkCheckbox']:checked").length; 
    		  var ids="";
    		  if(checkedNum==0){
    			  layer.msg('未选中数据!', {icon: 5,anim:6,offset: '100px'});
    		  }else{
    			  for(var i=0;i<arrys.length;i++){
         			   if($(arrys[i]).prop("checked")){
         				   ids+=$(arrys[i]).attr("data-id")+",";
         			   }
     		       }
    			  layer.confirm('确认要删除吗？', {title:"温馨提示",offset: '100px',
    				    btn: ['确认','取消'] //按钮
    				}, function(){
    				       $.post("${pageContext.request.contextPath}/article/delArticle.do",{id:ids},function(data){
    				    	   var obj=data[0];
					    		  if(obj.code=='100'){
					        		  layer.alert('删除成功!',{title:"温馨提示",closeBtn:false,icon:6,offset: '100px'},function(){
					        			  //$(data.form).find("input").val("");
					        			  layer.closeAll();
					        			  window.location.reload();
					       		  });
					        	  }else if(obj.code=='103'){//nologin
					        		  layer.alert('请先登录再删除！',{title:"温馨提示",closeBtn:false,icon:5,offset: '100px'},function(){
					          			   window.location.href="${pageContext.request.contextPath}/user/loginParent.do";
					          		  });
					        	  }else{
					        		  layer.alert(obj.errorMsg,{title:"温馨提示",closeBtn:false,icon:5,offset: '100px'},function(index){
					       			      layer.close(index);
					       		   });
					        	  }
    				       }); 
    				}, function(){
    				     
    				});
    			  
    			  
    			 
    		  }
    		 
    	});
    	/*10-2、批量删除全选按钮*/
    	form.on('checkbox(allcheck)', function(data){
				  console.log(data.elem); //得到checkbox原始DOM对象
				  console.log(data.elem.checked); //开关是否开启，true或者false
				  console.log(data.value); //开关value值，也可以通过data.elem.value得到
				  console.log(data.othis); //得到美化后的DOM对象
				   var arryc=$(".layui-table input[name='qkCheckbox']");
				   if(data.elem.checked){
					   arryc.prop("checked",true);
					   $(".layui-table input[name='qkCheckbox']").siblings("div").addClass("layui-form-checked");
				   }else{
					   arryc.prop("checked",false);
					   $(".layui-table input[name='qkCheckbox']").siblings("div").removeClass("layui-form-checked");
				   }
				  
				  
		}); 
    	/*10-1批量删除单选*/
    	  	form.on('checkbox(onelyCheck)', function(data){
				  console.log(data.elem); //得到checkbox原始DOM对象
				  console.log(data.elem.checked); //开关是否开启，true或者false
				  console.log(data.value); //开关value值，也可以通过data.elem.value得到
				  console.log(data.othis); //得到美化后的DOM对象
				  var arryc=$(".layui-table input[name='allcheck']");//全选按钮
				  
				  var  arrys=$(this).parents("tr").siblings().find("input[name='qkCheckbox']");//其它相邻checkbox标签
				  var  arrysLengs=arrys.length;//相邻总数量
				  var  checkedNum=0;//选中的数量
				  var  nocheckedNum=arrysLengs;
				  if(data.elem.checked){
					   $.each(arrys, function(i, n){
						     if($(n).prop("checked")){
						    	 checkedNum++;
						     }
						 });
					    if(checkedNum==arrysLengs){
					    	  arryc.prop("checked",true).siblings("div").addClass("layui-form-checked");
							   return ;
					    }
				   }else{
					   $.each(arrys, function(i, n){
						     if($(n).prop("checked")){
						    	 nocheckedNum--;
						     }
						 });
					    if(nocheckedNum<=arrysLengs){
					    	   arryc.prop("checked",false).siblings("div").removeClass("layui-form-checked");
							   return ;
					    }
				   } 
				  
				  
		}); 
    
    /*监听select的值*/
     var qkChinaName;//期刊名
     var qknumber;//期刊编号
     var bkChinaName;//版块名
    form.on('select(qktype)', function(data){
    	  qkChinaName= article_add_form.find("input[name='qkChinaName']");
    	  qknumber= article_add_form.find("input[name='qknum']");
    	  qkChinaName.val($(data.elem).find("option[value='"+data.value+"']").attr("data-name"));//期刊名
    	  qknumber.val($(data.elem).find("option[value='"+data.value+"']").attr("data-number"));//期刊编号
    	 });  
    form.on('select(bktype)', function(data){
    	bkChinaName= article_add_form.find("input[name='bkChinaName']");
    	bkChinaName.val($(data.elem).find("option[value='"+data.value+"']").text());
  	 });  
    	  /*5、富文本*/
        layedit.set({
    		  uploadImage: {
    		     url: '${pageContext.request.contextPath}/article/uploadImg.do' //接口url
    		    ,type: 'post', //默认post
    		    success:function(data){
    		    	 alert(data);
    		    },error:function(e){
    		    	alert(e);
    		    }
    		  },
    		  height:320
    		});
    	var   indexUedit = layedit.build('article_add_editor');
    	   layedit.sync(indexUedit);
    	  
    	/*12文章主图*/
    	layui.upload({
    		  url: '${pageContext.request.contextPath}/article/uploadImg.do'
    		  ,success: function(res){
    		       if(res.code==0){
    		    	   layer.msg("上传成功！");
    		    	   $("#article_add_form input[name='wzimage']").val(res.data.src);
    		    	   $("#article_add_form input[name='wzimage']").attr("data-code",res.code);
    		    	   $(".img-yulan-wape img").attr("src",res.data.src);  
    		       }else{
    		    	   $("#article_add_form input[name='wzimage']").val("");
    		    	   $("#article_add_form input[name='wzimage']").attr("data-code",1);/*失败*/
    		       }
    		  }
    		}); 
    	  //13监听保存提交
    	  form.on('submit(article_return_save)', function(data){
    		
    		var textarea=layedit.getContent(indexUedit);
    		var imgcode= $("#article_add_form input[name='wzimage']").attr("data-code");
    		
    		 if(!vadatiseFun(data.field.title)) {
    			  return false;
    			 } 
    		 
    		 if(imgcode==null||imgcode==""){
    			 layer.msg('请上传文章主图', {icon: 5});
    			 return false;
    		 } 
    		 if(textarea==null||textarea==""){
    			 layer.msg('文章内容为空!', {icon: 5});
    			 return false;
    		 }else{
    		    $("#article_add_form textarea[name='wzinfo']").val(textarea);
    		    if(!lock){    // 2.判断该锁是否打开，如果是关闭的，则直接返回
   			      return false;
   			    }
   		       lock = false  //3.进来后，立马把锁锁住
   		       var indesave = layer.msg('保存中', {
   		    	    icon: 16
   		    	  ,shade: 0.01
   		    	});
    		 }  
    		 
    		 
    		 
		    	  	$("#article_add_form").ajaxSubmit({
		        	     type:"post",
		        	     dataType:"json",
		   	         url: '${pageContext.request.contextPath}/article/addArticle.do',
		   	         success:function(data){
		   	        	  var obj=data[0];
		   	        	  if(obj.code==100){//success
		   	        		  layer.alert('保存成功!',{title:"温馨提示",closeBtn:false,icon:6},function(){
		   	        			  layer.closeAll();
		   	        			   location.reload();

		   	        		  });
		   	        	  }else if(obj.code=='103'){//nologin
		   	        		  layer.alert('请先登录再修改！',{title:"温馨提示",closeBtn:false,icon:5},function(){
		   	          			   window.location.href="${pageContext.request.contextPath}/user/loginParent.do";
		   	          		  });
		   	        	  }else{
		   	        		  layer.alert(obj.errorMsg,{title:"温馨提示",closeBtn:false,icon:5},function(index){
		   	        			  layer.close(indesave);
		   	       			      layer.close(index);
		   	       		      });
		   	        	  }
		   	        }
		   	}); 
    	    
    	    return false;
    	  });
    	  
    	  /* 14保存预览 */
    	   form.on('submit(article_return_yulan)', function(data){
    		  var datatemp = { qknum:"" ,qkname:"",qktime:"",title:"",  type:"",wzimage:"",wzinfo:""};
	    		   datatemp.qktime=getNowFormatDate(1);//获取当前时间2016-1-01-06
	    		   datatemp.qktime1=getNowFormatDate(0);//获取当前时间2016-1-01-06
		   		   datatemp.qknum=article_add_form.find("input[name='qknum']").val();//期刊号
		   		   datatemp.qkname=article_add_form.find("input[name='qkChinaName']").val();//期刊名
		   		   datatemp.title=data.field.title;//标题 
		   		   datatemp.type=article_add_form.find("input[name='bkChinaName']").val();//版块
		   		   datatemp.wzinfo=layedit.getContent(indexUedit);//文章内容
		   		   
		   		   if(!vadatiseFun(datatemp.title)) return false;
		   		   
    	      laytpl(getTpl).render(datatemp, function(html){
    		        view.innerHTML = html;
    		   });
    			   layer.open({
 	        		  type: 1,
 	        		  scrollbar: false,
 	        		  title: false, //不显示标题
 	        		  offset: '10px',
 	        		  area:['420px', '550px'],
 	        		  content:$('#artic_view_phone').html(), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
 	        		  cancel: function(){
 	        			    
 	        		  }
 	        		});
    		   return false;
    	   });
    	  
    	
    	
			 /* 1、分页 */
			  var total=${total};
			  var pageNums=${pageNums};
		        laypage({
			        cont: 'layer-Pages'
			       ,pages: Math.ceil(total/pageNums) //得到总页数
			       ,skip: true,
			       curr: function(){ //通过url获取当前页，也可以同上（pages）方式获取
			    	   var currPage=${currPage};
			    	    return currPage ? currPage : 1;
			    	  }(),
			       jump: function(obj,first){
			         /*  document.getElementById('biuuu_city_list').innerHTML = render(data, obj.curr); */
			         if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
			        	 
			        	 $("#currPage").val(obj.curr);
			        	 $("#article_form").submit();
			           }
			       }
			     });
		        
		        /*2、查看  */
		        $(".article_look_btn").click(function(){
		        	var id=$(this).attr("data-id");
		        	//弹出即全屏
		        	layer.open({
		        		  type: 2,
		        		  scrollbar: false,
		        		  title: false, //不显示标题
		        		  offset: '10px',
		        		  skin: 'layui-layer-success', //样式类名
		        		  area:['500px', '550px'],
		        		  content:'${pageContext.request.contextPath}/period/articleInfo.do?id='+id, //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
		        		  cancel: function(){
		        		  }
		        		});
		        });
		        
		        /*3、编辑按钮  */
		           $(".article_edit_btn").click(function(){
		        	var id=$(this).attr("data-id");
		        	//弹出即全屏
		        	layer.open({
		        		  type: 2,
		        		  title: false, //不显示标题
		        		  offset: ['10px', '10px'],
		        		  area:['1100px', '590px'],
		        		  content:'${pageContext.request.contextPath}/article/editArticle.do?id='+id, //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
		        		  cancel: function(){
		        		  }
		        		});
		        });
		        
		        
		        /*4、删除按钮  */
		        $(".article_del_btn").click(function(){
		        	 var id = $(this).attr("data-id");
		        	 
		        	layer.alert('确认要删除期刊内容吗?', {title:"温馨提示",icon: 3,offset: '200px'},function(){
		        		
					    	$.post("${pageContext.request.contextPath}/article/delArticle.do",{id:id},function(data){
					    		  var obj=data[0];
					    		  if(obj.code=='100'){
					        		  layer.alert('删除成功!',{title:"温馨提示",closeBtn:false,icon:6,offset: '100px'},function(){
					        			  //$(data.form).find("input").val("");
					        			  layer.closeAll();
					        			  window.location.reload();
					       		  });
					        	  }else if(obj.code=='103'){//nologin
					        		  layer.alert('请先登录再删除！',{title:"温馨提示",closeBtn:false,icon:5,offset: '100px'},function(){
					          			   window.location.href="${pageContext.request.contextPath}/user/loginParent.do";
					          		  });
					        	  }else{
					        		  layer.alert(obj.errorMsg,{title:"温馨提示",closeBtn:false,icon:5,offset: '100px'},function(index){
					       			      layer.close(index);
					       		   });
					        	  }
					    		
					    	  }); 
		        		});
		        	
		        });
	   }); 
    
  //js获取当前日期时间
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
  
  
    //14-1 验证 非空
	   function vadatiseFun(title){
		   var  qknumber= article_add_form.find("input[name='qknum']");
		   var qktype= article_add_form.find("input[name='bkChinaName']");
		   var qktitle=article_add_form.find("input[name='title']");
		   if(!qknumber.val().length>0){
		  	   layer.msg('所属期刊不能为空!', {anim:6,icon: 5});
		  	   qknumber.focus();
		  	   qknumber.siblings("select").addClass("layui-form-danger");
		  	   return false;
	    	}else if(title==null||title==""){
	    	   layer.msg('文章标题不能为空!', {anim:6,icon: 5});
	    	   qktitle.focus().addClass("layui-form-danger");
	    	   return false;
	    	}else if(!qktype.val().length>0){
    		  	    layer.msg('版块不能为空!', {anim:6,icon: 5});
    		    	qktype.focus();
    		    	qktype.siblings("select").addClass("layui-form-danger");
    		  	   return false;
    	    	}
		   return true;
	  }
	</script>    

  </body>
  