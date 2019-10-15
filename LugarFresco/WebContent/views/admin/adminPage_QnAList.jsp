<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.question.model.vo.*,com.kh.admin.model.vo.PageInfo, java.util.ArrayList"%>
    
    
<%
	ArrayList<QnAList> list = (ArrayList<QnAList>) request.getAttribute("list");
	
	PageInfo pi = (PageInfo) request.getAttribute("pi");
 
	String hidden = (String) request.getAttribute("buttonhidden"); // 찾을땐 페이징 빼려고 넣음

	String msg = (String) request.getAttribute("msg");

	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>    
<!DOCTYPE html>
<html>
<head>
<style>
 #tdhover:hover{
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
			<i class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">
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
    
   	<main class="app-content">
   		
   		
	<div style="margin-top: 50px; height: 20%;" align="center"
		class="form-inline">
		<form action="<%=request.getContextPath()%>/qnaList.ap"
			class="form-inline my-2 my-lg-0">
			<select name="kinds" class="form-control">
				<option>-----</option>
				<option value="qnaTitle">제목</option>
				<option value="applicantName">작성자</option>
			</select> <input type="text" name="search" class="form-control mr-sm-2"
				size="20" placeholder="내용을 입력하세요.">
			<button type="submit" class="btn btn-outline-secondary my-2 my-sm-0">검색</button>
		</form>
	</div>
          <div style="height: 50%;">
          	<table class="table" style="text-align: center; border: 1px solid #dddddd; margin-top: 50px;">
			<thead>
				<tr>
					<th style="background-color: #fafafa; text-align: center;">No.</th>
					<th style="background-color: #fafafa; text-align: center;">제목</th>
					<th style="background-color: #fafafa; text-align: center;">작성자</th>
					<th style="background-color: #fafafa; text-align: center;">등록날짜</th>
					<th style="background-color: #fafafa; text-align: center;">답변날짜</th>
					<th style="background-color: #fafafa; text-align: center;">답변여부</th>
				</tr>
					<%if(msg == null){ %>
					<%for(QnAList q : list){ %>
				<tr>
					<td><%=q.getQ_no() %></td>
					<td id ="tdhover"><a data-toggle ="modal" class="announce" value="<%=q.getNickname()%>"><%=q.getQ_title()%></a></td>
					<td><%=q.getNickname() %></td>
					<td><%=q.getQ_date() %></td>
					<td><%=q.getA_date() %></td>
					<td><%=q.getIsanswer() %></td>
		

				</tr>
					<%} %>
				<%} else {%>
				<tr>
					<td colspan="6"><%=msg %></td>
				</tr>
				<%} %>
			</thead>
          </table>
   </div>
   <script>
   		
   
	$(document).ready(function(){
		$(".announce").click(function(){ // Click to only happen on announce links
		   var cc = $(this).attr('value');
		   
		   <% for(QnAList q : list) {%>
		   	if(cc == "<%= q.getNickname() %>"){
				$("#qnaTitle").val("<%=q.getQ_title()%>");
				$("#qnaContent").val("<%=q.getQ_content()%>");
		   	}
		<% }%>

	   $('#nicModal').modal('show');
		   	
	   });
	});
	
   </script>

		<%if(hidden != null) {%>
		
	<%} else { %>
	<div class="pagingArea" align="center" style="margin-top: 30px;">

		<!-- 맨 처음으로 (<<) -->
		<!-- 이전 페이지(<) -->
		<%if(currentPage == 1){ %>
		<button disabled="disabled" class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/qnaList.app?currentPage=1';">
			&lt;&lt;</button>
		<button disabled="disabled" class="btn btn-primary">&lt;</button>
		<%} else{ %>
		<button class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/qnaList.ap?currentPage=1';">
			&lt;&lt;</button>
		<button class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/qnaList.ap?currentPage=<%=currentPage-1%>';">&lt;</button>
		<%} %>
		
		<!-- 10개의 페이지 목록 -->
		<%for(int p=startPage; p<=endPage; p++){ %>
		<% 	if(p == currentPage){ %>

		<button disabled="disabled" class="btn btn-danger"><%=p%></button>

		<%} else{ %>
		
		

		<button
			onclick="location.href='<%=request.getContextPath()%>/qnaList.ap?currentPage=<%=p%>';"
			class="btn btn-primary"><%=p %></button>

		<%}} %>

		<!-- 다음 페이지(>) -->
		<% if(currentPage == maxPage){ %>
		<button class="btn btn-primary" disabled="disabled">&gt;</button>
		<button disabled="disabled" class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/qnaList.ap?currentPage=<%=maxPage%>';">&gt;&gt;</button>
		<%} else { %>
		<button class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/qnaList.ap?currentPage=<%=currentPage+1%>';">&gt;</button>
		<button class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/qnaList.ap?currentPage=<%=maxPage%>';">&gt;&gt;</button>

		<%} %>
		<!-- 맨끝페이지(>>) -->
	</div>	
   	<%} %>
   	</main>
   	
   	<div class="modal fade" id ="nicModal" tabindex="-1" role ="dialog" aria-labelledby="modal"aria-hidden="true">
		<div class="modal-dialog">
			<div class= "modal-content"> <!-- modal 1  -->
			
				<div class="modal-header"> <!-- modal header -->
					<h5 class="modal-title" id="modal">문의보기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"> &times; </span>
					</button>
				</div>
				<div class="modal-body">
					<div >
							<!-- form-row : 하나의 행을 여러 열로 나눌때 사용한다. -->
						<div class="form-group">
							<label for="">문의제목</label>
							<input type="text" id="qnaTitle" class="form-control" />
						</div>
						<div class="form-group">
							<label for="">문의내용</label>
							<textarea id="qnaContent" style="height: 180px" class="form-control" maxlength="2048"></textarea>
						</div>
						<div class="modal-footer">
							<button class="btn btn-secondary" type="button" data-dismiss="modal" id ="reset2">취소</button>				
						</div>
						</div>
				</div>

			</div>
		</div>
	</div>
   	
   		
   		
   	

</body>
</html>