<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.review.model.vo.Review, com.kh.cafe.model.vo.Cafe, java.util.ArrayList"%>
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
	#noData{width:100%; height:100px; text-align:center; font-size:1.250em; font-weight:bold; margin-top:130px;}
	#profileImg{width:100px; height:100px;}
	#reviewImg{width:80px; height:80px;}
	#dCheck{width:20px; height:20px;}
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
	   		<h1 style="text-align:center;"><i class="app-menu__icon fa fa-pencil-square-o"></i> 내가 쓴 리뷰</h1>
	   	</div>
	   	
	   	<div class="row user">
        <div class="col-md-9" style="margin-left:auto; margin-right:auto;">
        <% if(!list.isEmpty()){ %>
        <div align="right">
	   		<button type="button" class="btn btn-secondary" onclick="deleteCheck();">삭제</button>
	   	</div>
	   	<% } %>
          <div class="tab-content">
            <div class="tab-pane active" id="my-review">
            <%-- 반복 --%>
            <% if(list.isEmpty()){ %>
            	<div id="noData">
					<div>
						<i class="fa fa-coffee" aria-hidden="true" style="font-size:50px; line-height:80px; color:#c2c2c2; margin-bottom:15px;"></i>
					</div>
					<div>
						<p style="color:#c2c2c2;">나의 리뷰가 없습니다!<br>리뷰를 작성해주세요!</p>
					</div>
				</div>
            <% }else{ %>
              <% for(Review r : list){ %>
              <div>
				 <input type="checkbox" id="dCheck" name="dCheck" value="<%=r.getR_no() %>">
			  </div>
              <div id="cafeClick" class="timeline-post" onclick="location.href='<%=conPath%>/cafeInfo.ca?c_no=<%=r.getC_no()%>';">
                <div class="post-media"><img id="profileImg" src="<%=conPath%>/resources/fileupload/cafe/<%=r.getImg_name() %>">
                  <div class="content" style="margin-top:8px;">
                  	<h4><%=r.getCafe_name() %>&nbsp;&nbsp;<label style="color:#ffc107;"><%=r.getSum_avg() %></label>&nbsp;&nbsp;</h4>
                    <h5><%=r.getNickname() %></h5>
                    <p class="text-muted"><small><%=r.getR_date() %></small></p>
                  </div>
                </div>
                <div class="post-content">
                  <p><%= r.getR_content() %></p>
                  <% if(!r.getImgList().isEmpty()){ %>
                  	<% for(int i=0; i<r.getImgList().size(); i++){ %>
                  	  <span id="contentImgArea"><img id="reviewImg" src="<%=conPath%>/resources/fileupload/review/<%=r.getImgList().get(i).getImg_name()%>"></span>
	                <% } %>
	              <% } %>
                </div>
                <ul class="post-utility">
                  <li class="likes"><i style="color:#dc3545;" class="fa fa-fw fa-lg fa-heart"></i>좋아요 <%=r.getR_like() %></li>
                  <li class="shares"><i style="color:gray;" class="fa fa-fw fa-lg fa-thumbs-down"></i>신고 <%=r.getR_declare() %></li>
                </ul>
              </div>
              <br>
              <% } %>
            <% } %>
            
            </div>
          </div>
        </div>
      </div>
      
      
      <script>
      	var arr = [];
      	$(function(){
      		$("input[name=dCheck]").change(function(){
      			if($(this).prop("checked")){
      				var dCheck = $(this).val();
      				arr.push(dCheck);
      			}else{
      				arr.pop(dCheck);
      			}
      		});
      	});
      	
      	function deleteCheck(){
      		if($("input[name=dCheck]:checked").length == 0){
      			alert("삭제할 리뷰를 체크해주세요.");
      		}else{
      			var real = confirm("정말 삭제하시겠습니까?");
      			if(real){
      				location.href="<%=conPath%>/deleteReview.mp?arr=" + arr.toString();
      			}
      		}
      	}
      	
      </script>
   	</main>
   	
</body>
</html>