<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/md5/MD5.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
  </head>
  <body>
		<!--1、用户管理   -->
		<div class="layui-tab-item layui-show">
		      <!--tab -->
		      <div class="layui-tab" lay-filter="docDemoTabBrief">
				  <ul class="layui-tab-title">
				    <li class="layui-this"><i class="layui-icon">&#xe62d;</i>用户管理</li>
				    <li><i class="layui-icon">&#xe61f;</i>增加用户</li>
				  </ul>
				  <div class="layui-tab-content" style="height: 100px;">
				    <div class="layui-tab-item layui-show"><!-- layui-tab-item 1 -->
                         <form id="userSearchForm" class="layui-form layui-form-pane search-form" action="${pageContext.request.contextPath}/user/muser.do" method="post">
						      <input id="currPage" type="hidden" name="currPage" value="${currPage}">
						      <input  type="hidden" name="pageNums" value="${pageNums}">
						     <div class="layui-form-item">
						       <label class="layui-form-label">账号：</label>
						       <div class="layui-input-inline">
						         <input type="text" name="queryString" value="${queryString}" lay-verify="" placeholder="请输入账号搜索" autocomplete="off" class="layui-input" >
						       </div>
						       <button  name="searchFormBtn" class="layui-btn"  onclick="javascript:return false;" ><i class="layui-icon">&#xe615;</i>搜索</button>
						       <button name="resetBtn" class="layui-btn layui-btn-primary" onclick="javascript:return false;"><i class="layui-icon">&#xe639;</i>重置</button>
						        <button name="qkreload" class="layui-btn"  onclick="javascript:return false;" ><i class="layui-icon">&#x1002;</i>刷新</button>
						     </div>
						   </form>
						   
						   <table class="layui-table" lay-skin="line">
								  <colgroup>
								     <col >
								     <col >
								     <col>
								     <col >
								     <col>
								  </colgroup>
								  <thead>
								    <tr>
								        <th >编号</th>
										<th >账号</th>
										<th >电话</th>
										<th >邮箱</th>
										<!-- <th >所属公司</th> -->
										<th >操作</th>
								    </tr> 
								  </thead>
								  <tbody>
								     <c:if test="${!empty userList }">  
					                    <c:forEach items="${userList}" var="user" varStatus="i">  
					                        <tr id="tr_${user.id}">  
					                            <td >${i.index+1}</td>  
					                            <td >${user.name}</td>  
					                            <td >${user.tell }</td> 
					                            <td >${user.mail }</td> 
					                            <%-- <td >${user.company.getChineseName()}</td> --%> 
					                            <td >  
					                                   <div class="layui-btn-group">
																<button 
																	class="user-edit do-action layui-btn layui-btn-small" data-id="${user.id}" data-name="${user.name}"
																	data-tell="${user.tell}" data-mail="${user.mail}" data-company="${user.company}"  data-pwd="${user.password}"><i class="layui-icon">&#xe642;</i>   编辑</button>
																<button 
																	class="user-del do-action layui-btn layui-btn-small" data-id="${user.id}"><i class="layui-icon">&#xe640;</i> 删除</button>
															</div>
					                            </td>  
					                        </tr>               
					                    </c:forEach>  
					                </c:if> 
								  </tbody>
								</table>    
								<div id="layer-Pages"></div><!--导航条 -->
                    </div><!-- layui-tab-item 1 end -->
				    <div class="layui-tab-item"><!-- layui-tab-item 2 -->
                               <form id="inputForm" class="layui-form" action="" method="post">
										<div class="layui-form-item">
											<label class="layui-form-label">账号</label>
											<div class="layui-input-inline">
												<input type="text" name="name" value="" lay-verify="required|username" class="layui-input">
											</div>
										</div>
										<div class="layui-form-item">
											<label class="layui-form-label">电话</label>
											<div class="layui-input-inline">
												<input type="text" name="tell" value="" lay-verify="required|phone" class="layui-input">
											</div>
										</div>
										<div class="layui-form-item">
											<label class="layui-form-label">邮箱</label>
											<div class="layui-input-inline">
												<input type="text" name="mail" value="" lay-verify="required|email" class="layui-input">
											</div>
										</div>
										<!-- <div class="layui-form-item">
											<label class="layui-form-label">所属公司</label>
										    <div class="layui-input-inline">
										      <select name="company" lay-filter="company">
										        <option value="BDKJT">奔达康集团</option>
										        <option value="BDKJR">奔达康金融</option>
										        <option value="BDKDQ">奔达康电气</option>
										        <option value="XGLLWHGS">心感力量文化传播有限公司</option>
										      </select>
										    </div>
										</div> -->
										<div class="layui-form-item">
											<label class="layui-form-label">密码</label>
											<div class="layui-input-inline">
												<input type="password" name="password" value="" lay-verify="required|pwd" class="layui-input">
											</div>
										</div>
										<div class="layui-form-item">
											<label class="layui-form-label">确认密码</label>
											<div class="layui-input-inline">
												<input type="password" name="repassword" value="" lay-verify="required|pwd" class="layui-input">
											</div>
										</div>
										<div class="layui-form-item">
											<div class="layui-input-block">
												<button class="layui-btn"  lay-submit lay-filter="bk_submit">确认提交</button>
											</div>
										</div>
									</form>  
                     </div><!-- layui-tab-item 2 end -->
				    
				      <!--用户编辑弹窗  -->
					<div id="user_edit_dialog" class="user_edit_dialog" style="display:none;">
				        <div class="inner">
                               <form id="userFormEdit" class="layui-form" action="" method="post">
										<div class="layui-form-item">
											<label class="layui-form-label">账号</label>
											<div class="layui-input-inline">
											    <input type="hidden" name="id" value=""/>
											    <input type="hidden" name="password" value=""/>
												<input type="text" name="name" value="" lay-verify="required|username" class="layui-input">
											</div>
										</div>
										<div class="layui-form-item">
											<label class="layui-form-label">电话</label>
											<div class="layui-input-inline">
												<input type="text" name="tell" value="" lay-verify="required|phone" class="layui-input">
											</div>
										</div>
										<div class="layui-form-item">
											<label class="layui-form-label">邮箱</label>
											<div class="layui-input-inline">
												<input type="text" name="mail" value="" lay-verify="required|email" class="layui-input">
											</div>
										</div>
										<!-- <div class="layui-form-item">
											<label class="layui-form-label">所属公司</label>
										    <div class="layui-input-inline">
										      <select id="editCompany" name="company" lay-filter="editCompany">
										        <option value="BDKJR" >奔达康金融</option>
										         <option value="BDKJT">奔达康集团</option>
										        <option value="BDKDQ" >奔达康电气</option>
										        <option value="XGLLWHGS">心感力量文化传播有限公司</option>
										      </select>
										    </div>
										</div> -->
										<div class="layui-form-item">
											<div class="layui-input-block">
												<button class="layui-btn"  lay-submit lay-filter="user_edit_submit">确认提交</button>
											</div>
										</div>
								</form>  
				        </div>
				    </div>
				  </div>
				</div> <!--tab end  -->
      </div>
      <script src="${pageContext.request.contextPath}/js/layui/lay/dest/layui.all.js"></script>
      <script src="${pageContext.request.contextPath}/js/modules/layerValidation.js"></script>
    <script type="text/javascript">
    var layer = layui.layer,form = layui.form(),$=layui.jquery,laydate = layui.laydate,element=layui.element(),laypage=layui.laypage,layedit = layui.layedit;
	var userSearchForm=$("#userSearchForm");   
	 var lock = true; // 锁住表单    1.这里定义一把锁
    $(function(){
       	   /*8、刷新  */
       	     userSearchForm.find("button[name='qkreload']").click(function(){
       	      userSearchForm.find("input[name='queryString']").val("");
			  userSearchForm.find("input[name='currPage']").val("1");
			   userSearchForm.find("input[name='pageNums']").val("5");
			   userSearchForm.submit();
		   });
		    /*7、搜索  */
		     userSearchForm.find("button[name='searchFormBtn']").click(function(){
			   userSearchForm.find("input[name='currPage']").val("1"); 
			   userSearchForm.submit();
		   });
		     /*6、重置*/
		   userSearchForm.find("button[name='resetBtn']").click(function(){
			   userSearchForm.find("input[name='queryString']").val("");
			  /*  userSearchForm.find("input[name='currPage']").val("1"); 
			   userSearchForm.find("input[name='pageNums']").val("5"); 
			   userSearchForm.submit(); */
		   });
		  	  /*1、 添加用户 */
			 form.on('submit(bk_submit)', function(data){
				  
				    userAddFun(data);
			  	    return false;
			  	  });
		  	  /*2、修改用户信息  */
			 form.on('submit(user_edit_submit)', function(data){
			    	$.post("${pageContext.request.contextPath}/user/updateUser.do",{id:data.field.id,password:data.field.password,name:data.field.name,tell:data.field.tell,mail:data.field.mail,company:data.field.company},function(data){
			    		  var obj=data[0];
			    		  if(obj.code=='100'){
			        		  layer.alert('修改用户成功!',{title:"温馨提示",closeBtn:false,icon:6},function(){
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
		  	  
			 /*3、删除用户*/
		        $(".user-del").click(function(){
		        	 var userId = $(this).attr("data-id");
		        	layer.alert('确认要删除用户吗?', {title:"温馨提示",icon: 3},function(){
					    	$.post("${pageContext.request.contextPath}/user/delUser.do",{id:userId},function(data){
					    		  var obj=data[0];
					    		  if(obj.code=='100'){
					        		  layer.alert('删除用户成功!',{title:"温馨提示",closeBtn:false,icon:6},function(){
					        			  //$(data.form).find("input").val("");
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
		        		});
		        	
		        });
			 
			 /* 4、分页 */
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
			        	$("#userSearchForm").submit();
			           }
			       }
			     });
		        
		        /*5、编辑用户 */
		        $(".user-edit").click(function(){
		        	 var id = $(this).attr("data-id");
		        	 var name = $(this).attr("data-name");
		        	 var tell = $(this).attr("data-tell");
		        	 var mail = $(this).attr("data-mail");
		        	 var company = $(this).attr("data-company");
		        	 var password = $(this).attr("data-pwd");
		        
		        	 
		        	 
		    		  layer.open({
		          		  type: 1,
		          		  title: "用户编辑",
		          		  area: '516px',
		          		  shadeClose: true,
		          		  content: $('#user_edit_dialog'),
		          		  success: function(layero, index){
	            			  var userval=$("#userFormEdit");
	            			  userval.find("input[name='id']").val(id);
	            			  userval.find("input[name='name']").val(name);
	            			  userval.find("input[name='tell']").val(tell);
	            			  userval.find("input[name='mail']").val(mail);
	            			  userval.find("input[name='password']").val(password);
	            			  
	            			  /*获取select值*/
	            			  if(company=="BDKJR"){//金融
	            			      userval.find("select[name='company']").next("div").find("input").val("奔达康金融"); 
	            			  }else if(company=="BDKDQ"){//电气
	            				  userval.find("select[name='company']").next("div").find("input").val("奔达康电气");
	            			  }else if(company=="BDKJT"){//集团
	            				  userval.find("select[name='company']").next("div").find("input").val("奔达康集团");
	            			  }else if(company=="XGLLWHGS"){//心感力量
	            				  userval.find("select[name='company']").next("div").find("input").val("心感力量文化传播有限公司");
	            			  }
	            			  
	            			  userval.find("select[name='company'] option").attr("selected",false);
	            			  userval.find("select[name='company'] option[value='"+company+"']").attr("selected",true);
	            			   
	            			  
	            			  
	            			  }
		          	  });
	        });
		        
		        //1、添加用户
		        function userAddFun(data){
		        	
		      	  if(!lock){    // 2.判断该锁是否打开，如果是关闭的，则直接返回
		 			     return false;
		 			    }
		 		     lock = false  //3.进来后，立马把锁锁住
		 		     var indesave = layer.msg('保存中', {
		 		    	    icon: 16
		 		    	  ,shade: 0.01
		 		    	});
		        	
		        	if(data.field.password != data.field.repassword){
		        		 layer.alert('两次密码不一致!',{title:"温馨提示",closeBtn:false,icon:5},function(index){
		        			 layer.close(index);
		   		  		  });
		      		      return false;
		        	}
			    	$.post("${pageContext.request.contextPath}/user/addUser.do",{name:data.field.name,tell:data.field.tell,mail:data.field.mail,company:data.field.company,password:hex_md5(data.field.password),repassword:hex_md5(data.field.repassword)},function(data){
			    		  var obj=data[0];
			    		  if(obj.code=='100'){
			        		  layer.alert('增加用户成功!',{title:"温馨提示",closeBtn:false,icon:6},function(){
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
			       			     layer.close(indesave);
			       			    lock=true;
			       		   });
			        	  }
			    		
			    	  }); 
		        }
		        
	   }); 
	</script>    
  </body>
</html>
