<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList,com.kh.cafe.model.vo.Cafe,java.sql.Date"%>
<%
	String keyword = (String)request.getAttribute("keyword");
	ArrayList<Cafe> list = (ArrayList<Cafe>)request.getAttribute("list");
	int listcount = list.size();
	
	// 지도를 위한 배열
	String [] map_name = new String [listcount];
	String [] map_location = new String [listcount];
	
	for(int i=0; i<listcount; i++ ){
		map_name[i] = list.get(i).getCafe_name();
		map_location[i] = list.get(i).getAddress()+ " " + list.get(i).getAddress_detail();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.single-destinations:hover{
		
	}
</style>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
			
			<% if(list.isEmpty()){ %>
			<br><br>
			<div class="row d-flex justify-content-center">
				<h4>
					검색 결과가 없습니다.
				</h4>
			</div>
			
			<% }else{ %>
			<!-- 시작부분 카페리스트와 지도를 한 div로 담는다.-->
			<div class="row align-items-start"> <!-- 카페리스트 div1를 start로 위로 땡겨준다. -->
				<div class="row col-lg-8 d-inline-flex"> <!-- 카페리스트부분옆에 지도가 붙도록 하는 div2 -->
					<div class="row col-lg-12"> <!-- 왼쪽 col8만큼 카페리스트를 12만큼 채우게 하도록 하는 div3 -->
					
					<%if(listcount%2==1){ %> <!-- 리스트갯수가 홀수일때 리스트갯수만 불러오면됨-->
						<%for(int i=1; i<listcount; i=i+2){ %> <!-- 짝수개만큼 늘어나므로 숫자 정렬 -->
							
							<% %>
						
							<div class="row d-flex col-lg-12"> <!-- 행의 시작이 flex가 되도록 하는 div4 -->
								<div class="col-lg-6"> <!-- 12만큼 채워진 div중에 6만큼쓰도록 하는 div5 -->
								
									<!-- 1번 div -->
									<div class="single-destinations" style="cursor:pointer">
										<div class="thumb">
											<img src="<%=conPath %>/resources/fileupload/cafe/<%= list.get(i-1).getTitleImg() %>"
												onclick="location.href='<%=conPath%>/cafeInfo.ca?c_no=<%=list.get(i-1).getC_no()%>'">
										</div>
										<div class="details">
											<h4 class="d-flex justify-content-between"> 
												<span>
													<%= list.get(i-1).getCafe_name()%> 
												</span>        
												<!-- 평점  -->
												<strong style="color:orange; padding-right: 130px;">
													<%= list.get(i-1).getSum_avg()%>
												</strong>    
												
												<div class="star">
												
													<% if(list.get(i-1).getMyFavorite() == 1){  %>
														<i style="color:orange; font-size: 25px;" 
															class="fa fa-star favorite" >
															<input type="hidden" value="<%=list.get(i-1).getC_no()%>">
														</i>
										
													<% }else{ %>
														<i style=" font-size: 25px;" 
															class="fa fa-star favorite" >
															<input type="hidden" value="<%=list.get(i-1).getC_no()%>">
														</i>				
													<% } %>				
												</div>	
											</h4>
												<p>
													<%= list.get(i-1).getAddress()%>&nbsp;<%= list.get(i-1).getAddress_detail()%>
												</p>		
										</div>
									</div>
								</div>
								
								<div class="col-lg-6" > <!-- 남은 6만큼을 차지하도록 하는 div -->
									
									<!-- 2번 div -->
									<div class="single-destinations" style="cursor:pointer">
										<div class="thumb">
											<img src="<%=conPath %>/resources/fileupload/cafe/<%=list.get(i).getTitleImg()%>"
												onclick="location.href='<%=conPath%>/cafeInfo.ca?c_no=<%=list.get(i).getC_no()%>'">
										</div>
										<div class="details">
											<h4 class="d-flex justify-content-between">
											<span>
												<%= list.get(i).getCafe_name()%> 
											</span>
											<!-- 평점  -->
											<strong style="color:orange; padding-right: 130px;">
												<%= list.get(i).getSum_avg()%>
											</strong>
											                              	
											<div class="star">
											
												<% if(list.get(i).getMyFavorite() == 1){  %>
													<i style="color:orange; font-size: 25px;" 
															class="fa fa-star favorite">
														<input type="hidden" value="<%=list.get(i).getC_no()%>">
													</i>
												<% }else{ %>
													<i style="font-size: 25px;" 
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
							</div>
						<%} %><!-- 마지막 홀수개 리스트 처리!! -->
						<div class="row d-flex col-lg-12"> <!-- 행의 시작이 flex가 되도록 하는 div4 -->
							<div class="col-lg-6"> <!-- 12만큼 채워진 div중에 6만큼쓰도록 하는 div5 -->
							
								<!-- 3번째 div -->
								<div class="single-destinations" style="cursor:pointer">
									<div class="thumb">
										<img src="<%=conPath %>/resources/fileupload/cafe/<%=list.get(listcount-1).getTitleImg()%>"
											onclick="location.href='<%=conPath%>/cafeInfo.ca?c_no=<%=list.get(listcount-1).getC_no()%>'">
									</div>
									<div class="details">
										<h4 class="d-flex justify-content-between">
											<span>
												<%= list.get(listcount-1).getCafe_name()%> 
											</span>      
											<!-- 평점  -->
											<strong style="color:orange; padding-right: 130px;">
												<%= list.get(listcount-1).getSum_avg()%>
											</strong>
											                        	
											<div class="star">
											
												<% if(list.get(listcount-1).getMyFavorite() == 1){  %>
													<i style="color:orange; font-size: 25px;" 
															class="fa fa-star favorite">
														<input type="hidden" value="<%=list.get(listcount-1).getC_no()%>">
													</i>
												<% }else{ %>
													<i style=" font-size: 25px;" 
														class="fa fa-star favorite" >
														<input type="hidden" value="<%=list.get(listcount-1).getC_no()%>">
													</i>				
												<% } %>				
											</div>	
										</h4>
											<p>
												<%= list.get(listcount-1).getAddress()%>&nbsp;<%= list.get(listcount-1).getAddress_detail()%> 
											</p>	
									</div>
								</div>

							</div>
						</div>
						<%}else{%><!-- 사실 for문안에 if문을 작성해도되는데 리스트가 많아지면 if문처리로 컴퓨터가 고생할까봐 -->
									<!--  코드가 길어져도 if문 연산처리가 덜 가는쪽으로 선택함 -->
									<!--  요놈은 리스트 짝수개 처리하는 for문!! -->
						<%for(int i=1; i<=listcount; i=i+2){ %>
							<div class="row d-flex col-lg-12"> <!-- 행의 시작이 flex가 되도록 하는 div4 -->
								<div class="col-lg-6"> <!-- 12만큼 채워진 div중에 6만큼쓰도록 하는 div5 -->
								
									<!-- 4번째 div -->
									<div class="single-destinations" style="cursor:pointer">
										<div class="thumb">
											<img src="<%=conPath %>/resources/fileupload/cafe/<%=list.get(i-1).getTitleImg()%>"
												onclick="location.href='<%=conPath%>/cafeInfo.ca?c_no=<%=list.get(i-1).getC_no()%>'">
										</div>
										<div class="details">
											<h4 class="d-flex justify-content-between">
												<span>
													<%= list.get(i-1).getCafe_name()%> 
												</span>     
												<!-- 평점  -->
												<strong style="color:orange; padding-right: 130px;">
													<%= list.get(i-1).getSum_avg()%>
												</strong>    
												                     	
												<div class="star">
												
													<% if(list.get(i-1).getMyFavorite() == 1){  %>
														<i style="color:orange; font-size: 25px;" 
																class="fa fa-star favorite">
															<input type="hidden" value="<%=list.get(i-1).getC_no()%>">
														</i>
													<% }else{ %>
														<i style=" font-size: 25px;" 
															class="fa fa-star favorite" >
															<input type="hidden" value="<%=list.get(i-1).getC_no()%>">
														</i>					
													<% } %>			
												</div>	
											</h4>
												<p>
													<%= list.get(i-1).getAddress()%>&nbsp;<%= list.get(i-1).getAddress_detail()%> 
												</p>		
										</div>
									</div>
									
								</div>
								
								<div class="col-lg-6 d-form-inline-flex" > <!-- 남은 6만큼을 차지하도록 하는 div -->
								
									<!-- 5번째 div -->
									<div class="single-destinations" style="cursor:pointer">
										<div class="thumb">
											<img src="<%=conPath %>/resources/fileupload/cafe/<%=list.get(i).getTitleImg()%>"
												onclick="location.href='<%=conPath%>/cafeInfo.ca?c_no=<%=list.get(i).getC_no()%>'">
										</div>
										<div class="details">
											<h4 class="d-flex justify-content-between">
											<span>
												<%= list.get(i).getCafe_name()%> 
											</span>  
											<!-- 평점  -->
											<strong style="color:orange; padding-right: 130px;">
												<%= list.get(i).getSum_avg()%>
											</strong>
											                            	
											<div class="star">
											
												<% if(list.get(i).getMyFavorite() == 1){  %>
													<i style="color:orange; font-size: 25px;" 
															class="fa fa-star favorite">
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
							</div>
						<%} %>
					<%} %>
					</div>
				</div>
				<script type="text/javascript">
						//즐겨찾기 
						$(document).on("click", ".favorite", function(){
							// this가 ajax으로 가면 변하므로 변수로 선언
							var this_favorite=this;
							var login = "<%=session.getAttribute("loginUser") %>";
							var c_no = $(this).children().eq(0).val();
							
							console.log($(this).children().eq(0).val());
							console.log(!$(this).is('[color]'));
							console.log($(this).css('color'));
							
							if(login == "null"){
								alert("로그인 후 이용가능합니다.");

							}else{	// 로그인 했으면

								//if($(this).hasClass("fa-star-o")){ //색깔 없으면
								//if(!$(this).is('[color]')){ //색깔 없으면
								  if($(this).css('color') == 'rgb(34, 34, 34)'){
									console.log("색없음");
									//ajax
									$.ajax({
										url:"insertFavorite.ca",
										data:{c_no:c_no},
										type:"get",
										success:function(str){
											if(str == '성공'){
												console.log("즐겨찾기 추가 성공");
												//$(this_favorite).removeClass("fa-star-o").addClass("fa-star");
												$(this_favorite).css('color', 'orange');
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
												//$(this_favorite).removeClass("fa-star").addClass("fa-star-o");
												$(this_favorite).css('color','rgb(34, 34, 34)');
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
		
		<% } %> <!-- 검색결과 if-end -->
		
		
				<!-- ------------------카페리스트 div는 끝!! ---------------->
				

				<!-- 지도부분을 div2와 붙도록 해주는 div6 -->
				<div class="row col-lg-4 d-inline-flex">
					<div id="map" style="width:350px;height:500px;"></div>	
				</div> 
				
				
			</div>
		</div>
			
				
		

			
		</div>
	</section>
	<!-- End destinations Area -->
	
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ef4b8fd4aebaa69e9172f4cc49921ca"></script>
	<script>
	
		// 카페이름 + 카페주소 배열 불러오기
		var listcount = '<%=listcount%>';
		var map_name = '<%=map_name%>';
		var map_location = '<%= map_location%>';
		
		console.log(map_name);
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
			 // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		    	 
		    	 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		     } // 
		}); // 주소->좌표 변환
		
		
		// for문으로 돌리기
				// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
				var positions = [
				    {
				        content: '<div>카카오</div>', 
				        latlng: kakao.maps.LatLng(33.450705, 126.570677)
				    },
				    {
				        content: '<div>생태연못</div>', 
				        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
				    },
				    {
				        content: '<div>텃밭</div>', 
				        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
				    },
				    {
				        content: '<div>근린공원</div>',
				        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
				    }
				];
				
	     
	     
	     
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		/* 아래와 같이도 할 수 있습니다 */
		/*
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		
		    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    (function(marker, infowindow) {
		        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
		        kakao.maps.event.addListener(marker, 'mouseover', function() {
		            infowindow.open(map, marker);
		        });
		
		        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
		        kakao.maps.event.addListener(marker, 'mouseout', function() {
		            infowindow.close();
		        });
		    })(marker, infowindow);
		}
		*/
</script>
	
	
	
	



	<%@include file="../includes/main/footer.jsp"%>

</body>
</html>