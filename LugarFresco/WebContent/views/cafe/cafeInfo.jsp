<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.cafe.model.vo.*, com.kh.review.model.vo.Review,
	java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
	Cafe c = (Cafe)request.getAttribute("c");
	ArrayList<Review> r = (ArrayList<Review>)request.getAttribute("r");
	String add = c.getAddress()+ c.getAddress_detail();

	
	// 즐겨찾기 확인
	int checkFavorite = 0;
	if(session.getAttribute("loginUser") != null){
		int sessionFavorite = (int)request.getAttribute("sessionFavorite");
		if(sessionFavorite > 0){
			checkFavorite = 1;
		}
	}
	
	// 카카오 공유하기
	int favorite = c.getFavorite();

	// 카페이미지
	String titleImg ="";
	String img="";

	for(int i=0; i<c.getImgList().size(); i++){
		if(c.getImgList().get(i).getImg_level() == 1){
			titleImg = c.getImgList().get(i).getImg_name();
		}else{
			img += c.getImgList().get(i).getImg_name() + ",";
		}
	}
	String [] imges = img.split(",");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.btn:focus, .page-link:focus{
		box-shadow:none !important;
	}
	.reviewCotent:hover{
		background: #F2F2F2;
	}
</style>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/common/bootstrap.min.css">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>

	<%@include file="../includes/main/header.jsp"%>

	<!-- Start top-category-widget Area -->
	<section class="top-category-widget-area pt-90 pb-90 ">

		<div class="container" style="">
			<div class="row">
				<div class="col-lg-4" style="width: 100%; height: 100%">
					<div class="single-cat-widget">
						<div class="content relative">
							<a href="#" target="_blank">
								<div class="thumb">
									<img style="width: 100%; height: 100%;"
										class="content-image img-fluid d-block mx-auto"
										src="<%=conPath %>/resources/fileupload/cafe/<%=imges[0]%>" alt="">
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4" style="width: 100%; height: 100%">
					<div class="single-cat-widget">
						<div class="content relative">
							<a href="#" target="_blank">
								<div class="thumb">
									<img style="width: 100%; height: 100%;"
										class="content-image img-fluid d-block mx-auto"
										src="<%=conPath %>/resources/fileupload/cafe/<%=imges[1]%>" alt="">
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4" style="width: 100%; height: 100%">
					<div class="single-cat-widget">
						<div class="content relative">
							<a href="#" target="_blank">
								<div class="thumb">
									<img style="width: 100%; height: 100%;"
										class="content-image img-fluid d-block mx-auto"
										src="<%=conPath %>/resources/fileupload/cafe/<%=imges[2]%>" alt="">
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End top-category-widget Area -->


	<!-- Start post-content Area -->
	<section class="post-content-area">
		<div class="container">
			<div class="row">
				<!-- 왼쪽부분 -->
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<div class="col-lg-8  col-md-4">
						 	<h2 style="margin-left: 30px; display: inline;">
						 		<%= c.getCafe_name() %>
						 	</h2>
						 	<!-- 평점 평균 -->
							<strong style="color: orange; margin-left: 10px; font-size: 30px; font-weight: bold;">
								<%= c.getSum_avg() %>
							</strong>
							
							<br><br>
							<!-- 조회수 -->
							<span style="margin-left: 30px;" style="font-size: small;">
								<i class="fa fa-eye" aria-hidden="true"></i> 
								<%= c.getCount() %>
								&nbsp;&nbsp;
							</span>
							<!-- 리뷰수 -->
							<span style="font-size: small;"> <i class="fa fa-pencil"
								aria-hidden="true"></i> 
								<%= c.getReview_count() %>
								&nbsp;&nbsp;
							</span>
							<!-- 즐겨찾기 수 -->
							<span style="font-size: small;"> <i class="fa fa-star"
								aria-hidden="true"></i> 
								<%= c.getFavorite() %>
								&nbsp;&nbsp;
							</span>
						</div>
						
						<!-- 리뷰쓰기버튼 + 즐겨칮기버튼 -->
						<div class="col-lg-4  col-md-4">
							<!--  카카오톡 공유하기  -->
							<a id="kakao-link-btn" href="javascript:sendLink()">
								<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
										width="40px" height="40px;">
							</a>
							&nbsp;
							<!-- 리뷰 작성하기 (모달창) 버튼 -->
							<!-- href="writeForm.re?c_no=<%=c.getC_no()%>&name=<%=c.getCafe_name()%>" -->
							<a class="btn" data-toggle="modal" id="review_btn"> 
								<i style="color: orange; font-size: 30px;" class="fa fa-pencil-square-o" aria-hidden="true"></i>
							</a>
							
							<!-- 즐겨찾기  -->
							<span class="btn pull-center"> 
								<% if(checkFavorite == 1){ %>
									<i id="favorite" style="color: orange; font-size: 30px;" class="fa fa-star" aria-hidden="true"></i>
								<% }else{%>
									<i id="favorite" style="color: orange; font-size: 30px;" class="fa fa-star-o" aria-hidden="true"></i>				
								
								<% } %>
							</span>
						</div>

					</div>
					
					
					<script>
						//즐겨찾기 
						$("#favorite").click(function(){
							//console.log("즐겨찾기 클릭");
							
							var login = "<%=session.getAttribute("loginUser") %>";
							var c_no = <%= c.getC_no()%>;
							
							if(login == "null"){
								alert("로그인 후 이용가능합니다.");
								
							}else{	// 로그인 했으면
								if($("#favorite").attr("class") == 'fa fa-star-o'){ //색깔 없으면
									//ajax
									$.ajax({
										url:"insertFavorite.ca",
										data:{c_no:c_no},
										type:"get",
										success:function(str){
											if(str == '성공'){
												console.log("즐겨찾기 추가 성공");
												$("#favorite").attr('class','fa fa-star').css("color","orange");
											}else{
												console.log("즐겨찾기 추가 실패");
											}
										},error:function(){
											console.log("ajax 서버 실패");
										}
									});

								}else{ // 색깔 있으면
									$.ajax({
										url:"deleteFavorite.ca",
										data:{c_no:c_no},
										type:"get",
										success:function(str){
											if(str == '성공'){
												console.log("즐겨찾기 제거 성공");
												$("#favorite").attr('class','fa fa-star-o').css("color","orange");
											}else{
												console.log("즐겨찾기 제거 실패");
											}
										},error:function(){
											console.log("ajax 서버 실패");
										}
									});
								}
							} //login if
						});
						
						//리뷰
						$("#review_btn").click(function() {
							
							var login = "<%=loginUser %>";
							var isBlack = "<%= loginUser.getIsBlack()%>";
							
							if(login == "null"){
								alert("로그인 후 이용가능합니다.");
							}
							
							if(isBlack == "Y"){
								alert("현재 블랙리스트여서 리뷰 작성 불가");
							}else{
								location.href='writeForm.re?c_no=<%=c.getC_no()%>&name=<%=c.getCafe_name()%>';
							}
						});
					</script>
					
					<!-- 카카오 공유하기 -->
					<script type='text/javascript'>
					  //<![CDATA[
					    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
					    Kakao.init('78d21eb8c5c03e01cb0cf78534c01fca');
					    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
					    function sendLink() {
					    	
					    	var favorite = <%=c.getFavorite()%>
					    	var count = <%=c.getCount()%>
					    	
					      Kakao.Link.sendDefault({
					        objectType: 'feed',
					        content: {
					          title: '${c.cafe_name}',
					          description: '#LugarFresco,#sns 핫한 카페,#요즘 뜨는 카페,#${c.cafe_name},#${c.address},#${c.favorite}',
					         /*  imageUrl: 'http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png', */
					         imageUrl: 'http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
					         link: {
					            mobileWebUrl: 'http://192.168.30.186:8030/LugarFresco/cafeInfo.ca?c_no=${c.c_no}',
					            webUrl: 'http://192.168.30.186:8030/LugarFresco/cafeInfo.ca?c_no=${c.c_no}'
					          }
					        },
					        social: {
					          likeCount: favorite,
					          commentCount: count,
					          sharedCount: 845
					        }, 
					        buttons: [
					          {
					            title: '웹으로 보기',
					            link: {
					              mobileWebUrl: 'http://192.168.30.186:8030/LugarFresco/cafeInfo.ca?c_no=${c.c_no}',
					              webUrl: 'http://192.168.30.186:8030/LugarFresco/cafeInfo.ca?c_no=${c.c_no}'
					            }
					          },
					          {
					            title: '앱으로 보기',
					            link: {
					              mobileWebUrl: 'http://192.168.30.186:8030/LugarFresco/cafeInfo.ca?c_no=${c.c_no}',
					              webUrl: 'http://192.168.30.186:8030/LugarFresco/cafeInfo.ca?c_no=${c.c_no}'
					            }
					          }
					        ]
					      });
					    }
					  //]]>
					</script>
					
					
					
