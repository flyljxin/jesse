<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<script src="<%=contextPath%>/common/js/jquery-2.0.3.js" type="text/javascript" charset="utf-8"></script>
    <head>
        <meta charset="UTF-8" />
    </head>


    <style>
        body {
         /*    background : url(${contextPath}/common/img/mom_boy.jpg); */
            background-size : 50% 50%;
        }
    </style>
    <body>
<button id="btn">click!</button>
hi.there
    </body>
    <script>
    $("#btn").click(function(){alert("here")});
    </script>
</html>
