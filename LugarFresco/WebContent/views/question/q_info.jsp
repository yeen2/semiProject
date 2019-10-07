<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.question.model.vo.Question"%>
<%
	Question q = (Question)request.getAttribute("result");
	String[] nameNo = q.getQ_writer().split(",");
	
	
	
%>
<style>
	
	td .input{
		
		padding: 0.375rem 0.75rem;
	}
	div .btn{
		width:87px;
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
<body id="bootstrap-overrieds">


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
		<h1 align="center">문의내용</h1>
		<br><br>
		<table align="center">
		<tr>
		
		<td><label class="control-label">제목</label>
		<input class="form-control" type="text" name="title" value="<%=q.getQ_title() %>" readonly></td>
		</tr>
		<tr>
		
		<td><label class="control-label" >작성자&nbsp;</label>
		<input class="form-control" type="text" name="writer" value="<%=nameNo[0] %>" readonly></td>
		</tr>
		<tr>
		
		<td><label class="control-label">내용</label>
		<div class="form-control" style="width:427px; height:386px;" readonly>
		
		<%=q.getQ_content() %>
		<%if(q.getIsAnswer().equals("Y")){ %>
		<br>
		---------------------&nbsp;&nbsp;re&nbsp;&nbsp;&nbsp;----------------------
		<br>
		<br>
		<%=q.getA_content() %>
		<%} %>
		</div></td>
		</tr>
		</table>
		<br>
		
		<hr>
		<div align="center">
			
		<%if(Integer.parseInt(nameNo[1]) == loginUser.getM_no() && loginUser!=null){%>

		<button class="btn btn-primary"  onclick="location.href='<%=conPath %>/selectQuestion.qu?q_no=<%=q.getQ_no() %>&info=update';" >수정</button>
		<button class="btn btn-primary" onclick="location.href='<%=conPath %>/q_delete.qu?q_no=<%=q.getQ_no() %>';" style="margin-left:15px" >삭제</button>
		<button class="btn btn-secondary"  onclick="location.href='<%=conPath %>/q_list.qu';" style="margin-left:150px"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소</button>
			<%}else if(loginUser.getNickName().equals("admin")){ %>
		<button class="btn btn-primary" onclick="location.href='<%=conPath%>/selectQuestion.qu?q_no=<%=q.getQ_no() %>&m_no=<%=loginUser.getM_no() %>&info=reply';">답글달기</button>
		<button class="btn btn-secondary"  onclick="location.href='<%=conPath %>/q_list.qu';" style = "margin-left:10px"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소</button>
		<%}else{ %>
		<button class="btn btn-secondary"  onclick="location.href='<%=conPath %>/q_list.qu';" ><i class="fa fa-fw fa-lg fa-times-circle"></i>취소</button>
		<%} %>
		</div>
	
</div>

	<%@ include file="../includes/main/footer.jsp" %>
</body>
</html>