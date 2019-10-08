<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<style>
	.card{
		margin-left: auto;
		margin-right: auto;
		margin-top: 50px;
	}
</style>


</head>
<body>
	 <%@include file="../includes/header.jsp" %>
   
   <!-- 각 li 누를때마다 active 바뀌게 js 코드 짜기 -->
      <ul class="app-menu">
		<li><a class="app-menu__item" href="<%=request.getContextPath() %>/myCafeList.op">
			<i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">
        		내 카페 리스트</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/myCafeReview.op">
        	<i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">
        		내 카페 리뷰 전체보기</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/myPowerList.op">
          	<i class="app-menu__icon fa fa-heart-o"></i><span class="app-menu__label">
        		파워링크 신청 리스트</span></a>
        </li>
      </ul>
    </aside>
    
    
    <!-- ----------------------------------코드시작 <main> 안에서 작성해야합니다~ --------------------------------------- -->
    
   	<main class="app-content">
   		
		
		<div class="card" style="width: 50%;" align="center">
  
		  <div class="card-body">
		    <h1 class="card-title">&lt;파워 등록 신청&gt;</h1>
		    <div class="card-text">
		    	<h5>
				Lugar fresco 메인 페이지 상단에 <br>
				카페정보가 게시되는 파워등록 광고입니다. <br>
				<br>
				파워등록기간 - 30일 <br>
				가격 - 1000원 <br>
				(평점순으로 등록됩니다) <br>
				<br>
				<br>
				신청을 누르시면 바로 결제페이지로 이동됩니다. <br>
				</h5>
			
		    </div>
		    <a class="btn btn-primary" type="submit" href="<%=conPath%>/payForm.op">신청</a>
		  </div>
		</div>
		
   	
   		
   		
   	</main>
   	
   	
</body>
</html>