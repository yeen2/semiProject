<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cafe.model.vo.Cafe, java.util.ArrayList" %>
<%
	ArrayList<Cafe> list = (ArrayList<Cafe>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	#cafeArea{margin-bottom:15px;}
	.app-content div{padding:15px; font-weight:bold; color:#666;}
	.app-content li{list-style:none; display:inline-block;}
	#cafeArea:hover{cursor:pointer; background:#dee2e6;}
	#area > ul > li{width:27%; height:auto; margin-right:50px; margin-bottom:30px;}
	#imgArea > img{display:block; width:100%; height:200px;}
	#noData{width:100%; height:100px; text-align:center; font-size:1.250em; font-weight:bold; margin-top:100px;}
</style>
</head>
<body>
	 <%@include file="../includes/header.jsp" %>

     
     <!-- 각 li 누를때마다 active 바뀌게 js 코드 짜기 -->
      <ul class="app-menu">
      	 <li><a class="app-menu__item" href="<%=request.getContextPath() %>/myReview.mp">
        	<i class="app-menu__icon fa fa-pencil-square-o"></i><span class="app-menu__label">
        		내가 쓴 리뷰</span></a>
        </li> 
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/myLike.mp">
          	<i class="app-menu__icon fa fa-heart-o"></i><span class="app-menu__label">
        		내 좋아요</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/myFavorite.mp">
        		<i class="app-menu__icon fa fa-star-o"></i><span class="app-menu__label">
        		내 즐겨찾기</span></a>
        </li>
      	<li><a class="app-menu__item" href="<%=request.getContextPath() %>/myUpdateForm.mp">
			<i class="app-menu__icon fa fa-user-o"></i><span class="app-menu__label">
        		내 정보 수정</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/outForm.mp">
        	<i class="app-menu__icon fa fa-trash-o"></i><span class="app-menu__label">
        		회원 탈퇴</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/applyCafeForm.mp">
        	<i class="app-menu__icon fa fa-file-text-o"></i><span class="app-menu__label">
        		카페 등록 신청</span></a>
        </li>
      </ul>
    </aside>
    
    
    
    
    <!-- ----------------------------------코드시작 <main> 안에서 작성해야합니다~ --------------------------------------- -->
    
   	<main class="app-content">
   	
   		<div class="app-title" style="text-align:center;">
	   		<h1 style="text-align:center;"><i class="app-menu__icon fa fa-star-o"></i> 내 즐겨찾기</h1>
	   	</div>
   	
			<div id="area">
				<ul align="center">
				
				<% if(list.isEmpty()){%>
					<div id="noData">
						<div>
							<i class="fa fa-coffee" aria-hidden="true" style="font-size:50px; line-height:80px; color:#c2c2c2; margin-bottom:-20%;"></i>
						</div>
						<div>
							<p style="color:#c2c2c2;">즐겨찾기한 카페가 없습니다!<br>카페 즐겨찾기를 눌러주세요!</p>
						</div>
					</div>
				<% }else { %>
				
					<%  for(Cafe f : list){ %>
						<li>
							<div id="cafeArea" onclick="location.href='<%=conPath%>/cafeInfo.ca?c_no=<%=f.getC_no()%>';">
								<span id="imgArea">
									<img src="<%=conPath %>/resources/fileupload/cafe/<%=f.getImg_name()%>">
								</span>
								
								<div id="textArea">
									<div style="font-size:27px; margin-top:-20px; width:100%;color:#ffc107;">4.3</div>
									<p style="margin-top:-10px; font-size:19px;"><%=f.getCafe_name() %></p>
									<span style="margin-right:15px;"><i class="icon fa fa-eye fa-3x" style="font-size:13px;"></i> <%=f.getCount() %></span>
									<span style="margin-right:15px;"><i class="icon fa fa-pencil fa-3x" style="font-size:13px;"></i> <%=f.getReview_count() %></span>
									<span><i class="icon fa fa-star fa-3x" style="font-size:13px;"></i> <%=f.getFavorite() %></span>
								</div>
							</div>
						</li>
						
					<% } %>
				<% } %>
						
				</ul>
			</div>
   	</main>
   	
    
</body>
</html>