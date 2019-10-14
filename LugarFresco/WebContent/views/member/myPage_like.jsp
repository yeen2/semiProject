<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.review.model.vo.Review, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	#div123{padding:15px; font-weight:bold; color:#666;}
	#cafeClick:hover{cursor:pointer; background:#dee2e6;}
	#noData{width:100%; height:100px; text-align:center; font-size:1.250em; font-weight:bold; margin-top:130px;}
	#noData p{margin-top:25px;}
	#profileImg{width:100px; height:100px;}
	#reviewImg{width:80px; height:80px;}
	#likeBtn{width:50px; height:50px; color:white; background:#dc3545; border:1px solid #dc3545;}
	#likeBtn:hover{cursor:pointer; background:#dee2e6; color:white; border:1px solid #dee2e6;}
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
              
            </div>
          </div>
        </div>
      </div>
     
     <script>
     	$(function(){
     		selectLikeList();
     		
     	});
     	
     	
     	function likeRm(value){
     		var rno = value;
 			var real = confirm("리뷰에 누른 좋아요를 취소하시겠습니까?");
     		
     		if(real){
     			
	     		$.ajax({
	     			url:"likeRm.mp",
					type:"post",
					data:{rno:rno},
					success:function(result){
						
						if(result == "1"){
							alert("적용되었습니다!");
							selectLikeList();
							
						}else{
							alert("좋아요 취소에 실패하였습니다.");
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
      	function selectLikeList(){
      		
      		$.ajax({
				url:"myLikeA.mp",
				dataType:"json",
				success:function(list){
					
					if(list.length == 0){
						var $noData = $("<div>").attr("id", "noData");
						$noData.append($("<div>").append("<i class='fa fa-coffee' aria-hidden='true' style='font-size:50px; line-height:80px; color:#c2c2c2; margin-bottom:-20%;'></i>"));
						$noData.append($("<div>").append("<p style='color:#c2c2c2;'>좋아요한 리뷰가 없습니다!<br>리뷰에 좋아요를 눌러주세요!</p>"));
						
						$("#review-like").append($noData);
						
					}else{
						
						var $rlikeDiv = $("#review-like");
						
						$rlikeDiv.html("");
						
						$.each(list, function(index, value){
							var $rlike = $("<div>").attr({"id":"cafeClick", "class":"timeline-post",
											"onclick":"location.href='<%=conPath%>/cafeInfo.ca?c_no=" + value.c_no + "';"});
							var $content1 = $("<div>").attr("class", "post-media");
							$content1.append($("<img>").attr({"id":"profileImg",
																		"src":"<%=conPath%>/resources/fileupload/cafe/" + value.img_name}));
							var $content2 = $("<div>").attr({"class":"content", "style":"margin-top:8px;"});
							$content2.append($("<h4>").append(value.cafe_name + "&nbsp;&nbsp;<label style='color:#ffc107;'>"
																	+ value.sum_avg + "</label>&nbsp;&nbsp;"));
							$content2.append($("<h5>").append(value.nickname));
							$content2.append("<p class='text-muted'><small>" + value.r_date + "</small></p>");
							
							var $content3 = $("<div>").attr("class", "post-content");
							$content3.append("<p>" + value.r_content + "</p>");
							
							<%-- for(int i=0; i<(value.imgList).length; i++){
								$content3.append("<span>").attr("id", "contentImgArea").append("<img>").attr({"id":"reviewImg", "src":"<%=conPath%>/resources/fileupload/review/" + value.imgList})
								
							} --%>
							
							var $content4 = $("<ul>").attr("class", "post-utility");
							$content4.append($("<li>").attr("class", "likes").append("<i style='color:#dc3545;' class='fa fa-fw fa-lg fa-heart'></i>좋아요 " + value.r_like));
							$content4.append($("<li>").attr("class", "shares").append("<i style='color:gray;' class='fa fa-fw fa-lg fa-thumbs-down'></i>신고 " + value.r_declare));
							
							var $likeBtn = $("<button>").attr({"id":"likeBtn", "onclick":"likeRm(this.value);", "value":value.r_no}).append("<i class='fa fa-fw fa-lg fa-heart'></i>");
							
							
							$content1.append($content2);
							$rlike.append($content1);
							$rlike.append($content3);
							$rlike.append($content4);
							
							$rlikeDiv.append($likeBtn);
							$rlikeDiv.append($rlike);
							$rlikeDiv.append("<br>");
			              	
						});
					}
					
					
				},
				error:function(){
					console.log("서버와의 통신 실패!!");
				}
			});
      		
      	}
      	
      </script>
      
      <!-- <script>
      	$(window).scroll(function(){
      		if($(window).scrollTop() >= $(document).height() - $(window).height()){
      			alert("111");
      		}
      	});
      </script> -->
   	</main>
   	
</body>
</html>