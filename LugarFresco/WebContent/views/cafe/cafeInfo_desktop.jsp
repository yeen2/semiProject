<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cafe.model.vo.Cafe"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
	Cafe c = (Cafe)request.getAttribute("c");
	String add = c.getAddress()+ c.getAddress_detail();
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Lugar Fresco</title>
<!-- Main CSS-->
<!-- Font-icon css-->

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/cafe.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/common/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/common/bootstrap.min.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
	.btn:focus{
		box-shadow:none !important;
	}
</style>
</head>

<body>

		<div class="container">
	<%@include file="../includes/main/header.jsp"%>
		<!-- 연습 -->
		
			<div class="blog-grids-main row text-left" style="margin: 70px 0px 70px 0px; border: 1px solid black;">
				<div class="col-lg-3 col-md-6 blog-grid-img px-0">
					<img src="">
				</div>
				<div class="col-lg-3 col-md-6 blog-grid-img px-0">
					<img src="">
				</div>
				<div class="col-lg-3 col-md-6 blog-grid-img px-0">
					<img src="">
				</div>
				<div class="col-lg-3 col-md-6 blog-grid-img px-0">
					<img src="">
				</div>
			</div>
			
		<!-- 연습 -->
		
		<!-- 맨위에 4개 사진  -->
		<div class="jumbotron row"
			style="background: none; margin-top:5px; padding-left: 200px; padding-right: 200px;">
			<div class="col-3" style="border: 1px solid black;">
				<div class="profile-cover-img">
					<img src="<%=conPath%>/resources/images/sample_coffee.png" alt=""
						style="height: 270px;">
				</div>

			</div>
			<div class="col-3" style="border: 1px solid black;">
				<div class="profile-cover-img">
					<img src="<%=conPath%>/resources/images/sample_coffee.png" alt=""
						style="height: 270px;">
				</div>

			</div>
			<div class="col-3" style="border: 1px solid black;">
				<div class="profile-cover-img">
					<img src="<%=conPath%>/resources/images/sample_coffee.png" alt=""
						style="height: 270px;">
				</div>

			</div>
			<div class="col-3" style="border: 1px solid black;">
				<div class="profile-cover-img">
					<img src="<%=conPath%>/resources/images/sample_coffee.png" alt=""
						style="height: 270px;">
				</div>

			</div>
		</div>
		
		
		

		<div class="profile-wrapper mt-5" style="margin: 100px !important; padding-right: 200px; padding-left: 200px">
		<div class="profile-section-user" style="margin-left: 30px;">

			<!-- 카페사진+이름  -->
			<%-- <div class="profile-cover-img" style="height: 500px; margin:auto;">
					<img src="<%=conPath%>/resources/images/sample_coffee.png" 
						width="100%;" height="100%;">
				</div> --%>
			<%-- 				<div class="profile-info-brief p-3">
					<!-- <img class="img-fluid user-profile-avatar" src="https://bootdey.com/img/Content/avatar/avatar6.png" alt=""> -->
					<div class="text-center">
						<h5 class="text-uppercase mb-4 mt-3"><%= c.getCafe_name() %></h5>
						<p class="text-muted fz-base"><%= c.getAddress() %><%= c.getAddress_detail() %></p>
					</div>

				</div> --%>


			<!-- 왼쪽부분-->

			<div class="hidden-sm-down">
			
				<!-- 1. 메인사진  -->
				<div class="profile-info-general p-4"
					style="margin-top: 30px; margin-bottom: 30px;">
					<h6 class="mb-3"></h6>
					<div style="border: 1px solid black; height: 300px;">
						<img src="">
					</div>
				</div>
				
				<hr class="m-0">
				
				<!-- 2. 카페정보 -->
				<div class="profile-info-contact p-4"
					style="margin-top: 20px; margin-bottom: 20px;">
					<h6 class="mb-3">카페 정보</h6>
					<div>
						<%=c.getContent()%>
					</div>
				</div>

				<hr class="m-0">
				
				<!-- 3. 카페 위치 -->
				<div class="profile-info-general p-4" style="margin-top: 20px; margin-bottom: 20px;">
					<h6 class="mb-3">카페 위치</h6>
					<div id="map"
						style="height: 300px; margin-top: 20px; margin-bottom: 10px;">
					</div>
					<a href="https://map.kakao.com/link/to/<%=add%>,37.402056,127.108212">
						<span style="color: orange;">" <%=c.getCafe_name()%> "</span> &nbsp; 
						<span style="color: black;">로 오는 길</span>
						<span class="glyphicon glyphicon-hand-right"></span>
					</a>

				</div>

				<!-- 	<div class="profile-info-general p-4"
					style="margin-top: 30px; margin-bottom: 30px;">
					<h6 class="mb-3"></h6>
					<div style="border: 1px solid black; height: 300px;">
				
					</div>
				</div> -->

				<!-- /.profile-info-general -->

			</div>
			<!-- /.hidden-sm-down -->
		</div>


		<!-- 지도  -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78d21eb8c5c03e01cb0cf78534c01fca&libraries=services"></script>
		<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder
						.addressSearch(
								'${c.address}'+ '${c.address_detail}',
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

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



		<!--오른쪽 부분 -->
			<div class="profile-section-main" style="margin-left: 20px;">
				<div style="height: 5%; margin-bottom: 30px;">
				
					<div class="form-row">
						<div class="col-6" style="margin: auto;">
							<!-- 카페명 -->
							<h3 style="margin-left: 30px; display: inline;">
								 <%= c.getCafe_name() %>
							</h3>
							<!-- 평점 평균 -->
							<strong style="color: orange; margin-left: 10px; font-size: 30px; font-weight: bold;">
								<%= c.getSum_avg() %>
							</strong>
							<br>
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


						<div class="col-6">
							<!-- 리뷰 작성하기 (모달창) 버튼 -->
							<a class="btn" data-toggle="modal" href="#registerModal"> 
								<i style="color: orange; font-size: 30px;" class="fa fa-pencil-square-o" aria-hidden="true"></i>
							</a>
							<!-- 즐겨찾기  -->
							<span class="btn pull-center"> 
								<i id="sss" style="color: orange; font-size: 30px;" class="fa fa-star-o" aria-hidden="true"></i>
							</span>
						</div>
					</div>
				</div>

				
				<script>
					$("#sss").click(function(){
						console.log($("#sss").attr("class"));	
						if($("#sss").attr("class") == 'fa fa-star-o'){
							$("#sss").attr('class','fa fa-star').css("color","orange");
						}else{
							$("#sss").attr("class","fa fa-star-o").css("color","orange");
							console.log($("#sss").attr("class"));
						}
					});
			
			</script>



				<!-- /.nav-tabs -->
				<!-- Tab panes -->
				<%-- <div class="tab-content profile-tabs-content">
					<div class="tab-pane active" id="profile-overview" role="tabpanel">
						<hr>
						<!-- /.post-editor -->
						<div class="stream-posts mt-3">
							<div class="stream-post" style="width: 90%;">
								<div class="sp-author" style="height: 100px;">
									<a href="#" class="sp-author-avatar"><img
										src="https://bootdey.com/img/Content/avatar/avatar6.png"
										alt=""><br>
									<br>
									<i style="color: gray;" class="fa fa-heart" aria-hidden="true">30&nbsp;</i><i
										style="color: gray;" class="fa fa-thumbs-down"
										aria-hidden="true">90</i> </a>
									<button class="btn btn-primary">버튼</button>
									<h6 class="sp-author-name">
										<a href="#">John Doe</a>
									</h6>
								</div>
								<div class="sp-content" style="height: 340px;">
									<div class="sp-info">
										맛&nbsp;
										<i class="fa fa-star" aria-hidden="true" style="color: blue;">5&nbsp;</i> 
										가격&nbsp;
										<i class="fa fa-star" aria-hidden="true" style="color: blue;">5&nbsp;</i>
										서비스&nbsp;
										<i class="fa fa-star" aria-hidden="true" style="color: blue;">5&nbsp;</i>


										<!-- 신고 버튼 -->
										<a class="btn btn-danger mx-1 mt-2 pull-right"
											data-toggle="modal" href="#reportModal"><i
											class="fa fa-thumbs-down" aria-hidden="true"></i></a>


										<!-- 좋아요 버튼 -->
										<a class="btn btn-primary mx-1 mt-2 pull-right"
											data-toggle="modal" href="#"> <i id="sss2-1"
											class="fa fa-heart-o" aria-hidden="true"></i>&nbsp;30
										</a>

										<script>
										$("#sss2-1").click(
												function() {
								
													if($("#sss2-1").attr("class") == "fa fa-heart-o"){
														$("#sss2-1").attr('class','fa fa-heart');
													}else{
														$("#sss2-1").attr('class','fa fa-heart-o');
														
													}
												});
									</script>

									</div>
									<div>
										<p class="sp-paragraph mb-0">
											리뷰내용
										</p>
									</div>

									<!-- 리뷰 사진 -->
									<div style="border: 1px solid black; height: 100px;" class="row mt-1">
										<div class="col-3 profile-cover-img" style="border: 1px solid black;">
											<img src="<%=conPath%>/resources/images/sample_coffee.png" style="height: 100%;">
										</div>
										
										<div class="col-3 profile-cover-img" style="border: 1px solid black;">
											<img src="<%=conPath%>/resources/images/sample_coffee.png" style="height: 100%;">
										</div>
										
										<div class="col-3 profile-cover-img" style="border: 1px solid black;">
											<img src="<%=conPath%>/resources/images/sample_coffee.png" style="height: 100%;">
										</div>
										
										<div class="col-3 profile-cover-img" style="border: 1px solid black;">
											<img src="<%=conPath%>/resources/images/sample_coffee.png" style="height: 100%;">
										</div>

									</div>
								</div>
								<!-- /.sp-content -->
							</div>
							<!-- /.stream-post -->
						</div>
					</div> --%>




<!---------------------------------- review div ------------------------------------->

				<div class="single-testimonial item d-flex flex-row" 
					style="border-bottom: 1px solid gray; border-top: 1px solid gray;">

					<div  style="margin-right: 0px !important; width: 15%;">
						<img class="img-fluid" src="<%=conPath%>/resources/img/elements/user1.png" alt="">
						<div>
							<h5 style="text-align: center; margin-top: 5px;">닉네임</h5>
						</div>
					</div>

					<div class="desc" style="margin-left: 30px;">
						<!-- 맛, 가격, 서비스 평점 + 신고 ,좋아요 -->
						<div class="sp-info">
							맛&nbsp;
							<i class="fa fa-star" aria-hidden="true" style="color: blue;">5&nbsp;</i> 
							가격&nbsp; 
							<i class="fa fa-star" aria-hidden="true" style="color: blue;">5&nbsp;</i> 
							서비스&nbsp; 
							<i class="fa fa-star" aria-hidden="true" style="color: blue;">5&nbsp;</i>
						</div>
						
						<hr>
						
						<p>Do you want to be even more successful? Learn to love
							learning and growth. The more effort you put into improving your
							skills, the bigger the payoff you.
						</p>
							
						
							<!-- 신고 버튼 -->
							<!--  href="#reportModal" href="javascript:checkSession();" -->
							<a class="btn btn-danger mx-1 mt-2 pull-right" data-toggle="modal" id="declare_btn"
								style="margin: auto;">
								<i class="fa fa-thumbs-down" aria-hidden="true"></i>
							</a>

							<!-- 좋아요 버튼 -->
							<a class="btn btn-primary mx-1 mt-2 pull-right" data-toggle="modal" > 
								<i id="sss2-1" class="fa fa-heart-o" aria-hidden="true"></i>
								&nbsp;30
							</a>
						<!-- img공간 -->
						<% for(int i=0; i<5; i++){ %>
						<div>
							<div class="col-3" 
								style="width: 80px; height: 80px; border: 1px solid gray; float: left; margin: 5px;">
							</div>
						</div>
						<% }%>
						
					</div>
					
				</div> <!-- review div -->
				
				<!-- /.tab-content -->
				</div>
				<!-- /.profile-section-main -->
			</div>
		</div>

		<script type="text/javascript">
			$("#declare_btn").click(function() {
				var login = "<%=session.getAttribute("loginUser") %>"
				
				if(login == "null"){
					alert("로그인 후 이용가능합니다.");
				}else{
					$('#declareModal').modal("show"); //열기
				}
			});
		</script>
		
		<%@include file="../includes/main/footer.jsp"%>


<!--  -------------------------------------리뷰 모달------------------------------------- --> 


		<!-- 리뷰작성하기 모달창 -->
		<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
			aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog" style="max-width: 1000px">
			<div class="modal-content">
				<!-- modal 1  -->

				<div class="modal-header">
					<!-- modal header -->
					<h5 class='col-12 modal-title text-center'>
						리뷰작성
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"> &times; </span>
						</button>
					</h5>
				</div>
				<div class="modal-body">

					<form action="write.re" method="post">
						<div class="form-row">
							<!-- form-row : 하나의 행을 여러 열로 나눌때 사용한다. -->
							<div class="col-6">
								<span style="color: orange;">
									"<%= c.getCafe_name() %>" &nbsp;
								</span> 
								<span>에 대한 솔직한 리뷰를 써주세요.</span>
							</div>
	
							<!-- 평점 -->
							<div class="form-group col-2" align="center">
								<label>맛</label> <select name="flavor" id="flavor" class="form-control">
									<option value="0">----</option>
									<option value="1">★</option>
									<option value="2">★★</option>
									<option value="3">★★★</option>
									<option value="4">★★★★</option>
									<option value="5">★★★★★</option>
								</select>
							</div>

							<div class="form-group col-2" align="center">
								<label>서비스</label> <select name="service" id="service" class="form-control">
									<option value="0">----</option>
									<option value="1">★</option>
									<option value="2">★★</option>
									<option value="3">★★★</option>
									<option value="4">★★★★</option>
									<option value="5">★★★★★</option>
								</select>
							</div>

							<div class="form-group col-2" align="center">
								<label>가격</label> <select name="price" id="price" class="form-control">
									<option value="0">----</option>
									<option value="1">★</option>
									<option value="2">★★</option>
									<option value="3">★★★</option>
									<option value="4">★★★★</option>
									<option value="5">★★★★★</option>
								</select>
							</div>
						</div>

						<div class="form-row mt-5">
							<div class="col-2" style="border: 1px solid black;">사진</div>
							<div class="col-10">
								<textarea name="content" id="content" placeholder="영업시간, 주차유무, 메뉴 등 적어주세요"
									style="height: 130px; width: 800px" class="form-control">
								
								</textarea>

							</div>
						</div>

						<div class="form-group mt-5">
							<input type=button style="WIDTH: 60pt; HEIGHT: 60pt"
								value="사진올리기">
						</div>

						<div class="modal-footer">
							<div class="col-12 text-center">
								<button class="btn btn-secondary" type="button"
									data-dismiss="modal"
									style="border-radius: 80px; margin: auto; WIDTH: 100pt; HEIGHT: 60pt; margin-right: 30px;">취소</button>

								<button type="submit" class="btn btn-primary" id="review_submit" onclick="reviewValidate();"
									style="border-radius: 80px; margin: auto; WIDTH: 100px; HEIGHT: 60px; text-align: center">등록</button>
							</div>

						</div>
						<script type="text/javascript">
							
							function reviewValidate(){
								
								var flavor = $("#flavor");
								var service = $("#service");
								var price = $("#price");
								
								if(taste.val() == 0){
									alert("별점 선택해주세요.");
									return false;
								}
								
							});
							
							$(document)
									.ready(
											function() {
												$('#review_submit')
														.click(
																function(event) { //<-- 서브밋을 클릭하면 

																	console
																			.log("제이쿼리 들어와따");

																	var count = $(
																			'select option:selected')
																			.val(); //<-- 셀렉티드 하위의 옵션에서 선택된 값을 가져오는데 
																	if (count == 0) //<-- 첫번쨰 벨류에다가 0을 넣었으니까 0으로 검사해서 0이면 안선택한거 
																	{
																		alert("평점을 선택해주세요!");
																	} else {
																		//셀렉트 함! 
																		return;
																	}
																	event
																			.preventDefault();
																});
											});
						</script>
					</form>
					<!-- form -->
				</div>

			</div>
		</div>
	</div>

		


