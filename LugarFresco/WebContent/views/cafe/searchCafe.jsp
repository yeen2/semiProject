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
		<div class="container">
		
			<!-- 타이틀 -->
			<div class="row d-flex justify-content-center">
				<h4 style="color: orange;">"<%= keyword %>"
					맛집 인기 순위
				</h4>
			</div>
			
			<div class="row">
						<div class="col-lg-4">
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
						<div class="col-lg-4">
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
						
							

			<!-- <div class="row">
					<div class="col-sm-9">
						Level 1: .col-sm-9
						<div class="row">
							<div class="col-xs-8 col-sm-6">Level 2: .col-xs-8 .col-sm-6
							</div>
							<div class="col-xs-4 col-sm-6">Level 2: .col-xs-4 .col-sm-6
							</div>
						</div>
					</div>
				</div> -->

			
				<!-- 왼쪽부분 - 지도-->
				<div class="col-lg-4">
				
				</div>
			</div>
		</div>
	</section>
	<!-- End destinations Area -->





	<%@include file="../includes/main/footer.jsp"%>

</body>
</html>