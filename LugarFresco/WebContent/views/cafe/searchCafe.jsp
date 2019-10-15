<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,com.kh.cafe.model.vo.Cafe,java.sql.Date"%>
<%
	String keyword = (String)request.getAttribute("keyword");
	ArrayList<Cafe> list = (ArrayList<Cafe>)request.getAttribute("list");
	int listcount=list.size();
	
	// 지도를 위한 배열
		String [] map_name_java = new String [listcount];
		String [] map_location_java = new String [listcount];
		
		for(int i=0; i<listcount; i++ ){
			map_name_java[i] = list.get(i).getCafe_name();
			map_location_java[i] = list.get(i).getAddress()+ " " + list.get(i).getAddress_detail();
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.single-destinations:hover {
	
}
</style>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>

	<%@include file="../includes/main/header.jsp"%>
	
	<!-- Start destinations Area -->
	<section class="destinations-area section-gap">
	
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-40 col-lg-8">
					<div class="title text-center">
						<h4 style="color: orange;">"<%= keyword %>"
							맛집 인기 순위
						</h4>
					</div>
				</div>
			</div>
			
			<div class="row">
			<% if(list.isEmpty()){ %>
			<br><br>
			<div class="row d-flex justify-content-center">
				<h4>
					검색 결과가 없습니다.
				</h4>
			</div>
			
			<%}else{ %>
				<%for(int i=0; i<list.size(); i++){%>
				<div class="col-lg-4">
					<div class="single-destinations">
						<div class="thumb">
							<img src="<%=conPath %>/resources/fileupload/cafe/<%= list.get(i).getTitleImg() %>"
								onclick="location.href='<%=conPath%>/cafeInfo.ca?c_no=<%=list.get(i).getC_no()%>'">
						</div>
						<div class="details">
							<h4 class="d-flex justify-content-between"> 
								<span>
									<%= list.get(i).getCafe_name()%> 
								</span>        
								<!-- 평점  -->
								<strong style="color:orange;">
									<%= list.get(i).getSum_avg()%>
								</strong>    
								
								<div class="star">
								
									<% if(list.get(i).getMyFavorite() == 1){  %>
										<i style="color:orange; font-size: 25px;" 
											class="fa fa-star favorite" >
											<input type="hidden" value="<%=list.get(i).getC_no()%>">
										</i>
						
									<% }else{ %>
										<i style=" font-size: 25px;" 
											class="fa fa-star favorite" >
											<input type="hidden" value="<%=list.get(i).getC_no()%>">
										</i>				
									<% } %>				
								</div>	
							</h4>
								<p>
									<%= list.get(i).getAddress()%>&nbsp;<%= list.get(i).getAddress_detail()%>
								</p>		
						</div>
					</div>
				</div>
				<%} %>
			<%} %>
				 
			</div>
		</div>
	</section>
	<!-- End destinations Area -->


	<%@include file="../includes/main/footer.jsp"%>

</body>
</html>