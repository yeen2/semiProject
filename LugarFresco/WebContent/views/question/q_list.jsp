<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,com.kh.question.model.vo.Question,com.kh.question.model.vo.PageInfo"%>
<%
@SuppressWarnings("unchecked")// ArrayList<Question> 자료형 오류 잡는 코드
	ArrayList<Question> q_list = (ArrayList<Question>)request.getAttribute("q_list"); // q_list뿌려줄 Question 객체, 서블릿QuestionlistSerlet으로부터온거임
	PageInfo pi = (PageInfo)request.getAttribute("pi"); //페이지 처리하기위한 변수들이 담겨있는 PageInfo객체, QuestionListServlet으로 부터 온거다.
	int currentPage=pi.getCurrentPage(); // 현재페이지
	int listCount=pi.getListCount(); 	 // 총 리스트 갯수
	int pageLimit=pi.getPageLimit();	 // 브라우저 page에서 한계 페이지 변수 10개로 설정 
	int maxPage=pi.getMaxPage();		 // 총 리스트 갯수로부터 몇 페이지가 나올지 계산한 변수
	int startPage=pi.getStartPage(); 	 // 브라우저 page에서 시작할 페이지 변수
	int endPage=pi.getEndPage();		 // 브라우저 page에서 끝나는 페이지 변수
	int boardLimit=pi.getBoardLimit();	 // 브라우저 page에서 한계 게시판 변수
	int startQuestion = pi.getStartQuestion();// No를 순서대로 하기위해 만든 변수들 브라우저 한page에서 Question의 시작 할 변수 
	int endQuestion = pi.getEndQuestion();	  // 끝나는 Question갯수
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.page-item .page-link { /* 부트스트랩 오버라이딩 원리는 가중치로인한 것으로 부모선택자와 자식선택자의 가중치를 더한것이 부트스트랩 선택자보다 가중치가 높아지면 선택되어진다.*/ 
	width: 34.8px;	/* css 한것들 브라우저 f12로 부트스트랩 찾은다음에 복사 붙여넣기하면 된다.*/
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
.pagination #onelt{
	color:#777777;
}
.pagination #lastgt{
	color:#777777;
}
.col-md-offset-3 {
    margin-left: 30%;
}
.col-md-offset-2{
	margin-left:18%
	}

