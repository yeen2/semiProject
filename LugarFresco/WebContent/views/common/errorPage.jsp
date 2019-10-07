<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String conPath = request.getContextPath();

	String message = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
 <head>
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=conPath %>/resources/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
</head>

<body>


	<div style="padding-top: 200px; padding-left: 500px; padding-right: 500px; text-align: center">
		<h1 style="color: red;">
			<i class="fa fa-exclamation-circle"></i><%=message %></h1>
		<p>The page you have requested is not found.</p>

		<!-- 메인페이지로 돌아가기 -->
		<p>
			<a class="btn btn-primary" href="<%= request.getContextPath() %>">Go Back</a>
		</p>
	</div>

</body>
</html>