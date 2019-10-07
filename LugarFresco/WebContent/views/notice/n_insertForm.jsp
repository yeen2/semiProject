<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, java.text.SimpleDateFormat"%>
<%
	Date date = new Date();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(date);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	
	<div style="height: 1000px; width: 600px; margin: auto">
		<!-- <div style="height: 10%; margin-top: 100px;" align="center">
		</div> -->
			<h3 class="tile-title" style="margin-top: 30px;" align="center">공지사항 작성</h3><br>
		
		<div class="tile-body"> 
		
		
			<form action="<%= conPath %>/insert.no" method="post">
				<div class="form-group">
                  <label class="control-label">제목</label>
                  <input class="form-control" type="text" name="title">
                </div>
                <div class="form-group">
                  <label class="control-label">작성일</label>
                  <input class="form-control" type="date" value="<%= today %>" readonly>
                </div>
                <div class="form-group">
                  <label class="control-label">내용</label>
                  <textarea name="content" class="form-control" rows="10" placeholder="내용"></textarea>
                </div>
                <hr/>
                <div class="tile-footer" align="center">
              <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>등록하기</button>&nbsp;&nbsp;&nbsp;
              <a class="btn btn-secondary" href="list.no"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소하기</a>
            </div>
			</form>
			
			
		</div>
	
	</div>

	
	
	<%@ include file="../includes/main/footer.jsp" %>

</body>
</html>