</style>
</head>
<body id="bootstrap-overrides"> <!-- 부트스트랩 오버라이딩을 쓰기위한 준비작업 이것만 하면 오버라이딩 을 쓸수있다. 부트스트랩 연결해야되는것 같음 -->
<%@ include file="../includes/main/header.jsp"%>

	<!-- start banner Area -->
	
	<section class="banner-area relative" style="height: 400px;"><!-- class 에 부트스트랩 선택자들을 적어서 css을 먹히게한다. -->
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row align-items-end justify-content-between" style="height: 345px">
				<div class="col-lg-6 col-md-6 banner-left">
					<h6 class="text-white">문의 게시판</h6>
				</div>
			</div>
		</div>
	</section>

	<!-- End banner Area -->

	<div class="container" style="border: 1px solid white; height: 800px;">
		<br><br>
		<table style="border: 1px solid #dddddd;" class="table" id="detail">
		<tr>
			<th style="background-color: #fafafa; text-align: center;">No.</th>
			<th style="background-color: #fafafa; text-align: center;">제목</th>
			<th style="background-color: #fafafa; text-align: center;">작성자</th>
			<th style="background-color: #fafafa; text-align: center;">등록날짜</th>
		</tr>
		<%if(q_list.isEmpty()){ %>
			<tr>
				<td colspan="4" style="text-align: center;"><h2>QnA가 없습니다.</h2></td>
			</tr>
		<%}else{ %>
		<!-- -----------------------------No를 순서대로 하기위한 코드------------------------------- -->
		<!--  설명하고 싶지만 부딪혀가면서 쓴거라 설명할수 있는 부분만 쓰겠다.-->
		<!--  j는 db에서 10단위로 끊겨서 나오기때문에 for문 돌때마다 1~10까지를 반복해야된다. get(j-1)을 한이유는 자바 인덱스는 0부터 시작하기 때문이다. -->
		<!--  currentPage마다 불러오는 q_no가 다르고 q_list.get(j-1)에 담긴 숫자도 다르게 돌고 No를 붙일 숫자는 순서대로 돌게끔 만들면 된다. -->
			<%if(currentPage!=maxPage){
				System.out.println(endQuestion);
				System.out.println(startQuestion);
				for(int i = startQuestion; i<=endQuestion; i++){ 
					int j = i%10; 
					if(j==0) 
						j=10;%>
					<tr>
						<td name="q_no" value="<%=q_list.get(10-j).getQ_no()%>" style="text-align: center;"><%=listCount-i+1 %></td>
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
			<%}else{
				//-----------------------------------------------------------------------------------
				// 마지막 페이지의 Question 갯수는 다르므로 따로 처리해주었다. 원리는 위에 도는 숫자들을 다르게 돌리면 된다... 어렵네
				for(int i = startQuestion; i<=listCount; i++){ 
					int j = i%10; 
					if(j==0) 
						j=10; %>
				<tr>
					<td style="text-align: center;"><%=listCount-i+1 %></td>		
					<td style="text-align: center;"><%=q_list.get(j-1).getQ_title()%></td>
					<td style="text-align: center;"><%=q_list.get(j-1).getQ_writer()%></td>
					<td style="text-align: center;"><%=q_list.get(j-1).getQ_date() %></td> 
					<input type ="hidden" name="q_no" value="<%=q_list.get(j-1).getQ_no()%>">
				</tr>
				<%}%>
			<%}%>
		<script>
		// 행을 선택하도록 하는 javascript 수업시간에 했으므로 pass
			$("#detail td").mouseenter(function(){
				$(this).parent().children().css({"background":"darkgray", "cursor":"pointer"})
			}).mouseout(function(){
				$(this).parent().children().css({"background":"white"})
			}).click(function(){
				var q_no=$(this).parent().children().eq(4).val();
				location.href="<%=conPath%>/selectQuestion.qu?q_no="+q_no+"&info=info";
			});
		</script>
		
		<%} %>
	</table>

		<!-- form 태그 너무 재밌는 녀석 action에 적힌 맵핑값으로 servlet에 name에 적힌 키값과 value에 적힌 값들이 넘어간다. -->
		<!-- 또 form 에 있는 버튼들은 type을 안적으면 submit으로 자동으로 변환된다. action으로 보내기 싫으면 button으로 타입을 지정할것 -->
<form action="<%=conPath %>/q_list.qu?info=search" method="get">
	
	<div class="row form-lined" >
		
		<select class="form-control col-md-1 col-md-offset-3 " name="search">
			<option value="q_title">제목</option>
			<option value="q_writer">작성자</option>
		</select>
		
		<input class="form-control col-md-3" type="text" name="word" >
		<button class="btn btn-primary btn-md col-md-1"><i class="fa fa-check" aria-hidden="true"></i>검색</button>
			<%if(loginUser != null){%>
				<button type="button" class="btn btn-primary btn-md col-md-offset-2 col-md-1"
				onclick="location.href='<%=conPath %>/q_insertForm.qu?m_no=<%= loginUser.getM_no() %>'"><i class="fa fa-fw fa-lg fa-check-circle">
				</i>등록
				</button>
			<%} %>
	</div>
</form>
<br><br><br>
<!-- ---------------------페이지 처리!!------------------ -->
<!--  수업시간에 했으므로 패스 -->
		<div class="box-container">
			<ul class="pagination" style="justify-content: center;">
				<li class="page-item"><a class="page-link" onclick='location.href="<%=conPath%>/q_list.qu?currentPage=<%=1%>";'>&lt;&lt;</a></li>
				<%if(currentPage==1){ %>
					<li class="page-item"><button id="onelt" class="page-link" onclick='location.href="<%=conPath%>/q_list.qu?currentPage=<%=currentPage-1%>";' disabled>&lt;</button></li>
				<%}else{ %>
				<li class="page-item"><a class="page-link" onclick='location.href="<%=conPath%>/q_list.qu?currentPage=<%=currentPage-1%>";'>&lt;</a></li>
				<%} %>
				<%for(int i = startPage; i<=endPage; i++){ %>
					<%if(i == currentPage){ %>
						<li class="page-item"><button class="page-link" 
						onclick='location.href="<%=conPath%>/q_list.qu?currentPage=<%=i%>";' 
						disabled style="color:007bff;"><%=i %></button></li>
					<%}else{ %>
						<li class="page-item">
							<a class="page-link" onclick='location.href="<%=conPath%>/q_list.qu?currentPage=<%=i%>";'><%=i %>
							</a>
						</li>
					<%} %>
				<%} %>
				<%if(currentPage==maxPage){ %>
					<li class="page-item">
						<button id="lastgt" class="page-link"
						onclick='location.href="<%=conPath%>/q_list.qu?currentPage=<%=currentPage+1%>";' disabled>&gt;
						</button>
					</li>
				<%}else{ %>
					<li class="page-item">
						<a class="page-link"
						onclick='location.href="<%=conPath%>/q_list.qu?currentPage=<%=currentPage+1%>";' >&gt;
						</a>
					</li>
				<%} %>
					<li class="page-item">
						<a class="page-link"
						onclick='location.href="<%=conPath%>/q_list.qu?currentPage=<%=maxPage%>";'>&gt;&gt;
						</a>
					</li>
				</ul>
			</div>
		</div>
	<%@ include file="../includes/main/footer.jsp"%> --%>
</body>
</html>