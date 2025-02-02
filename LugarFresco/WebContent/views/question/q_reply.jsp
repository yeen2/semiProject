<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.question.model.vo.QnAList"%>
<% QnAList q= (QnAList)request.getAttribute("result"); 
	String q_title=q.getQ_title();
	String [] nickName = q.getNickname().split(",");
	String q_content = q.getQ_content();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#textarea textarea{
	border: 0px;
}
div .btn{
	width:105px;
	height:42px;
	font-size:16px;
	margin-left: 10px;
}
</style>
</head>
<body id="bootstrap-overrides">
<%@ include file="../includes/main/header.jsp" %>
	
	<!-- start banner Area -->
		<section class="banner-area relative" style="height:400px;">
			<div class="overlay overlay-bg"></div>				
			<div class="container">
				<div class="row align-items-end justify-content-between" style="height:345px">
					<div class="col-lg-6 col-md-6 banner-left">
						<h6 class="text-white">문의 게시판</h6>
					</div>
				</div>
			</div>					
		</section>
	<!-- End banner Area -->
	
	<div class="container" style="width:550px; border: 1px solid white; height: 800px;">
	<br>
		<h1 align="center">문의 답변</h1>
	<br><br>
			<table align="center">
				<tr>
					<td>
						<label class="control-label">제목</label>
						<input class="form-control" type="text" name="title" value="<%=q_title%>" readonly >
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label" >작성자&nbsp;</label>
						<input class="form-control" type="text" name="writer" value="<%=nickName[0] %>" readonly>
					</td>
				</tr>
				<tr>
					<td id="textarea">
						<label class="control-label">내용</label>
						<div class="form-control" > <%=q_content %>
						<br>re-------------------------------------------------
							<form action ="<%=conPath %>/q_update.qu" method="get">
								<textarea name="q_content" class="form-control" rows="13" cols="45" ><%=q.getA_content() %></textarea>
						</div>
					</td>
				</tr>
			</table>
			<input type = "hidden" name="q_no" value="<%=q.getQ_no()%>">
			<br>
			<hr>
			<div align="center">
			<br>
			<button name="info" value="reply" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i>작성완료</button>
			<button type="button" onclick="location.href='<%=conPath%>/selectQuestion.qu?q_no=<%=q.getQ_no()%>&info=cancle'" class="btn btn-secondary"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소하기</button>
			</div>
							</form>
	</div>
	<%@ include file="../includes/main/footer.jsp" %>
</body>
</html>