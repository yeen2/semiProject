<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.notice.model.vo.Notice, java.util.ArrayList,
    	com.kh.notice.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%@ include file="../includes/main/header.jsp" %>
	
	<!-- start banner Area -->
			<section class="banner-area relative" style="height:400px;">
				<div class="overlay overlay-bg"></div>
				<div class="col-lg-6 col-md-6 banner-left">
					<h6 class="text-white">공지사항</h6>
				</div>
								
				<div class="container">
					<div class="row align-items-end justify-content-between" style="height:345px">
						
						<div class="col-lg-6 col-md-6 banner-left">
							<h6 class="text-white">공지사항</h6>
						</div>
					</div>
				</div>					
				
			</section>
	<!-- End banner Area -->



	<div class="outer" style="margin-top: 0px; margin-left: 100px; margin-right: 100px; margin-bottom: 5-; margin-bottom: 100px;">
		<br>
		<br>
		
		
		<div class="tableArea">
		
			
			<table class="table table-hover" id="listArea">
			  <thead>
			    <tr align="center">
			      <th scope="col" width="100">No.</th>
			      <th scope="col" width="300">제목</th>
			      <th scope="col" width="150">등록일</th>
			      <th scope="col" width="100">조회수</th>
			    </tr>    
			  </thead>
			  <tbody>
			    
			    <% if(list.isEmpty()){ %>
					<tr>
						<td colspan="4" align="center">존재하는 공지사항이 없습니다.</td>
					</tr>
				<% }else{ %>
					<% for(Notice n : list){ %>
						<tr>
							<td align="center"><%= n.getN_no() %></td>
							<td align="center"><%= n.getTitle() %></td>
							<td align="center"><%= n.getReg_date() %></td>
							<td align="center"><%= n.getCount() %></td>
						</tr>
					<% } %>
				<% } %>
			    
			  </tbody>
			</table>
			
			
			
			<br>
			
			<table align="center">
			<tr>
				<td width="95%"></td>
				
				<!-- 글쓰기 버튼은 관리자만 보이게 -->
				<% if(loginUser != null && loginUser.getEmail().equals("admin@naver.com")) { %>
				<td><button type="button" class="btn btn-secondary btn-sm" onclick="location.href='<%=conPath%>/insertForm.no';">작성하기</button></td>
				<% } %>
			</tr>
		</table>
			
	<!-- ----------- 페이징 바 ------------ -->		
			
			<div align="center">
				
				<nav aria-label="Page navigation example">
				  <ul class="pagination" style="width:400px;">
				    <li class="page-item">
				      <a class="page-link" href="<%=conPath%>/list.no?currentPage=1" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
	
				    
				    <% for(int p=startPage; p<=endPage; p++){ %>
					
					<% if(p == currentPage){ %>
					
					<li class="page-item"><a disabled class="page-link"><%= p %></a></li>
						<% }else { %>
						<li class="page-item"><a class="page-link" href='<%=conPath%>/list.no?currentPage=<%=p%>';><%= p %></a></li>
						<% } %>
					
					<% } %>
				    
				    
				    <li class="page-item">
				      <a class="page-link" href="<%=conPath%>/list.no?currentPage=<%=maxPage%>" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
				
			</div>	
			
	
		</div>
		
		<!-- 공지사항 상세보기 -->	
		<script>
			$(function(){
				$("#listArea td").mouseenter(function(){
					$(this).parent().css({"background":"#e9ecef", "cursor":"pointer"});
				}).mouseout(function(){
					$(this).parent().css("background", "white");
				}).click(function(){
					
					var num = $(this).parent().children().eq(0).text();
					
					
					location.href="<%=conPath%>/detail.no?n_no=" + num;
					
					
				});
			});
		</script>
		
		
		
		
		
	</div>



	
	

	
	
	
	<%@ include file="../includes/main/footer.jsp" %>
</body>
</html>