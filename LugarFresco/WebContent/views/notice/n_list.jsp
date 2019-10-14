<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.notice.model.vo.*, java.util.ArrayList"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	String search = (String)request.getAttribute("search");
	String word = (String)request.getAttribute("word");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
.btn-outline-success {
    color: #007bff;
    background-color: transparent;
    background-image: none;
    border-color: #007bff;
</style>
</head>
<body id="bootstrap-overrrides">
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
						<td colspan="4" align="center" style="pointer-events: none;">존재하는 공지사항이 없습니다.</td>
					</tr>
				<% }else{  int a=1;%>
					<% for(Notice n : list){ %>
						<tr>
							<input type="hidden" name="bId" value="<%= n.getN_no() %>">
							<td align="center"><%= n.getN_no() %></td>
							<td><%= n.getTitle() %></td>
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
				<td width="92%"></td>
				
				<!-- 글쓰기 버튼은 관리자만 보이게 -->
				<% if(loginUser != null && loginUser.getEmail().equals("admin")) { %>
				<td><button type="button" class="btn btn-secondary btn-sm" onclick="location.href='<%=conPath%>/insertForm.no';">작성하기</button><i class="material-icons">create</i></td>
				<% } %>
			</tr>
		</table>
		
	<!-- -------------------------- 검색바 --------------------------- -->	
		<!-- 검색하지 않았을 때-->
		  <%if(word == null || search == null) {%>
		  <form class="form-inline" style="justify-content:center"
		  		action="<%=conPath%>/search.no" method="get">
		  	<i class="material-icons">search</i>
		  	<select class="form-control col-md-1 col-md-offset-3 " name="search">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>&nbsp;&nbsp;
		    <input class="form-control mr-sm-2" type="search" placeholder="검색" aria-label="Search" name="word">
		    <button type="submit" class="btn btn-outline-primary">검색</button>
		  </form>
		<!-- 검색했을 때 사용자가 선택한 옵션과 검색내용이 검색바에 남아있을 수 있도록-->
		  <%}else{ %>
		  <form class="form-inline" style="justify-content:center"
		  		action="<%=conPath%>/search.no" method="get">
		  	<i class="material-icons">search</i>
		  	<select class="form-control col-md-1 col-md-offset-3 " name="search">
		  		<%if(search.equals("title")){ %>
				<option value="title" selected>제목</option>
				<option value="content">내용</option>
				<%}else{ %>
				<option value="title">제목</option>
				<option value="content" selected>내용</option>
				<%} %>
			</select>&nbsp;&nbsp;
		    <input class="form-control mr-sm-2" type="search" placeholder="검색" aria-label="Search" name="word" value="<%=word%>">
		    <button type="submit" class="btn btn-outline-primary">검색</button> &nbsp;&nbsp; <a style="color:#007bff" href="<%=conPath%>/list.no?currentPage=1"><i>처음으로 돌아가기</i></a>
		  </form>
		  <%} %>
		  
		  <br>
		
			
	<!-- ----------------------- 페이징 바 ----------------------- -->		
		<!-- 검색하지 않았을 때 -->
		<%if(word == null){ %>
			<div align="center">
				
				<!-- 맨처음으로 -->
				<nav aria-label="Page navigation example">
				  <ul class="pagination" style="width:400px; justify-content: center;">
				    <li class="page-item">
				      <a class="page-link" href="<%=conPath%>/list.no?currentPage=1" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
	
					<!-- 이전 페이지로 -->
					<% if(currentPage == 1){ %>
					<a disabled></a>
					<% }else{ %>
					<li class="page-item">
      				<a class="page-link" href="<%=conPath%>/list.no?currentPage=<%=currentPage-1%>"> &lt; </a>
    				</li>
    				<% } %>
	
				    <!-- 10개 페이지 목록 -->
				    <% for(int p=startPage; p<=endPage; p++){ %>
					
					<% if(p == currentPage){ %>
					
					<li class="page-item"><a class="page-link"><%= p %></a></li>
						<% }else { %>
						<li class="page-item"><a class="page-link" href='<%=conPath%>/list.no?currentPage=<%=p%>';><%= p %></a></li>
						<% } %>
					
					<% } %>
				    
				    <!-- 다음 페이지로 -->
				    <% if(currentPage == maxPage){ %>
				    <a disabled></a>
				    <%}else{ %>
				    <li class="page-item">
      				<a class="page-link" href="<%=conPath%>/list.no?currentPage=<%=currentPage+1%>"> &gt; </a>
    				</li>
    				<% } %>
				    
				    <!-- 맨끝으로 -->
				    <li class="page-item">
				      <a class="page-link" href="<%=conPath%>/list.no?currentPage=<%=maxPage%>" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
				
			</div>
			
			<!-- 검색한 것이 있을 때 페이징 처리 -->
			<%}else{ %>
			<div align="center">
				
				<!-- 맨처음으로 -->
				<nav aria-label="Page navigation example">
				  <ul class="pagination" style="width:400px; justify-content: center;">
				    <li class="page-item">
				      <a class="page-link" href="<%=conPath%>/search.no?currentPage=1&search=<%=search %>&word=<%=word %>" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
	
					<!-- 이전 페이지로 -->
					<% if(currentPage == 1){ %>
					<a disabled></a>
					<% }else{ %>
					<li class="page-item">
      				<a class="page-link" href="<%=conPath%>/search.no?currentPage=<%=currentPage-1%>&search=<%=search %>&word=<%=word %>"> &lt; </a>
    				</li>
    				<% } %>
	
				    <!-- 10개 페이지 목록 -->
				    <% for(int p=startPage; p<=endPage; p++){ %>
					
					<% if(p == currentPage){ %>
					
					<li class="page-item"><a class="page-link"><%= p %></a></li>
						<% }else { %>
						<li class="page-item"><a class="page-link" href='<%=conPath%>/search.no?currentPage=<%=p%>&search=<%=search %>&word=<%=word %>';><%= p %></a></li>
						<% } %>
					
					<% } %>
				    
				    <!-- 다음 페이지로 -->
				    <% if(currentPage == maxPage){ %>
				    <a disabled></a>
				    <%}else{ %>
				    <li class="page-item">
      				<a class="page-link" href="<%=conPath%>/search.no?currentPage=<%=currentPage+1%>&search=<%=search %>&word=<%=word %>"> &gt; </a>
    				</li>
    				<% } %>
				    
				    <!-- 맨끝으로 -->
				    <li class="page-item">
				      <a class="page-link" href="<%=conPath%>/list.no?currentPage=<%=maxPage%>" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
				
			</div>
			
			<%} %>
			
			
				
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
					
					var num = $(this).parent().children().eq(0).val();
					
					
					location.href="<%=conPath%>/detail.no?n_no=" + num;
					
					
				});
			});
		</script>	



	
	<%@ include file="../includes/main/footer.jsp" %>
</body>
</html>