<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cafe.model.vo.Cafe, java.util.ArrayList" %>
<%
	//ArrayList<Cafe> list = (ArrayList<Cafe>)request.getAttribute("list");
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
	#noData{width:100px; height:100px; text-align:center; font-size:1.250em; font-weight:bold; margin-left:350px; margin-top:100px;}
	#favoriteBtn{width:50px; height:50px; color:white; background:#ffc107; border:1px solid #ffc107;}
	#favoriteBtn:hover{cursor:pointer; background:#dee2e6; color:white; border:1px solid #dee2e6;}
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
   	
			<div id="area" style="margin-left:60px;">
				<ul>
				
					<%-- 반복 --%>
						
				</ul>
			</div>
			
		<script>
	     	$(function(){
	     		selectFavoriteList();
	     		
	     	});
	     	
	     	
	     	function favoriteRm(value){
	     		var fno = value;
	 			var real = confirm("카페 즐겨찾기를 취소하시겠습니까?");
	     		
	     		if(real){
	     			
		     		$.ajax({
		     			url:"favoriteRm.mp",
						type:"post",
						data:{fno:fno},
						success:function(result){
							
							if(result == "1"){
								alert("적용되었습니다!");
								selectFavoriteList();
								
							}else{
								alert("즐겨찾기 취소에 실패하였습니다.");
							}
							
						},
						error:function(){
							console.log("서버와의 통신 실패");
						}
		     		});
		     		
	     		}
	     	}
	    </script>
	    
		<script>
      	function selectFavoriteList(){
      		
      		$.ajax({
				url:"myFavoriteA.mp",
				dataType:"json",
				success:function(list){
					
					if(list.length == 0){
						var $noData = $("<li>").attr("id", "noData");
						$noData.append($("<div>").append("<i class='fa fa-coffee' aria-hidden='true' style='font-size:50px; line-height:80px; color:#c2c2c2; margin-bottom:-15px;'></i>"));
						$noData.append($("<div>").append("<p style='color:#c2c2c2;'>즐겨찾기한 카페가 없습니다!<br>카페 즐겨찾기를 눌러주세요!</p>"));
						
						$("#area ul").append($noData);
						
					}else{
						
						var $cFavoriteDiv = $("#area ul");
						
						$cFavoriteDiv.html("");
								
						$.each(list, function(index, value){
							var $cfavorite = $("<li>");
							
							var $content1 = $("<div>").attr({"id":"cafeArea", "onclick":"location.href='<%=conPath%>/cafeInfo.ca?c_no=" + value.c_no + "';"});
							
							var $content2 = $("<span>").attr("id", "imgArea");
							$content2.append($("<img>").attr("src", "<%=conPath %>/resources/fileupload/cafe/" + value.img_name));
							
							var $content3 = $("<div>").attr("id", "textArea");
							$content3.append($("<div>").attr("style", "font-size:27px; margin-top:-20px; width:100%; color:#ffc107;"));
							$content3.append($("<p>").attr("style", "margin-top:-10px; font-size:19px;").append(value.cafe_name));
							$content3.append($("<span>").attr("style", "margin-right:15px;").append("<i class='icon fa fa-eye fa-3x' style='font-size:13px;'></i> " + value.count));
							$content3.append($("<span>").attr("style", "margin-right:15px;").append("<i class='icon fa fa-pencil fa-3x' style='font-size:13px;'></i> " + value.review_count));
							$content3.append($("<span>").append("<i class='icon fa fa-star fa-3x' style='font-size:13px;'></i> " + value.favorite));
							
							var $favoriteBtn = $("<button>").attr({"id":"favoriteBtn", "onclick":"favoriteRm(this.value);", "value":value.f_no}).append("<i class='fa fa-fw fa-lg fa-star'></i>");
							
							
							$content1.append($content2);
							$content1.append($content3);
							$cfavorite.append($favoriteBtn);
							$cfavorite.append($content1);
							
							$cFavoriteDiv.append($cfavorite);
			              	
						});
					}
						
					
				},
				error:function(){
					console.log("서버와의 통신 실패!!");
				}
			});
      		
      	}
      	
      </script>
      
   	</main>
   	
    
</body>
</html>