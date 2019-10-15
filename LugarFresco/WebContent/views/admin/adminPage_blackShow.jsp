<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.*,com.kh.admin.model.vo.*"%>
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
	
	//ArrayList<Member> list2 = (ArrayList<Member>) request.getAttribute("list2");
	
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	String hidden = (String) request.getAttribute("buttonhidden"); // 찾을땐 페이징 빼려고 넣음

	String msg = (String) request.getAttribute("msg");

	System.out.println(msg);

	System.out.println("dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");

	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<style>
 .announce:hover{
 	cursor: pointer;
 }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
		 <%@include file="../includes/header.jsp" %>   
     
     
     <!-- 각 li 누를때마다 active 바뀌게 js 코드 짜기 -->
      <ul class="app-menu">
		<li><a class="app-menu__item" href="<%=request.getContextPath() %>/memberList.ap">
			<i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">
        		회원 정보 리스트</span></a>
        </li>
         <li><a class="app-menu__item" href="<%=request.getContextPath() %>/reviewList.ap">
			<i class="app-menu__icon fa fa-bars"></i><span class="app-menu__label">
        		리뷰 리스트</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/cafeList.ap">
        	<i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">
        		카페 리스트</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/declareList.ap">
          	<i class="app-menu__icon fa fa-heart-o"></i><span class="app-menu__label">
        		신고 리스트</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/powerList.ap">
        		<i class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">
        		파워링크 신청 리스트</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/cafeApplyList.ap">
        	<i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">
        		카페 신청 리스트</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/qnaList.ap">
        	<i class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">
        		Q&A 리스트</span></a>
        </li>
      </ul>
    </aside>
    
    
    <!-- ----------------------------------코드시작 <main> 안에서 작성해야합니다~ --------------------------------------- -->
    
   	<main class="app-content" style="background:white;">
   		

	<div style="margin-top: 50px; height: 20%;" align="center"
 		class="form-inline">

	</div>
	<div style="float:right">	
		<button class = "btn btn-primary md" onclick="memberShow();">회원리스트 보기</button>
	</div>
	<div style="height: 50%;">
		<table class="table"
			style="text-align: center; border: 1px solid #dddddd; margin-top: 50px;">
			<thead>
				<tr>
					<th style="background-color: #fafafa; text-align: center;">No.</th>
					<th style="background-color: #fafafa; text-align: center;">닉네임</th> 
					<th style="background-color: #fafafa; text-align: center;">블랙리스트 등록기간</th>
					<th style="background-color: #fafafa; text-align: center;">블랙리스트 해제기간</th>
					<th style="background-color: #fafafa; text-align: center;">해제버튼</th>
				</tr>
				<%if(msg == null){ %>
				<%for(Member m : list) { %>
				<tr>
					<td><%=m.getM_no() %></td>
					<td><%=m.getNickName() %></td>
					<td><%=m.getStart_date() %></td>
					<td><%=m.getEnd_date() %></td>
					<td><button class="btn btn-danger sm" onclick="black2(this.value);" value="<%=m.getM_no()%>">해제</button></td>
				</tr>

				<%}%>
				<%} else {%>
				<tr>
					<td colspan="6"><%=msg%></td>
				</tr>
				<%}%>
			</thead>

		</table>
	</div>
	<script>
	
	function black2(b){
		alert("블랙리스트 해제 완료");
		location.href="<%=conPath%>/blackRelease.ap?b=" + b;
	}
	function memberShow(){
		location.href="<%=conPath%>/memberList.ap";
	}
	
	</script>
	
	
	
	
	<%if(hidden != null) {%>
		
	<%} else { %>
	<div class="pagingArea" align="center" style="margin-top: 30px;">

		<!-- 맨 처음으로 (<<) -->
		<!-- 이전 페이지(<) -->
		<%if(currentPage == 1){ %>
		<button disabled="disabled" class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/memberList.ap?currentPage=1';">
			&lt;&lt;</button>
		<button disabled="disabled" class="btn btn-primary">&lt;</button>
		<%} else{ %>
		<button class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/memberList.ap?currentPage=1';">
			&lt;&lt;</button>
		<button class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/memberList.ap?currentPage=<%=currentPage-1%>';">&lt;</button>
		<%} %>
		
		<!-- 10개의 페이지 목록 -->
		<%for(int p=startPage; p<=endPage; p++){ %>
		<% 	if(p == currentPage){ %>

		<button disabled="disabled" class="btn btn-danger"><%=p%></button>

		<%} else{ %>
		
		

		<button
			onclick="location.href='<%=request.getContextPath()%>/memberList.ap?currentPage=<%=p%>';"
			class="btn btn-primary"><%=p %></button>

		<%}} %>

		<!-- 다음 페이지(>) -->
		<% if(currentPage == maxPage){ %>
		<button class="btn btn-primary" disabled="disabled">&gt;</button>
		<button disabled="disabled" class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/memberList.ap?currentPage=<%=maxPage%>';">&gt;&gt;</button>
		<%} else { %>
		<button class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/memberList.ap?currentPage=<%=currentPage+1%>';">&gt;</button>
		<button class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/memberList.ap?currentPage=<%=maxPage%>';">&gt;&gt;</button>

		<%} %>
		<!-- 맨끝페이지(>>) -->
	</div>	
   	<%} %>
   	</main>
   	

</body>
</html>