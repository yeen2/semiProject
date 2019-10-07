<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>

     <div class="app-sidebar__user">
        <!-- 프로필 사진 -->
      	<img class="app-sidebar__user-avatar" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image">
        <div>
        <!-- 닉네임 + 이메일주소 -->
          <p class="app-sidebar__user-name"><%=loginUser.getNickName() %></p>
          <p class="app-sidebar__user-designation"><%=loginUser.getEmail()%></p>
        </div>
      </div>
	
</body>
</html>