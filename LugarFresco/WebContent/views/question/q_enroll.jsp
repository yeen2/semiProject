<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String nickName= (String)request.getAttribute("nickName"); %>
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
				<div class="row align-items-end justify-content-between" style="height:345px">		
					<div class="col-lg-6 col-md-6 banner-left">
						<h6 class="text-white">문의 게시판</h6>
					</div>
				</div>
			</div>			
		</section>
	<!-- End banner Area -->
	
		<div style="height: 1000px; width: 600px;margin: auto">
			<div style="height: 10%; margin-top: 100px;" align="center">
				<h3 class="tile-title" style="margin-top: 30px;">문의사항을 남겨주시면 답변드리겠습니다!</h3>
			</div>
		<div class="tile-body"> 
			<form action="<%=conPath%>/q_insert.qu" method="post" >
				<div class="form-group">
                  <label class="control-label">제목</label>
                  <input class="form-control" type="text" name= "q_title" placeholder="제목" required>
                </div>
                <div class="form-group">
                  <label class="control-label">작성자</label>
                  <input class="form-control" type="text" name="q_nickname" value="<%=nickName %>" readonly>
                </div>
                <div class="form-group">
                  <label class="control-label">내용</label>
                  <textarea class="form-control" rows="10" name="q_content" placeholder="내용" required></textarea>
                </div>
                <input type="hidden" name="m_no" value="<%=loginUser.getM_no() %>">
                <hr>
                <div class="tile-footer" align="center">
           		   <button class="btn btn-primary" type="submit" ><i class="fa fa-fw fa-lg fa-check-circle"></i>등록하기</button>&nbsp;&nbsp;&nbsp;
          	   	   <button type="button" class="btn btn-secondary" onclick='location.href="<%=conPath%>/q_list.qu"'><i class="fa fa-fw fa-lg fa-times-circle"></i>취소하기</button>
            	</div>
			</form>
		</div>
		</div>
		
	<%@ include file = "../includes/main/footer.jsp" %>

</body>
</html>