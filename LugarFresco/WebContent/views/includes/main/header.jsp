<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
	String conPath = request.getContextPath();

	// session 객체에 담겨진 로그인한 회원 객체 뽑아내기
	Member loginUser = (Member) session.getAttribute("loginUser");

	String message = (String) session.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Lugar Fresco</title>
<head>
<style type="text/css">
	input:focus {outline:none;}
	a, a:focus, a:hover {
    text-decoration: none !important;
    outline: 0;
}
</style>
<script>
	
	/* 여기페이지가 새로 될때마다 msg가 있으면 alert창 띄어줌@|!!! */
	$(function () {
		/* message는 그냥 일반 문자열이므로, " "를 붙여줘야 String형식이 된다 */
		var msg = "<%=message%>";

		if (msg != "null") {
			alert(msg);

			// 세션에 담긴 메세지 한번만 출력하고 삭제하기
			<%session.removeAttribute("msg");%>
		}
	});
</script>

<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="resources/img/fav.png">
		<!-- Author Meta -->
		<meta name="author" content="colorlib">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="<%=conPath%>/resources/css/common/linearicons.css">
			<link rel="stylesheet" href="<%=conPath%>/resources/css/common/font-awesome.min.css">
			<link rel="stylesheet" href="<%=conPath%>/resources/css/common/bootstrap.css">
			<!-- <link rel="stylesheet" href="resources/css/common/magnific-popup.css"> -->
			<!-- <link rel="stylesheet" href="resources/css/common/jquery-ui.css">	 -->			
			<!-- <link rel="stylesheet" href="resources/css/common/nice-select.css"> -->							
			<!-- <link rel="stylesheet" href="resources/css/common/animate.min.css"> -->
			<link rel="stylesheet" href="<%=conPath%>/resources/css/common/owl.carousel.css">				
			<link rel="stylesheet" href="<%=conPath%>/resources/css/common/main.css">
			
		</head>
		<body>	
			<header id="header" class="header-scrolled !important;">
			
				<div class="container main-menu">
					<div class="row align-items-center justify-content-between d-flex">
					
					<!-- 로고부분 -->
				      <div id="logo">
				        <a href="<%=conPath%>"><img src="<%=conPath%>/resources/img/logo.png" alt="" title="" /></a>
				      </div>
						
					  <!-- 검색창 -->
					  <div style="width: 500px;">
					  	<!-- 검색 아이콘 -->
					  	<i class="fa fa-search" style="font-size:x-large;"></i>
					  	&nbsp;
					  	<form action="nav_search.ca" method="get" style="display: inline;">
					  		<input type="text" id="nav_search" name="nav_search" size="50px;" 
					  			style="background: none; border: none; color: white;" placeholder="지역 또는 카페명">
					  	</form>
					  </div>
					  
					  <!-- 메뉴버튼 -->
				      <nav id="nav-menu-container">
				      
				        <ul class="nav-menu">
				          <li><a href="<%=conPath%>/list.no">Notice &nbsp; | </a></li>
				          <li><a href="<%=conPath%>/cafeList.ca">Cafe List &nbsp; | </a></li>
				          <li><a href="<%=conPath%>/joinForm.me">Join &nbsp; | </a></li>
				          
				          <% if(loginUser == null){ %>
				         	 <li><a href="<%=conPath%>/loginForm.me">Sign In &nbsp; | </a></li>

						  <% } else {%>
						  	<li><a href="<%=conPath%>/logout.me">LogOut &nbsp; | </a></li>
						  <%} %>
						  
							
						  <!-- 로그인 한 사람만 이용가능. alert창 띄우기 -->
				          <li class="menu-has-children"><a href="">Pages</a>
				            <ul>
				    		
								<li><a href="<%=conPath%>/myPage.mp">myPage</a></li>


								<li><a href="<%=conPath%>/ownerPage.op">ownerPage</a></li>

								<li><a href="<%=conPath%>/adminPage.ap">adminPage</a></li>


								<li><a href="<%=conPath%>/q_list.qu">Q&A</a></li>

							</ul>
				          </li>					          					          		          
	
				        </ul>
				      </nav><!-- #nav-menu-container -->					      		  
					</div>
				</div>
			</header><!-- #header -->
			
			<script>
				function nav_search(){
					location.href='nav_search.ca';
				}
				
			</script>
	
	 
	 
			<!-- 자바스크립트 헤더에 넣었음  -->
			
			<script src="<%=conPath%>/resources/js/common/vendor/jquery-2.2.4.min.js"></script>
			<!-- <script src="resources/js/common/popper.min.js"></script> -->
			<!-- <script src="resources/js/common/vendor/bootstrap.min.js"></script> -->			
			<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>	 -->	
 			<!-- <script src="resources/js/common/jquery-ui.js"></script>		 -->			
  			<!-- <script src="resources/js/common/easing.min.js"></script>		 -->	
			<!-- <script src="resources/js/common/hoverIntent.js"></script> -->
			<script src="<%=conPath%>/resources/js/common/superfish.min.js"></script>	
			<!-- <script src="resources/js/common/jquery.ajaxchimp.min.js"></script> -->
			<script src="<%=conPath%>/resources/js/common/jquery.magnific-popup.min.js"></script>						
			<!-- <script src="resources/js/jquery.nice-select.min.js"></script>	 -->				
			<script src="<%=conPath%>/resources/js/common/owl.carousel.min.js"></script>							
			<script src="<%=conPath%>/resources/js/common/mail-script.js"></script>	
			<script src="<%=conPath%>/resources/js/common/main.js"></script>

	</body>
	
	
	