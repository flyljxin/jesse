<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% String contextPath = request.getContextPath();
%>
<html>
<script src="<%=contextPath%>/common/js/jquery-2.0.3.js"
	type="text/javascript" charset="utf-8"></script>
<head>
<meta charset="UTF-8" />
</head>


<style>
body {
	/*    background : url(${contextPath}/common/img/mom_boy.jpg); */
	background-size: 50% 50%;
}
</style>
<body>
	name: <input type="text" name="name" id="name" />
	age: <input type="text" name="age" id="age" />
	<button id="btn">register!</button>
</body>
<script>
	$("#btn").click(function() {
		alert("here");
		var name=$("#name").val();
		var age=$("#age").val();
		var contextPath = "http://localhost:8080/JesseDemo1.0";
		console.info("contextPath="+contextPath);
		//$.post(sy.contextPath + '/saveUser?name='+name+"&age="+age, $form.serialize(), function(result) {
		$.post(contextPath + '/saveUser?name='+name+"&age="+age, function(result) {
			if (result.success) {
				alert("ok");
				//location.replace(sy.contextPath + '/index.jsp');
			} else {
				alert("fail");
			}
		}, 'json');
	});
</script>
</html>
