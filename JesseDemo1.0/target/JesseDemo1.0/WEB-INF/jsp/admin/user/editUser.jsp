
    <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
    <%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
    <html>  
      <head>  
        <base href="<%=basePath%>">  
        <title>编辑用户</title>  
        <script type="text/javascript">  
        function updateUser(){  
            var form = document.forms[0];  
            form.action = "<%=basePath%>user/updateUser.do";  
            form.method="post";  
            form.submit();  
        }  
    </script>  
      </head>  
      <body>  
        <h1>修改页面</h1>  
        <form action="" name="userForm">  
            <input type="hidden" name="id" value="${user.id }"/>  
            <input type="hidden" name="password" value="${user.password}"/>
          		  姓名：<input type="text" name="name" value="${user.name}"/>  
               	  电话：<input type="text" name="tell" value="${user.tell }"/>  
               	  邮箱：<input type="text" name="mail" value="${user.mail }"/>  
            <input type="button" value="编辑" onclick="updateUser()"/>  
        </form>  
      </body>  
    </html>  
