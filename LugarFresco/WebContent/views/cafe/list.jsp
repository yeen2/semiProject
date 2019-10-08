<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.cafe.model.vo.*"%>
<%
	//ArrayList<Cafe> list = (ArrayList<Cafe>)request.getAttribute("list");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Cafe> c = (ArrayList<Cafe>)request.getAttribute("paginglist");
	
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	int p; //페이징
	
	System.out.println(c.get(0));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#point{
		margin-left: 5px;
   		font-size: 1.37rem;
    	display: inline-block;
    	vertical-align: middle;
    	color: #f8b600;
	}
	.page-link:focus{
		box-shadow:none !important;
	}
</style>
</head>
<body>
	
	<%@include file="../includes/main/header.jsp"%>
	
				<!-- Start destinations Area -->
			<section class="destinations-area section-gap">
				<div class="container">
				
		            <div class="row d-flex justify-content-center">
		                <div class="menu-content pb-40 col-lg-8">
		                    <div class="title text-center">
		                        <h1 class="mb-10">Cafe List</h1>
		                        <p>We all live in an age that belongs to the young at heart. Life that is becoming extremely fast, day to.</p>
		                    </div>
		                </div>
		            </div>			
		            
		            <!-- cafeList 시작 -->		
		            	
					<div class="row">
						
						<% for(int i=0; i<c.size(); i++){ %> <!-- list for문 -->
						<div class="col-lg-4" onclick="location.href='<%=conPath%>/cafeInfo.ca?c_no=<%=c.get(i).getC_no()%>'" style="cursor:pointer;">
							<div class="single-destinations">
								<div class="thumb">
									<img src="<%=conPath%>/resources/fileupload/cafe/b1.jpg" alt="">
								
								</div>
								<div class="details">
									<h4 style="display: inline;"><%= c.get(i).getCafe_name() %></h4>
									<!-- 평점  -->
									<strong id="point"><%= c.get(i).getSum_avg()%></strong>
									<p>
										<%= c.get(i).getAddress() %>
									</p>
									
								</div>
							</div>
						</div>
						
						<% }  %> <!-- list for문 -->
						
<%-- 					<div class="col-lg-4">
							<div class="single-destinations">
								<div class="thumb">
									<img src="<%=conPath%>/resources/img/packages/d2.jpg" alt="">
								</div>
								<div class="details">
									<h4>Holiday Sea beach Blue Ocean</h4>
									<p>
										United staes of America
									</p>
									
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="single-destinations">
								<div class="thumb">
									<img src="<%=conPath%>/resources/img/packages/d3.jpg" alt="">
								</div>
								<div class="details">
									<h4>Holiday Sea beach Blue Ocean</h4>
									<p>
										United staes of America
									</p>
									
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="single-destinations">
								<div class="thumb">
									<img src="<%=conPath%>/resources/img/packages/d4.jpg" alt="">
								</div>
								<div class="details">
									<h4>Holiday Sea beach Blue Ocean</h4>
									<p>
										United staes of America
									</p>
									
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="single-destinations">
								<div class="thumb">
									<img src="<%=conPath%>/resources/img/packages/d5.jpg" alt="">
								</div>
								<div class="details">
									<h4>Holiday Sea beach Blue Ocean</h4>
									<p>
										United staes of America
									</p>
									
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="single-destinations">
								<div class="thumb">
									<img src="<%=conPath%>/resources/img/packages/d6.jpg" alt="">
								</div>
								<div class="details">
									<h4>Holiday Sea beach Blue Ocean</h4>
									<p>
										United staes of America
									</p>
									
								</div>
							</div>
						</div> --%>		
						
						
				<!-------------------- 페이징 ---------------------->
				<div class="col-lg-12" style="margin-top: 50px;">
					<nav class="blog-pagination justify-content-center d-flex" style="padding-top: 0px;">
						
						<ul class="pagination">
							<!-- 이전버튼 -->
							<li class="page-item">
								<a href="<%=conPath%>/cafeList.ca?currentPage=1" 
									class="page-link" aria-label="Previous" id="left_paging"> 
									<span aria-hidden="true"> 
										<span class="lnr lnr-chevron-left"></span>
									</span>
								</a>
							</li>

							<% for(p=startPage; p<=endPage; p++){ %>
							<li class="page-item active">
								<a href="<%=conPath%>/cafeList.ca?currentPage=<%=p%>" 
									class="page-link" id="paging">
									<%=p %>
								</a>
							</li>
							<% } %>
							
							<!-- 이후 버튼 -->
							<li class="page-item">
								<a href="#" 
									class="page-link" aria-label="Next" id="right_paging"> 
									<span aria-hidden="true"> 
										<span class="lnr lnr-chevron-right"></span>
									</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
				</div>	
			</section>
			<!-- End destinations Area -->
			
	<script type="text/javascript">
		// 페이징 스크립트
		var currentPage = <%=currentPage%>;
		var maxPage = <%=maxPage%>;
		var p = <%=p%>;
		
		$('#left_paging').click(function(e){ 
			if(currentPage == 1){
			e.preventDefault();
			}
		});
		
		$('#right_paging').click(function(e){ 
			if(currentPage == maxPage){
			e.preventDefault();
			}
		});
		
		$('#paging').click(function(e){ 
			if(p == currentPage){
			e.preventDefault();
			}
		});
		
		
		

	</script>
	
	
	<%@include file="../includes/main/footer.jsp"%>
</body>
</html>