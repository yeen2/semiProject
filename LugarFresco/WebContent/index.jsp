<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.cafe.model.vo.Cafe"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<Cafe> c1 = (ArrayList<Cafe>)request.getAttribute("c1");
	ArrayList<Cafe> c2 = (ArrayList<Cafe>)request.getAttribute("c2");
	ArrayList<Cafe> c3 = (ArrayList<Cafe>)request.getAttribute("c3");
	
	System.out.println(c1);
	
	
%>
<!DOCTYPE html>
	
	<%@ include file="views/includes/main/header.jsp" %>
	
	<%-- <c:import url="${ pageContext.servletContext.contextPath }/views/includes/main/header.jsp"/> --%>
	
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

			<!-- 1. 조회수높은 3개 목록(즐겨찾기 수도 추가?) : selectOrderByCount -->
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
							<div class="single-destination relative"  style="width: 100%; height: 100%">
							
								<div class="thumb relative"  style="width: 100%; height: 100%">
									<div class="overlay overlay-bg"  style="width: 100%; height: 100%"></div>
									<img class="resources/img-fluid"   style="width: 100%; height: 100%"
										src="<%=conPath%>/resources/fileupload/cafe/<%=c1.get(i).getTitleImg() %>" alt="">
								</div>

								<div class="desc">	
									<a href="<%=conPath%>/cafeInfo.ca?c_no=<%=c1.get(i).getC_no()%>" class="price-btn">
										<i class="fa fa-star" aria-hidden="true" style="color: blue;"></i>
										<%=c1.get(i).getSum_avg() %>
									</a>			
									<h4><%=c1.get(i).getCafe_name() %></h4>
									<p><%=c1.get(i).getAddress() %></p>			
								</div>
								
							</div>
						</div>
						<% } %>
						

					</div>
				</div>	
			</section>
		
		
		
			<%-- <!-- 2. 평점 좋고, 조회수 많은  8개 리스트 -->
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
						<% for(int i=0; i<c2.size(); i++){ %>
						<div class="col-lg-3 col-md-6">
							<div class="single-other-issue" style="width: 100%; height: 100%; margin-bottom: 10px;">
								<a href="<%=conPath%>/cafeInfo.ca?c_no=<%=c2.get(i).getC_no()%>">
								<div class="thumb" >
									<img class="img-fluid" style="width: 100%; height: 100%"
										src="<%=conPath%>/resources/fileupload/cafe/<%=c2.get(i).getTitleImg() %>" alt="">					
								</div>
								<div style="margin-top: 20px;">
									<h4 style="margin-bottom: 5px; margin-top: 20px; display: inline;">
										<%=c2.get(i).getCafe_name() %>
									</h4>
									&nbsp;&nbsp;
									<!-- 평점  -->
									<strong id="point" style="color:orange; font-size:20px;">
										<%= c2.get(i).getSum_avg()%>
									</strong>
								</a>
									<div class="star"> 
									    <!-- 즐겨찾기 -->
										<% if(c2.get(i).getMyFavorite() == 1){  %>
											<i style="color: orange; font-size: 20px; margin-left:20%;" 
												class="fa fa-star favorite" aria-hidden="true">
											<input type="hidden" value="<%=c2.get(i).getC_no()%>">
											</i>
											
										<% }else{ %>
											<i style="color: orange; font-size: 20px; margin-left:20%;" 
												class="fa fa-star-o favorite" aria-hidden="true">
											<input type="hidden" value="<%=c2.get(i).getC_no()%>">
											</i>				
										<% } %> 
									</div>
								
								</div>
								<p>
									<%=c2.get(i).getAddress() %>
								</p>
							</div>
						</div>
							
						<% } %>
				</div>	
			
			</section> --%>


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
						<% for(int i=0; i<c2.size(); i++){ %>
						<div class="col-lg-3 col-md-6">
							<div class="single-other-issue" style="width: 100%; height: 100%; margin-bottom: 10px;">
								<a href="<%=conPath%>/cafeInfo.ca?c_no=<%=c2.get(i).getC_no()%>">
								<div class="thumb" >
									<img class="img-fluid" style="width: 100%; height: 100%"
										src="<%=conPath%>/resources/fileupload/cafe/<%=c2.get(i).getTitleImg() %>" alt="">					
								</div>
								<div style="margin-top: 20px;">
									<h4 style="margin-bottom: 5px; margin-top: 20px; display: inline;">
										<%=c2.get(i).getCafe_name() %>
									</h4>
									&nbsp;&nbsp;
									<!-- 평점  -->
									<strong id="point" style="color:orange; font-size:20px;">
										<%= c2.get(i).getSum_avg()%>
									</strong>
								</a>
									<div class="star" style="float: right;"> 
									    <!-- 즐겨찾기 -->
										<% if(c2.get(i).getMyFavorite() == 1){  %>
											<i style="color: orange; font-size: 20px; align-content: left;" 
												class="fa fa-star favorite" aria-hidden="true">
											<input type="hidden" value="<%=c2.get(i).getC_no()%>">
											</i>
											
										<% }else{ %>
											<i style="color: orange; font-size: 20px;" 
												class="fa fa-star-o favorite" aria-hidden="true">
											<input type="hidden" value="<%=c2.get(i).getC_no()%>">
											</i>				
										<% } %> 
									</div>
								
								</div>
								<p>
									<%=c2.get(i).getAddress() %>
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
							<% for(int i=0; i<c3.size(); i++){ %>
							<div class="single-recent-blog-post item"  style="width: 100%; height: 100%">
							
								<a href="<%=conPath%>/cafeInfo.ca?c_no=<%=c3.get(i).getC_no()%>">
								<div class="thumb" style="width: 100%; height: 100%">
									<img class="img-fluid" style="width: 100%; height: 100%"
										src="<%=conPath%>/resources/fileupload/cafe/<%=c3.get(i).getTitleImg() %>" alt="">
								</div>
								
								
								<div style="margin-top: 20px;">
									<h4 class="title" style="margin-bottom: 10px; margin-top: 20px; display: inline;">
										<%=c3.get(i).getCafe_name() %>
									</h4>
									&nbsp;&nbsp;
									<!-- 평점  -->
									<strong id="point" style="color:orange; font-size:20px;">
										<%= c3.get(i).getSum_avg()%>
									</strong>
								</a>
									
									<div class="star" style="float: right;">
										 <!-- 즐겨찾기 -->
										<% if(c3.get(i).getMyFavorite() == 1){  %>
											<i style="color: orange; font-size: 30px; margin-left: 200px;" 
												class="fa fa-star favorite" aria-hidden="true">
											<input type="hidden" value="<%=c3.get(i).getC_no()%>">
											</i>
											
										<% }else{ %>
											<i style="color: orange; font-size: 30px; margin-left: 200px;" 
												class="fa fa-star-o favorite" aria-hidden="true">
											<input type="hidden" value="<%=c3.get(i).getC_no()%>">
											</i>				
										<% } %>  
									</div>
									
								</div>	
								<div>
									<p>
										<%=c3.get(i).getAddress()%>&nbsp;<%=c3.get(i).getAddress_detail()%>
									</p>
								</div>
							</div>
							<% } %>
																					

						</div>
					</div>
				
				
			</section>
			<!-- End recent-blog Area -->			
	
				<script type="text/javascript">
						//즐겨찾기 
						$(document).on("click", ".favorite", function(){
							// this가 ajax으로 가면 변하므로 변수로 선언
							var this_favorite=this;
							var login = "<%=session.getAttribute("loginUser") %>";
							var c_no = $(this).children().eq(0).val();
							
							if(login == "null"){
								alert("로그인 후 이용가능합니다.");

							}else{	// 로그인 했으면

								if($(this).hasClass("fa-star-o")){ //색깔 없으면
									console.log("색없음");
									//ajax
									$.ajax({
										url:"insertFavorite.ca",
										data:{c_no:c_no},
										type:"get",
										success:function(str){
											if(str == '성공'){
												console.log("즐겨찾기 추가 성공");
												$(this_favorite).removeClass("fa-star-o").addClass("fa-star");
											}else{
												console.log("즐겨찾기 추가 실패");
											}
										},error:function(){
											console.log("ajax 서버 실패");
										}
									});

								}else{ // 색깔 있으면
									console.log("색있음");
									$.ajax({
										url:"deleteFavorite.ca",
										data:{c_no:c_no},
										type:"get",
										success:function(str){
											if(str == '성공'){
												console.log("즐겨찾기 제거 성공");
												$(this_favorite).removeClass("fa-star").addClass("fa-star-o");
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
						</script>
							
	
	
	
	<%@ include file="views/includes/main/footer.jsp" %>
	
</body>
</html>