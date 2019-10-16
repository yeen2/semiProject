<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.kh.cafe.model.vo.*, com.kh.admin.model.vo.PageInfo,java.util.ArrayList"%>
    
<%
	ArrayList<Cafe> list = (ArrayList<Cafe>) request.getAttribute("list");

//	int result = (int)request.getAttribute("result");
	
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
    
   	<main class="app-content" style="background:white;">
   		

	<div style="margin-top: 50px; height: 20%;" align="center"
		class="form-inline">
		<form action="<%=request.getContextPath()%>/cafeApplyList.ap"
			class="form-inline my-2 my-lg-0">
			<select name="kinds" class="form-control">
				<option>-----</option>
				<option value="cafeName">카페명</option>
				<option value="applicantName">신청자</option>
			</select> <input type="text" name="search" class="form-control mr-sm-2"
				size="20" placeholder="내용을 입력하세요.">
			<button type="submit" class="btn btn-outline-secondary my-2 my-sm-0">검색</button>
		</form>
	</div>
	
	<div style="height: 50%;">
		<table class="table"
			style="text-align: center; border: 1px solid #dddddd; margin-top: 50px;">
			<thead>
				<tr>
					<th style="background-color: #fafafa; text-align: center;">No.</th>
					<th style="background-color: #fafafa; text-align: center;">카페명</th>
					<th style="background-color: #fafafa; text-align: center;">신청자</th>
					<th style="background-color: #fafafa; text-align: center;">신청날짜</th>
					<th style="background-color: #fafafa; text-align: center;">등록날짜</th>
					<th style="background-color: #fafafa; text-align: center;">카페 등록 여부</th>
					<th style="background-color: #fafafa; text-align: center;">사업자 등록증</th>
				</tr>
				<%if(msg == null){ %>
 				<%for(Cafe c : list) { %>
				<tr>
					<td><input type="checkbox" value="<%=c.getC_no() %>"
						name="ckbox">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=c.getC_no() %></td>
					<td><a class="announce" data-toggle="modal" value="<%=c.getCafe_name() %>"><%=c.getCafe_name() %></a></td>
					<!-- cafeInfo에서 수정 삭제 처리. -->
					<td><%=c.getNickName() %></td>
					<td><%=c.getReg_date() %></td>
					<% if(c.getUpload_date() != null){ %>
						<td><%=c.getUpload_date()%></td>
					<% }else{ %>
						<td></td>
					<% } %>
					<td><%=c.getIsUpload() %></td>
					<td>
						<a class="btn btn-secondary" type="button" href="<%=conPath%>/download.mp?cno=<%=c.getC_no()%>">다운로드</a>
					</td>
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
   <div style="margin-top: 30px; height: 50%">
   		<button class="btn btn-primary pull-right" onclick="cafeRegistration();">카페등록</button>
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

	function cafeRegistration(){
		if($("input:checkbox[name=ckbox]:checked").length == 0){
			alert("등록하실 카페번호를 체크하세요.");
		}else{
		alert("카페등록이 성공적으로 완료되었습니다.")
			location.href="<%=request.getContextPath() %>/cafeRegistration.ap?arr=" + arr.toString();
	
		}
	}
	
	
	</script>
	
	
	<%if(hidden != null) {%>
		
	<%} else { %>
	<div class="pagingArea" align="center" style="margin-top: 30px;">

		<!-- 맨 처음으로 (<<) -->
		<!-- 이전 페이지(<) -->
		<%if(currentPage == 1){ %>
		<button disabled="disabled" class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/cafeApplyList.ap?currentPage=1';">
			&lt;&lt;</button>
		<button disabled="disabled" class="btn btn-primary">&lt;</button>
		<%} else{ %>
		<button class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/cafeApplyList.ap?currentPage=1';">
			&lt;&lt;</button>
		<button class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/cafeApplyList.ap?currentPage=<%=currentPage-1%>';">&lt;</button>
		<%} %>
		
		<!-- 10개의 페이지 목록 -->
		<%for(int p=startPage; p<=endPage; p++){ %>
		<% 	if(p == currentPage){ %>

		<button disabled="disabled" class="btn btn-danger"><%=p%></button>

		<%} else{ %>
		
		

		<button
			onclick="location.href='<%=request.getContextPath()%>/cafeApplyList.ap?currentPage=<%=p%>';"
			class="btn btn-primary"><%=p %></button>

		<%}} %>

		<!-- 다음 페이지(>) -->
		<% if(currentPage == maxPage){ %>
		<button class="btn btn-primary" disabled="disabled">&gt;</button>
		<button disabled="disabled" class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/cafeApplyList.ap?currentPage=<%=maxPage%>';">&gt;&gt;</button>
		<%} else { %>
		<button class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/cafeApplyList.ap?currentPage=<%=currentPage+1%>';">&gt;</button>
		<button class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/cafeApplyList.ap?currentPage=<%=maxPage%>';">&gt;&gt;</button>

		<%} %>
		<!-- 맨끝페이지(>>) -->
	</div>	
   	<%} %>
   		
   	</main>
   	
   	
</body>
</html>