<!------------------------------------------------- 리뷰 ---------------------------------------------->					
					
					
					<div class="single-post row" style="margin-bottom: 20px; ">
						
						<% if(r.isEmpty()){ %>
							<div class="single-testimonial item d-flex flex-row reviewCotent" 
									style="width: 100%; height: 100%; margin-bottom: 10px;">
									
								<h4 style="color: gray; text-align: center; margin: auto;">
									작성된 리뷰가 없습니다. 가장 먼저 리뷰를 작성해 주세요!!</h4>
							</div>
						<% }else{ %>
						
						<% for(int i=0; i<r.size(); i++){ %> <!-- 리뷰 for문 -->
						
							<div class="single-testimonial item d-flex flex-row reviewCotent" 
									style="width: 100%; height: 100%; margin-bottom: 10px;">
								<!-- 왼쪽 : 작성자 사진 + 닉네임 -->
								<div class="thumb" style="margin-right: 20px; width: 10%; ">
									<div style="width: 56px; height: 56px; ">
										<img style="width: 100%; height: 100%;  border-radius: 50%;"
											class="img-fluid"
											src="<%=conPath%>/resources/fileupload/profile/<%=r.get(i).getProfile()%>" alt="">
									</div>
									
									<h6 style="text-align: center; margin-top: 5px; padding-right: 10px;">
										<%=r.get(i).getNickname() %>
									</h6>
								</div>
								<!-- 오른쪽 : 리뷰칸 -->
								<div class="desc" style="width: 90%;">
								
									<div class="re_con_top" style="width: 100%;">
										&nbsp;&nbsp;
										<span>맛</span> 
										<i class="fa fa-star" aria-hidden="true" style="color: blue;">
											<%=r.get(i).getFlavor() %>&nbsp;
										</i> 
										&nbsp;&nbsp;
										<span>가격</span> 
										<i class="fa fa-star" aria-hidden="true" style="color: blue;">
											<%=r.get(i).getPrice() %>&nbsp;
										</i> 
										&nbsp;&nbsp;
										<span>서비스</span>
										<i class="fa fa-star" aria-hidden="true" style="color: blue;">
											<%=r.get(i).getService() %>&nbsp;
										</i>
										<hr>
									</div>
									
									<div class="re_con_bottom"  style="width: 100%; "> <!-- 아래공간 div로 묶기 -->
									<p style="margin-bottom: 0; color: gray;">날짜</p>
									<p style="color:black; margin-bottom: 0">
										<%=r.get(i).getR_content() %>
									</p>
				
			
									<br>
									<!-- img공간 -->
									<% for (int j = 0; j < r.get(i).getImgList().size(); j++) { %> <!-- 리뷰이미지 for문 -->
									<div>
										<div class="col-3"
											style="width: 80px; height: 80px; float: left; margin: 5px; padding:0;">
											<a data-toggle="modal" style="margin: auto;" id="review_img_detail">
											
											<input type="hidden" value="<%=r.get(i).getImgList().get(j).getImg_name() %>">
											<img style="width: 100%; height: 100%; display: cover;"
												src="<%=conPath%>/resources/fileupload/review/<%=r.get(i).getImgList().get(j).getImg_name() %>">
											
											</a>
										</div>
									</div>
									<% } %> <!-- 리뷰이미지 for문 -->
									
									
									<!-- 신고 버튼 -->
									<!--  href="#reportModal" href="javascript:checkSession();" -->
									<% if(r.get(i).getDeclare() == 0){ %>
									<a class="btn-outline-danger btn pull-right declare_btn" data-toggle="modal" 
										style="margin: auto;">
										<input type="hidden" value="<%= r.get(i).getR_no()%>">
										
										<i class="fa fa-thumbs-down" ></i>
										&nbsp;
										<span><%=r.get(i).getR_declare() %></span>
									</a>
									<%} else {%>
									<a class="btn-danger btn pull-right declare_btn" data-toggle="modal" 
										style="margin: auto;">
										<input type="hidden" value="<%= r.get(i).getR_no()%>">
										
										<i class="fa fa-thumbs-down" ></i>
										&nbsp;
										<span><%=r.get(i).getR_declare() %></span>
									</a>
									<% } %>
									
	
	
									<!-- 좋아요 버튼 -->
									<% if(r.get(i).getLike() == 0){ %>
									<a class="btn-outline-primary btn pull-right like_btn" data-toggle="modal"> 
										<input type="hidden" value="<%= r.get(i).getR_no()%>">
										<i id="sss2-1" class="fa fa-thumbs-up" aria-hidden="true" style="size: smaill"></i> 
										&nbsp;
										<span><%=r.get(i).getR_like() %></span>
									</a>
									<%} else {%>
									<a class="btn-primary btn pull-right like_btn" data-toggle="modal" > 
										<input type="hidden" value="<%= r.get(i).getR_no()%>">
										<i id="sss2-1" class="fa fa-thumbs-up" aria-hidden="true" style="size: smaill"></i> 
										&nbsp;
										<span><%=r.get(i).getR_like() %></span>
									</a>
									<% } %>
									
									</div> <!-- 아래공간 div로 묶기 -->
									
								</div>
							</div>
						
							<div class="single-testimonial item d-flex flex-row" style="background: none; padding: 5px;"></div>
							
							<% } %> <!-- 리뷰 for문 -->
						
						<% } %> <!-- if문 -->
						<!--  -->
					</div>
					<script type="text/javascript">
							
							
							// 좋아요 버튼
							$(document).on("click", ".like_btn", function(){
								
								console.log($(this).children().eq(2).text());
								
								var this_like = this;
								var r_no = $(this).children().eq(0).val();
								var like_count = $(this).children().eq(2).text();
								var login = "<%=session.getAttribute("loginUser")%>";
								
								if(login == "null"){
									alert("로그인 후 이용가능합니다.");
								}else{
									
									if($(this).hasClass("btn-outline-primary")){ //색깔 없으면

										console.log("색없음");
										//ajax
										$.ajax({
											url:"insertLike.re",
											data:{r_no:r_no},
											type:"get",
											success:function(str){
												if(str == '성공'){
													console.log("좋아요 추가 성공");
													$(this_like).removeClass("btn-outline-primary").addClass("btn-primary");
													$(this_like).children().eq(2).text(Number(like_count)+1);
												}else{
													console.log("좋아요 추가 실패");
												}
											},error:function(){
												console.log("ajax 서버 실패");
											}
										});

									}else{ // 색깔 있으면

										console.log("색있음");
										$.ajax({
											url:"deleteLike.re",
											data:{r_no:r_no},
											type:"get",
											success:function(str){
												if(str == '성공'){
													console.log("좋아요 제거 성공");
													$(this_like).removeClass("btn-primary").addClass("btn-outline-primary");
													$(this_like).children().eq(2).text(Number(like_count)-1);
												}else{
													console.log("좋아요 제거 실패");
												}
											},error:function(){
												console.log("ajax 서버 실패");
											}
										});
									}
									
								}
							});
							

							// 신고 버튼
							$(document).on("click", ".declare_btn", function(){
								
								var this_declare = this;
								var r_no = $(this).children().eq(0).val();
								var login = "<%=session.getAttribute("loginUser") %>";
								
								if(login == "null"){
									alert("로그인 후 이용가능합니다.");
								}else{
									
									if($(this).hasClass("btn-outline-danger")){ //색없으면
										// 모달 hidden에 val값으로 넣어주기
										$("#declare_r_no").val(r_no);
										//열기
										$('#declareModal').modal("show");
										
									}else{
										alert("이미 신고하신 리뷰입니다!");
									} 
								}
							});
							
							
							// 리뷰사진 상세보기
							$(document).on("click", "#review_img_detail", function(){
								
								var this_img = this;
								var this_src = $(this).children().eq(1).attr('src');
								
								console.log(this_src);
								
								// 모달 hidden에 val값으로 넣어주기
								//$("#review_img_name").val(img);
								$("#img_spot").attr('src',this_src);
								
								//열기
								$('#reviweImgModal').modal("show");
								
							});
							
							
							
					</script>
					
					<div class="single-post row"></div>

					
				</div>
				
				<!-- 오른쪽부분 : 지도 + 카페정보 -->
				<div class="col-lg-4 sidebar-widgets">
					<div class="widget-wrap">
						
						<!-- 1. 타이블 사진 -->
						<div class="single-sidebar-widget ads-widget">
							<div>
								<img style="width: 100%; height: 100%;"
									class="img-fluid" 
									src="<%=conPath%>/resources/fileupload/cafe/<%=titleImg%>" alt="">
							</div>
						</div>
						
						<!-- 2. 카페정보 -->
						<div class="single-sidebar-widget user-info-widget">
							<h4>카페 정보</h4>
							<br>
							<ul class="social-links">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-github"></i></a></li>
								<li><a href="#"><i class="fa fa-behance"></i></a></li>
							</ul>
							<p><%=c.getContent()%></p>
						</div>
						
						<!-- 3. 지도  -->
						<div class="single-sidebar-widget ads-widget">
							<h4 style="text-align: center;">카페 위치</h4>
							<br>
							<p style="text-align: center;"><%=c.getAddress() %>&nbsp;<%=c.getAddress_detail() %></p>
							
							<div id="map" style="height: 300px; margin-top: 20px; margin-bottom: 10px;"></div>
							<a href="https://map.kakao.com/link/to/<%=add%>,37.402056,127.108212"
								class="genric-btn primary-border small" style="text-align: center; margin: auto;">
								<span style="color: orange;">" <%=c.getCafe_name()%> "</span> &nbsp; 
								<span style="color: black;">로 오는 길</span>
							</a>
						</div>


						
						<div class="single-sidebar-widget tag-cloud-widget">
							<h4 class="tagcloud-title">Tag Clouds</h4>
							<ul>
								<li><a href="#">Cafe</a></li>
								<li><a href="#">Food</a></li>
								<li><a href="#">LifeStyle</a></li>
								<li><a href="#">LugarFresco</a></li>
								<li><a href="#">Branch</a></li>
								<li><a href="#">HandDrop</a></li>
								<li><a href="#">Aamericano</a></li>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End post-content Area -->
	
	
	
	<!-- 지도  -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78d21eb8c5c03e01cb0cf78534c01fca&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3 // 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(
			'${c.address}' + '${c.address_detail}',
				function(result, status) {

					// 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {

						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">${c.cafe_name}</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>


<!--  -------------------------------------신고하기 모달------------------------------------- --> 

		<div class="modal fade" id="declareModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true"
					data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog">
				<div class="modal-content">
				
					<div class="modal-header">
						<h5 class="modal-title" id="modal">신고하기</h5>
						<!-- 닫기버튼 -->
						<button class="close btn" type="button" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<form action="declare.re" method="post" id="declare_form">
							<div class="form-group">
								<label name="category">신고항목</label> 
								<select name="category" class="form-control" id="category">
									<option value="0">----</option>
									<option value="1">도배로 인한 신고</option>
									<option value="2">불법 홍보로 인한 신고</option>
									<option value="3">허위 사실로 인한 신고</option>
									<option value="4">기타</option>
								</select>
							</div>
							<div class="form-group">
								<label for="content">신고내용</label>
								<textarea name="content" style="height: 180px" class="form-control" id="declare_content"></textarea>
							</div>
							
							<input type="hidden" name="r_no" id="declare_r_no">
							<input type="hidden" name="cate" id="cate">
							<input type="hidden" name="c_no" value="<%=c.getC_no()%>">
							
							<div>
								<input type="checkbox" name="declare_check" id="declare_check">
								<label for="declare_check">한번 신고하시면 취소할 수 없습니다. 동의하시면 체크해주세요.</label>
							</div>
							<div class="modal-footer">
								<button class="btn btn-secondary" type="button" id="declare_reset">취소</button>
								<button type="submit" class="btn btn-danger" id="declare_submit" >신고하기</button>
							</div>
							
							
							<script type="text/javascript">
								//신고모달창 닫기
								$("#declare_reset, .close").click(function() {
									$('#declareModal').modal("hide");
								});
								
								$("#declare_submit").attr("disabled", true);
								
								// 신고동의 체크
								$("#declare_check").on('click', function() {
									if($("input:checkbox[name='declare_check']").is(":checked")){
										$("#declare_submit").removeAttr("disabled");
									}else{
										$("#declare_submit").attr("disabled",true);
									}
								});
								
								// 신고버튼	
								$("#declare_submit").click(function() {
									var category = $("#category").val();
									var content = $("#declare_content").val();
									var cate = $("#category option:selected").text();
									
									// cate hidden에 값넣어주기
									$("#cate").val(cate);
									
									if(category == 0){
										alert("신고유형을 선택해 주세요");
										$('#declareModal').modal();
										return false;
									}
									if(content.length == 0){
										alert("신고내용을 입력해주세요");
										$('#declareModal').modal();
										return false;
									}
								});
								
								
							</script>
						</form>
						
					</div>
				</div>
			</div>
		</div>
		
		
		
		<!----------------------------------------- 리뷰사진 디테일  ---------------------------------------------->

		<div class="modal fade" id="reviweImgModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true"
					data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog">
				<div class="modal-content">
				
					<div class="modal-header">
						<h5 class="modal-title" id="modal">LugarFresco</h5>
						<!-- 닫기버튼 -->
						<button class="close btn" type="button" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">
					
						<div class="form-group" style="margin: auto; width: 350px; height: 350px;">
							<img style="width: 100%; height: 100%; margin: auto;" 
								id="img_spot" >
							<input type="hidden" id="review_img_name">
						</div>

						<div class="modal-footer">
						
						</div>
						
						<script type="text/javascript">
							//리뷰창 닫기
							$("#img_close, .close").click(function() {
								$('#reviweImgModal').modal("hide");
							});
				
						</script>
					
						
					</div>
				</div>
			</div>
		</div>


	<%@include file="../includes/main/footer.jsp"%>
	
					
	<script src ="<%=conPath%>/resources/js/pooper.js"></script>
	<script src ="<%=conPath%>/resources/js/jquery.min.js"></script>
	<script src ="<%=conPath%>/resources/js/bootstrap.min.js"></script>
</body>
</html>