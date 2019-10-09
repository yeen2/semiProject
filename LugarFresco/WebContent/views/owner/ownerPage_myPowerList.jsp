<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.owner.model.vo.PowerLink, java.util.ArrayList, com.kh.admin.model.vo.PageInfo" %>
<%
	ArrayList<PowerLink> list = (ArrayList<PowerLink>)request.getAttribute("list");
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
   		
   		
		<h1 style="text-align:center;">My Power Apply List</h1><br>
    	
			<table class="table table-hover" style="text-align:center;">
			  <thead>
			    <tr>
			      <th scope="col">신청 NO.</th>
			      <th scope="col">카페명</th>
			      <th scope="col">신청날짜</th>
			      <th scope="col">등록날짜</th>
			      <th scope="col">상태</th>
			    </tr>
			  </thead>
			  <tbody>
			  <% if(list.isEmpty()){ %>
			  	<tr>
			  		<td colspan="5">조회 가능한 리스트가 없습니다!</td>
			  	</tr>
			  <% }else{ %>
			  
			  	<% for(PowerLink p : list){ %>
			    <tr>
			      <td><%= p.getP_no() %></td>
			      <td><%= p.getCafe_name() %></td>
			      <td><%= p.getReg_date() %></td>
			      
			      <% if(p.getUpload_date() != null){ %>
			      	<td><%= p.getUpload_date() %></td>
			      <% }else{ %>
			      	<td></td>
			      <% } %>
			      
			      <% if(p.getStatus() == 1){ %>
			      	<td>대기중</td>
			      <% }else if(p.getStatus() == 2){ %>
			      	<td>등록중</td>
			      <% }else{ %>
			      	<td>등록완료</td>
			      <% } %>
			      
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
			      		<a class="page-link" href="<%=conPath %>/myPowerList.op?currentPage=1">&lt;&lt;</a>
			    	</li>
			    	
			    	<%-- 이전 페이지로 --%>
		    		<% if(currentPage == 1){ %>
		    		<li class="page-item disabled">
		      			<a class="page-link">&lt;</a>
		      		</li>
		      		<% }else{ %>
		      		<li class="page-item">
		      			<a class="page-link" href="<%=conPath %>/myPowerList.op?currentPage=<%=currentPage - 1 %>">&lt;</a>
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
			      			<a class="page-link" href="<%=conPath %>/myPowerList.op?currentPage=<%= p %>"><%= p %></a>
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
			    		<a class="page-link" href="<%=conPath %>/myPowerList.op?currentPage=<%=currentPage + 1%>">&gt;</a>
			    	</li>
		      		<% } %>
			    	
			    	<%-- 맨 끝으로 --%>
			    	<li class="page-item">
			      		<a class="page-link" href="<%=conPath %>/myPowerList.op?currentPage=<%= maxPage %>">&gt;&gt;</a>
			    	</li>
			  	</ul>
			</nav>
   		
   		
   		
   	</main>
   	
   	
</body>
</html>