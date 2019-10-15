<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.question.model.vo.QnAList"%>
<%
	QnAList q = (QnAList)request.getAttribute("result");
	String[] nameNo = q.getNickname().split(",");
%>
<style>
div .btn{
	width:105px;
	height:42px;
	font-size:16px;
}
</style>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<form action="<%=conPath %>/q_update.qu" method="post">
		<div class="container" style="width:550px;border: 1px solid white; height: 800px;">
		<br>
			<h1 align="center">문의내용</h1>
			<br><br>
			<table align="center">
				<tr>
					<td>
						<label class="control-label">제목</label>
						<input class="form-control" type="text" name="title" value="<%=q.getQ_title() %>" readonly>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label" >작성자&nbsp;</label>
						<input class="form-control" type="text" name="writer" value="<%=nameNo[0] %>" readonly>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label">내용</label>
						<textarea class="form-control" rows="13" cols="45" name="q_content" required><%=q.getQ_content() %></textarea>
					</td>
				</tr>
			</table>
			<br>
			<hr>
			<input type="hidden" name="q_no" value = <%=q.getQ_no() %>>
			<div align="center">
				<button class="btn btn-primary"  name="info" value="info" style="margin-left:215px; margin-right:15px;"><i class="fa fa-floppy-o" aria-hidden="true"></i>수정완료</button>
				<button class="btn btn-secondary" type="button" onclick="location.href='selectQuestion.qu?q_no=<%=q.getQ_no() %>&info=cancle'" style="margin-right:40px"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소하기</button>
			</div>
		</div>
	</form>
	<%@ include file="../includes/main/footer.jsp" %>
</body>
</html>