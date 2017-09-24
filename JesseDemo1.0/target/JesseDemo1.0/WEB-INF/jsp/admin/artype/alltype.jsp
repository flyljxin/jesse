<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>版块类型管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
	
  </head>
  
  <body>
<!-- <div class="layui-tab layui-tab-brief main-tab-container"> -->
   <!--  <div class="layui-tab-content"> -->
      <div class="layui-tab-item layui-show">
		      <!--tab -->
		      <div class="layui-tab" lay-filter="docDemoTabBrief">
				  <ul class="layui-tab-title">
				    <li class="layui-this">版块类型管理</li>
				    <!-- <li>增加版块类型</li> -->
				  </ul>
				  <div class="layui-tab-content" style="height: 100px;">
				    <div class="layui-tab-item layui-show"><!-- layui-tab-item 1 -->
                         <form class="layui-form layui-form-pane search-form">
						<!--      <div class="layui-form-item">
						       <label class="layui-form-label">类型名称</label>
						       <div class="layui-input-inline">
						         <input type="text" name="search[title]" value="" lay-verify="" placeholder="请输入标题搜索" autocomplete="off" class="layui-input">
						       </div>
						       <button class="layui-btn" lay-submit="" lay-filter="">搜索</button>
						     </div> -->
						   </form>
						   
						   <table class="layui-table" lay-skin="line" lay-allowClose="true">
								  <colgroup>
								    <col >
								    <col >
								    <col>
								  </colgroup>
								  <thead>
								    <tr>
								      <th>类型代码</th>
								      <th>类型名称</th>
								      <th>操作</th>
								    </tr> 
								  </thead>
								  <tbody>
								     <c:if test="${!empty artype }">  
						                    <c:forEach items="${artype}" var="type">  
						                        <tr id="tr_${user.code}">  
						                            <td >${type.code}</td>  
						                            <td >${type.type}</td>  
						                            <td >  
						                                <%-- <a href="javascript:del('${user.code }')">修改</a> --%>
															<div class="layui-btn-group">
															  <!-- <button class="do-action layui-btn layui-btn-small"  >添加</button> -->
																<button class="bkEditBtn do-action layui-btn layui-btn-small" data-code="${type.code}" data-type="${type.type}" >编辑</button> 
																<!-- <button class="do-action layui-btn layui-btn-small">删除</button>-->															</div>
										        </td>  
						                        </tr>               
						                    </c:forEach>  
						                </c:if>  
								  </tbody>
								</table>     
                    </div><!-- layui-tab-item 1 end -->
				    <div class="layui-tab-item"><!-- layui-tab-item 2 -->
                               <form  class="layui-form" action="" method="post">
										<div class="layui-form-item">
											<label class="layui-form-label">类型名称</label>
											<div class="layui-input-inline">
												<input type="text" name="name" value="" lay-verify="required" class="layui-input">
											</div>
										</div>
										<div class="layui-form-item">
											<label class="layui-form-label">类型代码</label>
											<div class="layui-input-inline">
												<input type="text" name="permission" value="" class="layui-input">
											</div>
											<div class="layui-form-mid layui-word-aux">格式为：模块:功能:权限（例如：sys:user:view）</div>
										</div>
										<div class="layui-form-item">
											<div class="layui-input-block">
												<button class="layui-btn" data-listurl="/a/sys/menu/" lay-submit="" lay-filter="bkAddSubmit">确认提交</button>
											</div>
										</div>
									</form>  
                     </div><!-- layui-tab-item 2 end -->
				    
				  </div>
				</div> <!--tab end  -->
      </div>
   <!--  </div> -->
<!-- </div> -->

<c:import url="../common/style.jsp"></c:import>
<script src="${pageContext.request.contextPath}/js/layui/lay/dest/layui.all.js"></script>  
<script type="text/javascript">
  var layer = layui.layer,form = layui.form(),$=layui.jquery;
  $(function(){
	  	 
	  	  //弹窗监听提交
	 form.on('submit(bk_submit)', function(data){
    	$.post("${pageContext.request.contextPath}/artype/update.do",{code:data.field.code,type:data.field.type},function(data){
    		  var obj=data[0];
    		  if(obj.code=='100'){
        		  layer.alert('修改成功!',{title:"温馨提示",closeBtn:false,icon:6},function(){
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
	
	  /*1、编辑弹窗  */
      $(".bkEditBtn").click(function(){
    	   var code=$(this).attr("data-code");
    	   var type=$(this).attr("data-type");
    	   
    	  $("#bk_edit_dialog input[name='code']").val(code);
 		  $("#bk_edit_dialog input[name='type']").val(type);
 		  layer.open({
      		  type: 1,
      		  title: "修改版块类型【"+code+"】",
      		  area: '516px',
      		  shadeClose: true,
      		  content: $('#bk_edit_dialog')
      		});
      });
  });
</script>
  </body>
  
  <!--1、版块编辑弹窗  -->
<div id="bk_edit_dialog" class="qk_dialog" style="display:none;">
        <div class="inner">
             <form class="layui-form" action="" method="post">
                  <input name="code" type="hidden" value="">
				  <div class="layui-form-item">
				    <label class="layui-form-label">类型名称:</label>
				    <div class="layui-input-block">
				      <input type="text" name="type" required lay-verify="required|artypename" placeholder="请输入类型名称" autocomplete="off" class="layui-input" style="width:50%;" maxlength="3">
				    </div>
				    <!-- <div class="layui-form-mid layui-word-aux">辅助文字</div> -->
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn" lay-submit lay-filter="bk_submit">立即提交</button>
				      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
				    </div>
				  </div>
				</form>
        </div>
    </div>
    
</html>
