<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.review.model.vo.Review, java.util.ArrayList, com.kh.admin.model.vo.PageInfo" %>
<%
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
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
	 <%@include file="../includes/header.jsp" %>

     
    <!-- 각 li 누를때마다 active 바뀌게 js 코드 짜기 -->
      <ul class="app-menu">
		<li><a class="app-menu__item" href="<%=request.getContextPath() %>/myCafeList.op">
			<i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">
        		내 카페 리스트</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/myCafeReview.op">
        	<i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">
        		내 카페 리뷰 전체보기</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/myPowerList.op">
          	<i class="app-menu__icon fa fa-heart-o"></i><span class="app-menu__label">
        		파워링크 신청 리스트</span></a>
        </li>
      </ul>
    </aside>
    
    
    <!-- ----------------------------------코드시작 <main> 안에서 작성해야합니다~ --------------------------------------- -->
    
   	<main class="app-content">
   		
   		
		<h1 style="text-align:center;">My Cafe Review List</h1><br>
    	
    		<div class="form-group">
              <div class="input-group">
	              <form action="<%=conPath %>/myCafeReview.op" method="get">
	                <select class="form form-control" name="category" style="width:100px;">
	                	<option>---</option>
	                	<option value="cafeName">카페명</option>
	                	<option value="content">내용</option>
	                </select>
	                <input class="form-control" id="exampleInputAmount" type="text" name="search">
	                <button class="btn btn-secondary" type="submit">검색</button>
	               </form>
              </div>
            </div>
            <br>
			<table class="table table-hover" id="listArea" style="text-align:center; table-layout:fixed">
			  <thead>
			    <tr>
			      <th scope="col">카페 NO.</th>
			      <th scope="col">카페명</th>
			      <th scope="col">내용</th>
			      <th scope="col">내 댓글 내용</th>
			      <th scope="col">등록 날짜</th>
			    </tr>
			  </thead>
			  <tbody>
			  <% if(list.isEmpty()){ %>
			  	<tr>
			  		<th colspan="6">조회 가능한 리스트가 없습니다!</th>
			  	</tr>
			  <% }else{ %>
			  
			  	<% for(Review r : list){ %>
			    <tr>
			      <td><%= r.getC_no() %></td>
			      <td><%= r.getCafe_name() %></td>
			      <td><%= r.getR_content() %></td>
			      
			      <% if(r.getRr_content() != null){ %>
			      	<td><%= r.getRr_content() %></td>
			      <% }else{ %>
			      	<td>미작성</td>
			      <% } %>
			      
			      <td><%= r.getR_date() %></td>
			      
			    </tr>
			    <% } %>
			    
			   <% } %>
			   </tbody>
			</table>

    		<br>
    		<br>
    		<nav aria-label="...">
			  	<ul class="pagination justify-content-center">
			  	
			  		<%-- 맨 처음으로 --%>
			    	<li class="page-item">
			      		<a class="page-link" href="<%=conPath %>/myCafeReview.op?currentPage=1">&lt;&lt;</a>
			    	</li>
			    	
			    	<%-- 이전 페이지로 --%>
		    		<% if(currentPage == 1){ %>
		    		<li class="page-item disabled">
		      			<a class="page-link">&lt;</a>
		      		</li>
		      		<% }else{ %>
		      		<li class="page-item">
		      			<a class="page-link" href="<%=conPath %>/myCafeReview.op?currentPage=<%=currentPage - 1 %>">&lt;</a>
		      		</li>
		      		<% } %>
		      		
		      		<%-- 10개의 페이지 목록 --%>
		      		<% for(int p=startPage; p<=endPage; p++){ %>
		      		
		      			<% if(p == currentPage){ %>
		      			<li class="page-item active">
			      			<a class="page-link"><%= p %></a>
			      		</li>
		      			<% }else{ %>
		      			<li class="page-item">
			      			<a class="page-link" href="<%=conPath %>/myCafeReview.op?currentPage=<%= p %>"><%= p %></a>
			      		</li>
		      			<% } %>
		      		
		      		<% } %>
		      		
		      		<%-- 다음 페이지로 --%>
		      		<% if(currentPage == maxPage){ %>
		    		<li class="page-item disabled">
			    		<a class="page-link">&gt;</a>
			    	</li>
		      		<% }else{ %>
		      		<li class="page-item">
			    		<a class="page-link" href="<%=conPath %>/myCafeReview.op?currentPage=<%=currentPage + 1%>">&gt;</a>
			    	</li>
		      		<% } %>
			    	
			    	<%-- 맨 끝으로 --%>
			    	<li class="page-item">
			      		<a class="page-link" href="<%=conPath %>/myCafeReview.op?currentPage=<%= maxPage %>">&gt;&gt;</a>
			    	</li>
			  	</ul>
			</nav>
   		
   		<script>
			$(function(){
				$("#listArea td").click(function(){
					var cno = $(this).parent().children().eq(0).text();
					
					location.href="<%=conPath%>/cafeInfo.ca?c_no="+cno;
				});
			});
		</script>
   		
   	</main>
   	
   	
</body>
</html>