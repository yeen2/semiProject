<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.notice.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../includes/main/header.jsp" %>
	
	<!-- start banner Area -->
			<section class="banner-area relative" style="height:400px;">
				<div class="overlay overlay-bg"></div>
				<div class="col-lg-6 col-md-6 banner-left">
					<h6 class="text-white">공지사항</h6>
				</div>
								
				<div class="container">
					<div class="row align-items-end justify-content-between" style="height:345px">
						
						<div class="col-lg-6 col-md-6 banner-left">
							<h6 class="text-white">공지사항</h6>
						</div>
					</div>
				</div>					
				
			</section>
	<!-- End banner Area -->

		<div style="height: 700px; width: 600px; margin: auto">
			<!-- <div style="height: 10%; margin-top: 100px;" align="center">
			</div> -->
			<h3 class="tile-title" style="margin-top: 30px;" align="center">상세보기<i class="material-icons">event_note</i></h3><br>
			<div class="tile-body"> 
				<div class="form-group">
                  <label class="control-label">제목</label>
                  <input class="form-control" type="text" name="title" value="<%=n.getTitle()%>" readonly>
                </div>
                <div class="form-group">
                  <label class="control-label">등록일</label>
                  <input class="form-control" type="date" value="<%=n.getReg_date()%>" readonly>
                </div>
                <div class="form-group">
                  <label class="control-label">내용</label>
                  <textarea name="content" class="form-control" rows="10" style="resize:none;" readonly><%=n.getContent()%></textarea>
                </div>
                <br>
	            <hr/>
	            <br>
				<div align="center">
					<button type="button" class="btn btn-primary btn-sm" onclick="location.href='<%=conPath%>/list.no';">돌아가기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<% if(loginUser != null && loginUser.getEmail().equals("admin")){ %>
					<button type="button" class="btn btn-secondary btn-sm" onclick="updateForm();">수정하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='<%=conPath%>/delete.no?n_no=<%=n.getN_no()%>';">삭제하기</button>
					<% } %>					
				</div>
			
			</div>
		
		</div>
		
		<br>
		<br>
		<br>
		
	<script>
		function updateForm(){
			location.href="<%=conPath%>/updateForm.no?n_no=<%=n.getN_no()%>";
		}
		
		
	</script>	




	<%@ include file="../includes/main/footer.jsp" %>

</body>
</html>