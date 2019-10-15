<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.review.model.vo.*,com.kh.admin.model.vo.*"%>
<%
	ArrayList<Review> list = (ArrayList<Review>) request.getAttribute("list");
	
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
		<form action="<%=request.getContextPath() %>/memberList.ap" class="form-inline my-2 my-lg-0">
		<select name="kinds" class="form-control">
			<option>-----</option>   
			<option value="memberNick">닉네임</option>
			<option value="memberEmail">이메일</option>
		</select> 				
		<input type="text" name="search" class="form-control mr-sm-2" size="20" placeholder="내용을 입력하세요.">
		<button type="submit" class="btn btn-outline-secondary my-2 my-sm-0">검색</button>
		</form>
	</div>
	
	<div style="height: 50%;">
		<table class="table"
			style="text-align: center; border: 1px solid #dddddd; margin-top: 50px;">
			<thead>
				<tr>
					<th style="background-color: #fafafa; text-align: center;">No.</th>
					<th style="background-color: #fafafa; text-align: center;">맛평가</th>
					<th style="background-color: #fafafa; text-align: center;">후기내용</th>
					<th style="background-color: #fafafa; text-align: center;">신고 개수</th>
					<th style="background-color: #fafafa; text-align: center;">등록 날짜</th>
					<th style="background-color: #fafafa; text-align: center;">맛 평점</th>
				</tr>
				<%if(msg == null){ %>
				<%for(Review r : list) { %>
				<tr>
					<td>
					<%if(r.getR_declare() >= 10){ %>
					<input type = "checkbox" name="ckbox" value ="<%=r.getM_no() %>" >
					<%} %><%=r.getC_no() %></td>
					<td><%=r.getFlavor() %></p></td>
					<td><a class="announce" data-toggle="modal" value="<%=r.getR_content()%>"><%=r.getR_content() %></a></td>
					<td><%=r.getR_declare() %></td>
					<td><%=r.getR_date() %></td>
					<td><%=r.getSum_avg() %></td>
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
	
var arr = [];
$(function(){
	$("input:checkbox").change(function(){
		if($(this).prop("checked")){
			var ck = $(this).val();
			arr.push(ck);
			console.log(arr);
		}else{
			arr.pop(ck);
		}
		
	})
})

function deleteCafe(){
	if($("input:checkbox[name=ckbox]:checked").length == 0){
		alert("블랙리스트 지정하실 회원을 체크하세요.");
	}else{

		location.href="<%=request.getContextPath() %>/blackListMember.ap?arr=" + arr.toString();

	}
}

</script>	

<div style="margin-top: 10px; height: 50%; display: block" >
   		<button class="btn btn-primary pull-right" onclick="deleteCafe();">블랙리스트 지정</button>
</div>

	
	<%if(hidden != null) {%>
		
	<%} else { %>
	<div class="pagingArea" align="center" style="margin-top: 30px;">

		<!-- 맨 처음으로 (<<) -->
		<!-- 이전 페이지(<) -->
		<%if(currentPage == 1){ %>
		<button disabled="disabled" class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/reviewList.ap?currentPage=1';">
			&lt;&lt;</button>
		<button disabled="disabled" class="btn btn-primary">&lt;</button>
		<%} else{ %>
		<button class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/reviewList.ap?currentPage=1';">
			&lt;&lt;</button>
		<button class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/reviewList.ap?currentPage=<%=currentPage-1%>';">&lt;</button>
		<%} %>
		
		<!-- 10개의 페이지 목록 -->
		<%for(int p=startPage; p<=endPage; p++){ %>
		<% 	if(p == currentPage){ %>

		<button disabled="disabled" class="btn btn-danger"><%=p%></button>

		<%} else{ %>
		
		

		<button
			onclick="location.href='<%=request.getContextPath()%>/reviewList.ap?currentPage=<%=p%>';"
			class="btn btn-primary"><%=p %></button>

		<%}} %>

		<!-- 다음 페이지(>) -->
		<% if(currentPage == maxPage){ %>
		<button class="btn btn-primary" disabled="disabled">&gt;</button>
		<button disabled="disabled" class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/reviewList.ap?currentPage=<%=maxPage%>';">&gt;&gt;</button>
		<%} else { %>
		<button class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/reviewList.ap?currentPage=<%=currentPage+1%>';">&gt;</button>
		<button class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/reviewList.ap?currentPage=<%=maxPage%>';">&gt;&gt;</button>

		<%} %>
		<!-- 맨끝페이지(>>) -->
	</div>	
   	<%} %>
   	</main>
   	
  	
</body>
</html>