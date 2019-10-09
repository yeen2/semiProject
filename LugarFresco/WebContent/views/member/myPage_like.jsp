<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.review.model.vo.Review, java.util.ArrayList"%>
<%
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	#div123{padding:15px; font-weight:bold; color:#666;}
	#cafeClick:hover{cursor:pointer; background:#dee2e6;}
	#noData{width:100%; height:100px; text-align:center; font-size:1.250em; font-weight:bold; margin-top:100px;}
	#profileImg{width:100px; height:100px;}
	#reviewImg{width:80px; height:80px;}
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
   		
   		<div id="div123" class="app-title" style="text-align:center;">
	   		<h1 style="text-align:center;"><i class="app-menu__icon fa fa-heart-o"></i> 내 좋아요</h1>
	   	</div>
	   	
   		<div class="row user">
        <div class="col-md-9" style="margin-left:auto; margin-right:auto;">
          <div class="tab-content">
            <div class="tab-pane active" id="review-like">
            <%-- 반복 --%>
            <% if(list.isEmpty()){ %>
              <div id="noData">
						<div>
							<i class="fa fa-coffee" aria-hidden="true" style="font-size:50px; line-height:80px; color:#c2c2c2; margin-bottom:-20%;"></i>
						</div>
						<div>
							<p style="color:#c2c2c2;">좋아요한 리뷰가 없습니다!<br>리뷰에 좋아요를 눌러주세요!</p>
						</div>
					</div>
            <% }else{ %>
              <% for(Review rl : list){ %>
              <div id="cafeClick" class="timeline-post" onclick="location.href='<%=conPath%>/cafeInfo.ca?c_no=<%=rl.getC_no()%>';">
                <div class="post-media"><img id="profileImg" src="<%=conPath%>/resources/fileupload/review/<%=rl.getImg_name() %>">
                  <div class="content" style="margin-top:8px;">
                  	<h4><%=rl.getCafe_name() %>&nbsp;&nbsp;<label style="color:#ffc107;"><%=rl.getSum_avg() %></label>&nbsp;&nbsp;</h4>
                    <h5><%=rl.getNickname() %></h5>
                    <p class="text-muted"><small><%=rl.getR_date() %></small></p>
                  </div>
                </div>
                <div class="post-content">
                  <p><%=rl.getR_content() %></p>
                  <% if(!rl.getImgList().isEmpty()){ %>
                  	<% for(int i=0; i<rl.getImgList().size(); i++){ %>
                  	  <span id="contentImgArea"><img id="reviewImg" src="<%=conPath%>/resources/fileupload/review/<%=rl.getImgList().get(i).getImg_name()%>"></span>
	                <% } %>
	              <% } %>
                </div>
                <ul class="post-utility">
                  <li class="likes"><i style="color:#dc3545;" class="fa fa-fw fa-lg fa-heart"></i>좋아요 <%=rl.getR_like() %></li>
                  <li class="shares"><i style="color:gray;" class="fa fa-fw fa-lg fa-thumbs-down"></i>신고 <%=rl.getR_declare() %></li>
                </ul>
              </div>
              <% } %>
            <% } %>
              
            </div>
          </div>
        </div>
      </div>
      
     <!-- <script>
      	$(function(){
      		$.ajax({
				url:"myLikeA.mp",
				dataType:"json",
				success:function(list){ // list에는 객체배열의 형태로 담겨있을 것!!
					console.log("성공");
					console.log(list);
					if(list.length == 0){
						$("#111a").append("<h4>데이터가 없습니다</h4>");
					}
					$.each(list, function(index, value){
						$("#111a").append("<div><h3>dskflsdkflsdklf</h3><h4>데이터가 없습니다</h4><h3>dskflsdkflsdklf</h3><h4>데이터가 없습니다</h4></div>");
					});
				},
				error:function(){
					console.log("서버와의 통신 실패!!");
				}
			});
      	});
      </script>
      
      <script>
      	$(window).scroll(function(){
      		if($(window).scrollTop() >= $(document).height() - $(window).height()){
      			alert("111");
      		}
      	});
      </script> -->
   	</main>
   	
</body>
</html>