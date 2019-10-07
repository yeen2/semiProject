<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<div class="container">
					<div class="row fullscreen align-items-center justify-content-between">

					</div>
				</div>					
			</section>
	<!-- End banner Area -->
	
	<div style="height: 1000px; width: 600px;margin: auto">
		<div style="height: 10%; margin-top: 100px;" align="center">
			<h3 class="tile-title" style="margin-top: 30px;">공지사항 작성</h3>
		</div>
		<div class="tile-body"> 
		
			<form action="#">
				<div class="form-group">
                  <label class="control-label">제목</label>
                  <input class="form-control" type="text" placeholder="제목">
                </div>
                <div class="form-group">
                  <label class="control-label">작성자</label>
                  <input class="form-control" type="email" placeholder="admin@naver.com(고정)">
                </div>
                <div class="form-group">
                  <label class="control-label">내용</label>
                  <textarea class="form-control" rows="10" placeholder="내용"></textarea>
                </div>
                <hr />
                <div class="tile-footer" align="center">
              <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>등록하기</button>&nbsp;&nbsp;&nbsp;
              <a class="btn btn-secondary" href="list.jsp"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소하기</a>
            </div>
			</form>
			
		
		</div>
	
	</div>

	
	
	<%@ include file="../includes/main/footer.jsp" %>

</body>
</html>