<!--  -------------------------------------신고하기 모달------------------------------------- --> 

		<div class="modal fade" id="declareModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true"
					data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog">
				<div class="modal-content">
				
					<div class="modal-header">
						<h5 class="modal-title" id="modal">신고하기</h5>
						<!-- 닫기버튼 -->
						<button class="close" type="button" aria-label="Close"; ">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<form action="declare.re" method="post" id="declare_form">
							<div class="form-group">
								<label for="">신고제목</label> 
								<select name="category" class="form-control" id="category">
									<option value="0">----</option>
									<option value="1">도배로 인한 신고</option>
									<option value="2">불법 홍보로 인한 신고</option>
									<option value="3">허위 사실로 인한 신고</option>
									<option value="4">기타</option>
								</select>
							</div>
							<div class="form-group">
								<label for="">신고내용</label>
								<textarea name="content" style="height: 180px" class="form-control" ></textarea>
							</div>
							<div class="modal-footer">
								<button class="btn btn-secondary" type="button" id="declare_reset">취소</button>
								<button type="submit" class="btn btn-danger" id="declare_submit" >신고하기</button>
							</div>
							<%-- <input type="hidden" name="m_no" value="<%= loginUser.getM_no()%>"> --%>
							
							<script type="text/javascript">
							
								$("#declare_reset").click(function() {
									$('#declareModal').modal("hide");
								});
								
								$("#declare_submit").click(function() {
									var cate = $("#category").val();
									
									if(cate == 0){
										alert("신고유형을 선택해 주세요");
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



	<%@include file="../includes/main/footer.jsp"%>
	
<script src ="<%=conPath%>/resources/js/pooper.js"></script>
<script src ="<%=conPath%>/resources/js/jquery.min.js"></script>
<script src ="<%=conPath%>/resources/js/bootstrap.min.js"></script>

	
	
</body>
</html>