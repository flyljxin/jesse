<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="com.bdk.mapper.User" %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>奔达康集团企业报后台系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pc/admin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/md5/MD5.js"></script>
  </head>
  <%
  Object obj = request.getSession().getAttribute("ADMIN_SESSION_USER");
  User user = null;
  if(null != obj)
  {
	  user = (User)obj;
  }
  else{
	  response.sendRedirect(request.getContextPath()+"/user/login.do");
  }
  %>
  <body>
<!-- 布局容器 -->
    <div class="layui-layout layui-layout-admin">
        <!-- 头部 -->
        <div class="layui-header">
            <div class="layui-main">
                <!-- logo -->
                <a href="" style="color: #c2c2c2; font-size: 18px; line-height: 60px;">奔达康集团企业报后台系统</a>
                <!-- 水平导航 -->
                <ul class="layui-nav" style="position: absolute; top: 0; right: 0; background: none;">
                    <li class="layui-nav-item">
                       <%--  <a href="${pageContext.request.contextPath}/period/periodical.do" target="_blank">  进入前台</a> --%>
                        <a id="forntview" href="javascript:void(0);" >  进入前台</a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;"> 
	                        <%
	                        if(null != user)
	                        {
	                        %>
	                     	   欢迎：&nbsp;<font color="#009688"><%=user.getName() %></font >&nbsp;&nbsp;登录
	                       	<% 
	                        }else
	                        {
	                        	%>
	                        	未登录
	                        	<%
	                        }
	                        %>
                        </a>
                        <dl class="layui-nav-child">
                           <!--  <dd>
                                <a href="javascript:;">个人信息</a>
                            </dd> -->
                            <dd>
                                <a id="updatapwd" href="javascript:void(0);">修改密码</a>
                            </dd>
                            <dd>
                                <a href="${pageContext.request.contextPath}/user/exitLogin.do">退出登录</a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 侧边栏 -->
        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <ul class="layui-nav layui-nav-tree" lay-filter="left-nav" style="border-radius: 0;">
                </ul>
            </div>
        </div>

        <!-- 主体 -->
        <div class="layui-body">
            <!-- 顶部切换卡 -->
            <div class="layui-tab layui-tab-brief" lay-filter="top-tab" lay-allowClose="true" style="margin: 0;">
                <ul class="layui-tab-title"></ul>
                <div class="layui-tab-content"></div>
            </div>
        </div>

        <!-- 底部 -->
        <div class="layui-footer" style="text-align: center; line-height: 44px;">
            Copyright © 2017 <a href="http://www.bdkgroup.cn" target="_blank">奔达康集团</a> &nbsp;&nbsp;技术支持：<a href="http://www.gskjinc.com/" target="_blank">深圳广商网络科技有限公司</a>
        </div>
    </div>
    
    <!--1、 修改密码弹窗 -->
    <div id="pwddialog" class="qk_dialog" style="display: none;">
        <div class="inner">
             <form class="layui-form" action="" method="post">
				  <div class="layui-form-item">
				    <label class="layui-form-label">旧密码:</label>
				    <div class="layui-input-block">
				      <input type="password" name="oldpwd" required  lay-verify="required|pwd" placeholder="请输入原密码" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  
				  <div class="layui-form-item">
				    <label class="layui-form-label">新密码:</label>
				    <div class="layui-input-block">
				      <input type="password" name="newpwd" required lay-verify="required|pwd" placeholder="请输入新密码" autocomplete="off" class="layui-input">
				    </div>
				    <!-- <div class="layui-form-mid layui-word-aux">辅助文字</div> -->
				  </div>
				  
				  <div class="layui-form-item">
				    <label class="layui-form-label">确认新密码:</label>
				    <div class="layui-input-block">
				      <input type="password" name="renewpwd" required lay-verify="required|pwd" placeholder="请确认新密码" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
				    </div>
				  </div>
				</form>
        </div>
    </div>
  <%--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js"></script> --%>
     <%@include file="./common/script.jsp" %>
	<script type="text/javascript">
	   /**
     * 对layui进行全局配置
     */
    layui.config({
        base: '${pageContext.request.contextPath}/js/'
    });

    /**
     * 初始化整个cms骨架
     */
    layui.use(['jquery','cms','form', 'layedit', 'laydate'], function() {
        var cms = layui.cms('left-nav', 'top-tab');
        var form = layui.form()
        ,layer = layui.layer
        ,layedit = layui.layedit
        ,laydate = layui.laydate
        ,$=layui.jquery;
        /* 菜单目录 */
        cms.addNav([
           /*  {id: 1, pid: 0, node: '系统主页', url: '${pageContext.request.contextPath}/user/sysindex.do'}, */
             {id: 2, pid: 0, node: '用户管理', url: '${pageContext.request.contextPath}/user/muser.do'},
            {id: 3, pid: 0, node: '期刊管理', url: '${pageContext.request.contextPath}/peradmin/periods.do'},
            {id: 4, pid: 0, node: '期刊内容管理', url: '${pageContext.request.contextPath}/article/artices.do'},
            {id: 5, pid: 0, node: '参数管理', url: '${pageContext.request.contextPath}/sysparams/allSysparams.do'},
            {id: 6, pid: 0, node: '图标管理', url: '${pageContext.request.contextPath}/sysimgs/getEditSysimages.do'},
            {id: 7, pid: 0, node: '版块类型管理', url: '${pageContext.request.contextPath}/artype/alltype.do'},
        ], 0, 'id', 'pid', 'node', 'url');
        cms.bind(60 + 41 + 20 + 44); //头部高度 + 顶部切换卡标题高度 + 顶部切换卡内容padding + 底部高度
        cms.clickLI(0);
      
        /*1、绑定表单 验证成功后提交*/
        form.on('submit(formDemo)', function(data){
        	 var vdata=JSON.stringify(data.field);
        	 
        	 if(data.field.newpwd != data.field.renewpwd){
        		 layer.alert('两次密码不一致!',{title:"温馨提示",closeBtn:false,icon:5},function(index){
       			  	//$(data.form).find("input").val("");
        			 layer.close(index);
   		  		  });
      		      return false;
        	 }
        	 
           	 $.post("${pageContext.request.contextPath}/user/updatePassword.do",{renewpwd:hex_md5(data.field.renewpwd),newpwd:hex_md5(data.field.newpwd),oldpwd:hex_md5(data.field.oldpwd)},function(s){
            	  var obj=s[0];
            	  if(obj.code=='100'){
            		  layer.alert('修改成功!',{title:"温馨提示",closeBtn:false,icon:6},function(){
            			  $(data.form).find("input").val("");
            			  layer.closeAll();
           		  });
            	  }else if(obj.code=='103'){//nologin
            		  layer.alert('请先登录再修改！',{title:"温馨提示",closeBtn:false,icon:5},function(){
              			   window.location.href="${pageContext.request.contextPath}/user/login.do";
              		  });
            	  }else{
            		  layer.alert(obj.errorMsg,{title:"温馨提示",closeBtn:false,icon:5},function(index){
           			      layer.close(index);
           		   });
            	  }
             });
             
             return false;
          });

        /*2、修改密码  */
        $("#updatapwd").click(function(){
        	layer.open({
        		  type: 1,
        		  title: "修改密码",
        		  area: '516px',
        		  shadeClose: true,
        		  content: $('#pwddialog')
        		});
        });
        $("#forntview").click(function(){
        	 var height = 620;  
             var width = 400;  
             var top=Math.round((window.screen.height-height)/2);  
             var left=Math.round((window.screen.width-width)/2);  
             window.open("${pageContext.request.contextPath}/period/periodical.do", "_blank",   
                     "height=" + height + ", width=" + width + ", top=" + top + ", left= " + left + ", toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
        });
    });
	</script>
  </body>
</html>
