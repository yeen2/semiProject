<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	.form-control {
		/* width: 50%  !important; */
		text-align: center !important;
		content: center !important;
	}
</style>
</head>
<body>
	
	  <%@include file="../includes/header.jsp" %>

     
     <!-- 각 li 누를때마다 active 바뀌게 js 코드 짜기 -->
      <ul class="app-menu">
      	 <li><a class="app-menu__item" href="<%=request.getContextPath() %>/myReview.mp">
        	<i class="app-menu__icon fa fa-pencil-square-o"></i><span class="app-menu__label">
        		내가 쓴 리뷰</span></a>
        </li> 
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/myLike.mp">
          	<i class="app-menu__icon fa fa-heart-o"></i><span class="app-menu__label">
        		내 좋아요</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/myFavorite.mp">
        		<i class="app-menu__icon fa fa-star-o"></i><span class="app-menu__label">
        		내 즐겨찾기</span></a>
        </li>
      	<li><a class="app-menu__item" href="<%=request.getContextPath() %>/myUpdateForm.mp">
			<i class="app-menu__icon fa fa-user-o"></i><span class="app-menu__label">
        		내 정보 수정</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/outForm.mp">
        	<i class="app-menu__icon fa fa-trash-o"></i><span class="app-menu__label">
        		회원 탈퇴</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/applyCafeForm.mp">
        	<i class="app-menu__icon fa fa-file-text-o"></i><span class="app-menu__label">
        		카페 등록 신청</span></a>
        </li>
      </ul>
    </aside>
    
    
    
        <!-- ----------------------------------코드시작 <main> 안에서 작성해야합니다~ --------------------------------------- -->
    
   	<main class="app-content">
   		
   		<div class="container" style="margin-top:8%;">

			<h1 style="font-size:45px; color:#666;">회원탈퇴 신청 시 아래 사항을 반드시 확인해주세요!</h1>
			<br>
			<hr>
			<div align="center">
				<div id="div1">
					<table style="border-collapse:separate; border-spacing:45px; font-size:30px;">
						<tr><td><label style="font-weight:bold;">1. 해당 이메일 계정으로 30일간 재가입이 불가능합니다!</label></td></tr>
						<tr><td><label style="font-weight:bold;">2. 회원정보가 삭제됩니다!</label><br>
						<p style="font-size:15px; color:#666;">회원탈퇴 즉시 아래에 해당하는 개인정보가 삭제됩니다.<br>개인정보 : 닉네임, 이메일 계정, 휴대폰 번호, 비밀번호</p></td>
						</tr>
					</table>
					
				</div>
				<hr>
				<br>
				<button type="button" data-toggle="modal" data-target="#modal111" class="btn btn-primary">탈퇴하기</button>
			</div>
		</div>
		
		<script>
			function deleteMember(){
				
				var userPwd = $("#userPwd").val();
				
				if(userPwd == "<%= loginUser.getPass() %>"){
					var real = confirm("회원님이 등록하신 카페도 삭제되며 복구할 수 없습니다. 정말로 탈퇴하시겠습니까?");
					
					if(real){
						location.href="<%=conPath%>/deleteMem.mp";
					}
				}else{
					alert("비밀번호를 잘못 입력하였습니다.");
					$("#userPwd").val("").focus();
					return false;
				}
				
			}
			
			// 닫기누르면 값 초기화
			function reset(){
				$("#userPwd").val("");
				$("#newPwd1").val("");
				$("#newPwd2").val("");
			}
		</script>
   		
   	</main>
   	
   	<div id="modal111" class="modal fade" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog" role="dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">회원 탈퇴</h5>
            <button class="close" type="button" onclick="reset();" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
          </div>
          <div class="modal-body">
           <label>비밀번호 확인</label>
             <input type="password" id="userPwd" name="userPwd" class="form form-control">
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary" type="button" onclick="return deleteMember();">탈퇴하기</button>
            <button class="btn btn-secondary" type="button" onclick="reset();" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
   	
</body>
</html>