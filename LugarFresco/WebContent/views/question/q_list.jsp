<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,com.kh.question.model.vo.Question,com.kh.question.model.vo.PageInfo"%>
<%
@SuppressWarnings("unchecked")
	ArrayList<Question> q_list = (ArrayList<Question>)request.getAttribute("q_list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage=pi.getCurrentPage();
	int listCount=pi.getListCount();
	int pageLimit=pi.getPageLimit();
	int maxPage=pi.getMaxPage();
	int startPage=pi.getStartPage();
	int endPage=pi.getEndPage();
	int boardLimit=pi.getBoardLimit();
	int startQuestion = pi.getStartQuestion();
	int endQuestion = pi.getEndQuestion();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.page-item .page-link {
	width: 34.8px;
	font-size: 15px;
	border: 1px solid #fff;
	position: relative;
	display: block;
	padding: 0.5rem 0.75rem;
	margin-left: -1px;
	line-height: 1.25;
	color: #007bff;
	background-color: #fff;
}
</style>
</head>
<body id="bootstrap-overrides">
	<%@ include file="../includes/main/header.jsp"%>

	<!-- start banner Area -->
	<section class="banner-area relative" style="height: 400px;">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row align-items-end justify-content-between"
				style="height: 345px">

				<div class="col-lg-6 col-md-6 banner-left">
					<h6 class="text-white">문의 게시판</h6>
				</div>
			</div>
		</div>
	</section>

	<!-- End banner Area -->

	<div class="container" style="border: 1px solid white; height: 800px;">

		<br> <br>

		<table style="border: 1px solid #dddddd;" class="table" id="detail">
			<tr>
				<th style="background-color: #fafafa; text-align: center;">No.</th>
				<th style="background-color: #fafafa; text-align: center;">제목</th>
				<th style="background-color: #fafafa; text-align: center;">작성자</th>
				<th style="background-color: #fafafa; text-align: center;">등록날짜</th>
			</tr>
			
			<%if(q_list.isEmpty()){ %>
			<tr>
				<td colspan="4" style="text-align: center;">
					<h2>QnA가 없습니다.</h2>
				</td>
			</tr>
			<%}else{ %>
				
				<%if(currentPage!=maxPage){
				for(int i = startQuestion; i<=endQuestion; i++){ 
				int j = i%10; 
				if(j==0) 
				j=10; %>
					<tr>
						<td name="q_no" value="<%=q_list.get(j-1).getQ_no()%>" style="text-align: center;"><%=i %></td>
						<td style="text-align: center;">
						<%if(q_list.get(j-1).getIsAnswer().equals("Y")){ %>
						re)
						<%} %>
						<%=q_list.get(j-1).getQ_title()%>
						</td>
						<td style="text-align: center;"><%=q_list.get(j-1).getQ_writer()%></td>
						<td style="text-align: center;"><%=q_list.get(j-1).getQ_date() %></td>
						<input type ="hidden" name="q_no" value="<%=q_list.get(j-1).getQ_no()%>">
					</tr>
					
					
					<%} %>
				<%}else{%>
					<%for(int i = startQuestion; i<=listCount; i++){ 
				int j = i%10; 
				if(j==0) 
				j=10; %>
					<tr>
						<td style="text-align: center;"><%=i %></td>		
						<td style="text-align: center;"><%=q_list.get(j-1).getQ_title()%></td>
						<td style="text-align: center;"><%=q_list.get(j-1).getQ_writer()%></td>
						<td style="text-align: center;"><%=q_list.get(j-1).getQ_date() %></td> 
						<input type ="hidden" name="q_no" value="<%=q_list.get(j-1).getQ_no()%>">
					</tr>
					<%}%>
				<%}%>
			<%} %>
		</table>

		<script>
		
			$("#detail td").mouseenter(function(){
				$(this).parent().children().css({"background":"darkgray", "cursor":"pointer"})
			}).mouseout(function(){
				$(this).parent().children().css({"background":"white"})
			}).click(function(){
				var q_no=$(this).parent().children().eq(4).val();
				location.href="<%=conPath%>/selectQuestion.qu?q_no="+q_no+"&info=info";
				
			});
		</script>
		<form action="<%=conPath %>/q_list.qu?info=search" method="get">
		<select name="search" style="display:inline; position:relative; left:35%">
		<option value="q_title">제목</option>
		<option value="q_writer">작성자</option>
		</select>
		<input type="text" name="word" style="transform:translateX(-50%); position:relative; left:45%;">
		<button style="position:relative; left:35%;">검색</button>
		<%if(loginUser != null){%>
			<input type="button" class="btn btn-primary pull-right" style="width:78px; height:38px"
				value="글쓰기" onclick="location.href='<%=conPath %>/q_insertForm.qu?m_no=<%= loginUser.getM_no() %>'">
	
		<%} %>
		</form>
		<br> <br> <br>
		<!-- ---------------------페이지 처리!!------------------ -->

		<div class="box-container">
			<ul class="pagination" style="justify-content: center;">
				<li class="page-item"><a class="page-link"
					onclick='location.href="<%=conPath%>/q_list.qu?currentPage=<%=1%>";'>&lt;&lt;</a></li>
				<li class="page-item"><a class="page-link"
					onclick='location.href="<%=conPath%>/q_list.qu?currentPage=<%=currentPage-1%>";'>&lt;</a></li>

				<%for(int i = startPage; i<=endPage; i++){ %>
				<%if(i == currentPage){ %>
				<li class="page-item"><button class="page-link"
						onclick='location.href="<%=conPath%>/q_list.qu?currentPage=<%=i%>";'
						disabled><%=i %></button></li>
				<%}else{ %>
				<li class="page-item"><a class="page-link"
					onclick='location.href="<%=conPath%>/q_list.qu?currentPage=<%=i%>";'><%=i %></a></li>
				<%} %>
				<%} %>
				<li class="page-item"><a class="page-link"
					onclick='location.href="<%=conPath%>/q_list.qu?currentPage=<%=currentPage+1%>";'>&gt;</a></li>
				<li class="page-item"><a class="page-link"
					onclick='location.href="<%=conPath%>/q_list.qu?currentPage=<%=maxPage%>";'>&gt;&gt;</a></li>

			</ul>
		</div>
	</div>

	<%@ include file="../includes/main/footer.jsp"%> --%>

</body>
</html>