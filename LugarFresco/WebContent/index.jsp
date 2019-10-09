<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.cafe.model.vo.Cafe"%>
<%
	ArrayList<Cafe> c1 = (ArrayList<Cafe>)request.getAttribute("c1");
	
%>
<!DOCTYPE html>
	
	<body>
	<%@ include file="views/includes/main/header.jsp" %>
	
	<!-- start banner Area -->
			<section class="banner-area relative" style="height:400px;">
				<div class="overlay overlay-bg"></div>				
				<div class="container">
					<div class="row fullscreen align-items-center justify-content-between">
						
						<div class="col-lg-6 col-md-6 banner-left">
							<h6 class="text-white">Away from monotonous life</h6>
							<h1 class="text-white">Lugar Fresco</h1>
							<p class="text-white" style="font-size: 20px;">
								솔직한 리뷰, 믿을수 있는 평점!
							</p>
							<!-- <a href="#" class="primary-btn text-uppercase">Get Started</a> -->
						</div>

					</div>
				</div>					
			</section>
			<!-- End banner Area -->

			<!-- 1. 조회수높은 3개 목록 : selectOrderByCount -->
			<section class="popular-destination-area section-gap">
				<div class="container">
		            <div class="row d-flex justify-content-center">
		                <div class="menu-content pb-70 col-lg-8">
		                    <div class="title text-center">
		                        <h1 class="mb-10">Popular Cafe</h1>
		                        <p>요즘 SNS 뜨는 HOT 카페</p>
		                    </div>
		                </div>
		            </div>		
		            				
					<div class="row">
						<% for(int i=0; i<c1.size(); i++){ %>
						<div class="col-lg-4">
							<div class="single-destination relative">
							
								<div class="thumb relative">
									<div class="overlay overlay-bg"></div>
									<img class="resources/img-fluid" src="resources/img/d1.jpg" alt="">
								</div>
								
								<div class="desc">	
									<a href="#" class="price-btn"><%=c1.get(i).getSum_avg() %></a>			
									<h4>Mountain River</h4>
									<p>Paraguay</p>			
								</div>
								
							</div>
						</div>
						<% } %>
						

					</div>
				</div>	
			</section>
		
		
		
			<!-- 2. 평점 좋고, 조회수 많은  8개 리스트 -->
			<section class="other-issue-area section-gap">
				<div class="container">
		            <div class="row d-flex justify-content-center">
		                <div class="menu-content pb-70 col-lg-9">
		                    <div class="title text-center">
		                        <h1 class="mb-10">Best Review Cafe</h1>
		                        <p>평점 좋은 인기 카페</p>
		                    </div>
		                </div>
		            </div>	
		            				
					<div class="row">
						<!-- 평점좋은 8개 순위로 반복문 -->
						<% for(int i=0; i<8; i++){ %>
						<div class="col-lg-3 col-md-6">
							<div class="single-other-issue">
								<a href="#">
								<div class="thumb">
									<img class="img-fluid" src="resources/img/o1.jpg" alt="">					
								</div>
									<h4>Rent a Car</h4>
								</a>
								<p>
									The preservation of human life is the ultimate value, a pillar of ethics and the foundation.
								</p>
							</div>
						</div>
						<% } %>
						
					
				</div>	
			</section>
			<!-- End other-issue Area -->
			
			
		
			<!-- 3. 파워링크 6개  -->
			<section class="recent-blog-area section-gap">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-60 col-lg-9">
							<div class="title text-center">
								<h1 class="mb-10">recommend cafe</h1>
								<p><span style="color: orange;">Lugar Fresco</span> 의 이 달의 추천 카페</p>
							</div>
						</div>
					</div>							
					<div class="row">
						<div class="active-recent-blog-carusel">
						
							<!-- 파워링크 반복부분 -->
							<% for(int i=0; i<6; i++){ %>
							<div class="single-recent-blog-post item">
								<div class="thumb">
									<img class="img-fluid" src="resources/img/b1.jpg" alt="">
								</div>
								<div class="details">
									<div class="tags">
										<ul>
											<li>
												<a href="#">Travel</a>
											</li>
											<li>
												<a href="#">Life Style</a>
											</li>											
										</ul>
									</div>
									<a href="#"><h4 class="title">Low Cost Advertising</h4></a>
									<p>
										Acres of Diamonds… you’ve read the famous story, or at least had it related to you. A farmer.
									</p>
									<h6 class="date">31st January,2018</h6>
								</div>	
							</div>
							<% } %>
																					

						</div>
					</div>
				</div>	
			</section>
			<!-- End recent-blog Area -->			
	
<!-- 	<script type="text/javascript">
		$(function () {
			location.href="index.ca";
		});
	</script> -->
	
	
	
	<%@ include file="views/includes/main/footer.jsp" %>
	
</body>
</html>