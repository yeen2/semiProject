<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String keyword = (String)request.getAttribute("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@include file="../includes/main/header.jsp"%>

	<!-- Start destinations Area -->
	<section class="destinations-area section-gap">
		<div class="container"> <!-- 부트스트랩 flex의 시작!! -->
		
			<!-- 타이틀 -->
			<!-- container안에 크게 item이 제목, 카페리스트, 지도 부분 3개로 나뉨 -->
			<!-- 카페리스트와 지도는 inline-flex로 붙이고 -->
			<!-- 카페리스트의 item부분은 행안에 열은 inline-flex와 새로운 행은 flex로 나눌꺼임-->
			
			<!-- --------------첫번째 아이템 요놈은 block으로 카페리스트와 지도가 밑으로 내려가게끔 함 -->
			<div class="row d-flex justify-content-center">
				<h4 style="color: orange;">"<%= keyword %>"
					맛집 인기 순위
				</h4>
			</div>
			
			
			<!-- 시작부분 카페리스트와 지도를 한 div로 담는다.-->
			<div class="row align-items-start"> <!-- 카페리스트 div1를 start로 위로 땡겨준다. -->
				<div class="row col-lg-8 d-inline-flex"> <!-- 카페리스트부분옆에 지도가 붙도록 하는 div2 -->
					<div class="row col-lg-12"> <!-- 왼쪽 col8만큼 카페리스트를 12만큼 채우게 하도록 하는 div3 -->
					<%for(int i=0; i<1; i++){ %>
						<div class="row d-flex col-lg-12"> <!-- 행의 시작이 flex가 되도록 하는 div4 -->
							<div class="col-lg-6"> <!-- 12만큼 채워진 div중에 6만큼쓰도록 하는 div5 -->
							
								<div class="single-destinations">
									<div class="thumb">
										<img src="<%=conPath %>/resources/img/hotels/d1.jpg" alt="">
									</div>
									<div class="details">
										<h4 class="d-flex justify-content-between">
											<span>Hilton Star Hotel</span>                              	
											<div class="star">
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star"></span>				
											</div>	
										</h4>
											<p>
											View on map   |   49 Reviews
											</p>
												
									</div>
								</div>
							</div>
							<div class="col-lg-6" > <!-- 남은 6만큼을 차지하도록 하는 div -->
								<div class="single-destinations">
									<div class="thumb">
										<img src="<%=conPath %>/resources/img/hotels/d2.jpg" alt="">
									</div>
									<div class="details">
										<h4 class="d-flex justify-content-between">
										<span>Hilton Star Hotel</span>                              	
										<div class="star">
											<span class="fa fa-star checked"></span>
											<span class="fa fa-star checked"></span>
											<span class="fa fa-star checked"></span>
											<span class="fa fa-star checked"></span>
											<span class="fa fa-star"></span>				
										</div>	
										</h4>
											<p>
												View on map   |   49 Reviews
											</p>	
									</div>
								</div>
							</div>
						</div>
					<%} %>
					</div>
				</div>
				
				<!-- ------------------카페리스트 div는 끝!! ---------------->
				
				<!-- 지도부분을 div2와 붙도록 해주는 div6 -->
				<div class="row col-lg-4 d-inline-flex">
					<div class="row col-lg-12"> <!-- div6에서 12만큼 쓰겠다 라는 div7 -->
						<div class="single-destinations">
							<div class="thumb">
								<img src="<%=conPath %>/resources/img/hotels/d2.jpg" alt=""  >
							</div>
							 <h4 class="d-flex justify-content-between">
								<span>Hilton Star Hotel</span>                              	
								<div class="star">
									<span class="fa fa-star checked"></span>
									<span class="fa fa-star checked"></span>
									<span class="fa fa-star checked"></span>
									<span class="fa fa-star checked"></span>
									<span class="fa fa-star"></span>				
								</div>	
							</h4>
							<p>
								View on map   |   49 Reviews
							</p>
						</div>
					</div>
				</div> 
			</div>
		</div>
			
				<!-- 왼쪽부분 - 지도-->
				<div class="col-lg-4">
				
				</div>
			
		</div>
	</section>
	<!-- End destinations Area -->





	<%@include file="../includes/main/footer.jsp"%>

</body>
</html>