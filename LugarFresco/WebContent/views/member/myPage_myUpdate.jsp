<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String img = (String)request.getAttribute("img");
	String email = (String)request.getAttribute("email");
	String nickName = (String)request.getAttribute("nickName");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	.app-content div{padding:15px; font-weight:bold; color:#666;}
	.app-content label{padding-top:9px;}
	/* #cafeImg, #cafeReg{display:block; width:80px; height:80px; border:1px solid black;} */
	/* #cafeName{width:353px;} */
	
	#app-content body, h1{
		text-align: center !important;
		margin-left : 150;
	}
	.app-content label{font-size:20px; color:black;}
	
	.form-control {
		/* width: 50%  !important; */
		text-align: center !important;
		content: center !important;
	}
	#uploadFile{width:100%;}
	#titleImgArea{width:150px; height:150px; display:block;}
	#titleImgArea > img{width:100%; height:100%;}
	#titleImgArea:hover{cursor:pointer;}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
   	
   	<div class="app-title" style="text-align:center;">
   		<h1 style="text-align:center;"><i class="app-menu__icon fa fa-user-o"></i> 내 정보 수정</h1>
   	</div>
   	
   	<div class="col-md-6" style="margin-left:200px !important;" align="center">
          <div class="tile">
            <div class="tile-body">
              <form action="<%= conPath %>/updateMember.mp" method="post" enctype="multipart/form-data" onsubmit="return nickNameCheck();">
	               <div id="uploadFile" class="form-group">
	                 <label class="control-label" for="profileImg">프로필 이미지<br> * 수정 시 아래 상자를 클릭해주세요 *</label>
	                 <span id="titleImgArea"><img id="profileImg" src="<%= conPath %>/resources/fileupload/profile/<%=img%>"></span>
	                 
	               </div>
	               
	               <div class="form-group">
	                  <label class="control-label">이메일</label>
					  <input type="text" class="form-control" id="email" name="email" value="<%= email %>" readonly>
	               </div>
	          
	               
	               <div class="form-group">
	                 <label class="control-label" for="nickName">닉네임</label>
	                 <input type="text" class="form-control" id="nickName" name="nickName" placeholder="(한글, 영문, 숫자를 사용하여 3~8자로 작성해주세요)" maxlength="8" value="<%= nickName %>">
	                 
	                 <!-- ajax 닉네임 중복확인 div -->
	                 <div>
	                 	<span id="nickNameCheck1" style="display:none; text-align:right;">사용 가능한 닉네임입니다!</span>
						<span id="nickNameCheck2" style="display:none; text-align:right;">이미 사용중인 닉네임입니다!</span>
	                 </div>
	               </div>
	             
		            <div class="tile-footer">
		              <button class="btn btn-primary" type="submit" id="updateBtn" style="margin-right:10px;">
		              	<i class="fa fa-fw fa-lg fa-check-circle"></i>
		              		수정하기
		              </button>&nbsp;&nbsp;&nbsp;
		              
		              <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal111">
		              	<i class="fa fa-fw fa-lg fa-check-circle"></i>
		              		비밀번호 변경하기
		              </button>
		            </div>
		            
		            <div id="fileArea">
	                  <input class="form-control" type="file" id="thumbnailImg" name="thumbnailImg" onchange="loadImg(this, 1);">
	                </div>
	            </form>
            </div>
          </div>
        </div>
        
        
   		
   		<%-- 파일 첨부 관련 스크립트 --%>
   		<script>
   			// 각 div 클릭할 때 파일 첨부 창이 뜨도록
			$(function(){
				$("#fileArea").hide();
				
				// 순서에 맞춰서 처리
				$("#titleImgArea").click(function(){
					$("#thumbnailImg").click();
				});
			});
			
			// 파일 첨부했을 때 미리보기 공간에 미리보기가 가능하게 하는 함수
			// [참고] https://developer.mozilla.org/ko/docs/Web/API/FileReader
			function loadImg(value, num){
				//console.log(num);
				// value --> input type="file" ~~~
				// num --> 각 번호 (나중에 조건처리할거임)
				
				// 파일의 존재 여부
				if(value.files && value.files[0]){
					
					// 1. 파일을 읽어들일 FileReader 객체 생성
					var reader = new FileReader();
					
					// 2. 파일 읽기가 다 완료되었을 때 실행되는 메소드
					reader.onload = function(e){
						
						if(num == 1){
							$("#profileImg").attr("src", e.target.result);
						}
						
					}
					
					// 파일 읽기 메소드
					reader.readAsDataURL(value.files[0]);
					
				}
				
			}
   		</script>
   		
   		<%-- 회원 정보 수정 유효성 검사 --%>
   		<script>
		function nickNameCheck(){
			var nickName = $("#nickName").val();
			
			var regExp = /^[가-힣a-zA-Z0-9]{3,8}$/;
			
			if(nickName.trim() == ""){
				alert("닉네임을 입력해주세요.");
				$("#nickName").val("").focus();
				return false;
			}
			
			if(!regExp.test(nickName)){
				alert("닉네임을 형식에 맞게 입력해주세요.");
				$("#nickName").val("").focus();
				return false;
			}
		}
		</script>
		
		<script>
			$("#nickName").on("input", function(){
				var nickName = $("#nickName").val();
				
				var regExp = /^[가-힣a-zA-Z0-9]{3,8}$/;
				
				if(regExp.test(nickName)) {
					
					$.ajax({
						url:"joinCheckNickName.me",
						data:{nickName:nickName},
						type:"post",
						success:function(result){
							if(result == "1"){
								$("#nickNameCheck1").css("display", "block");
								$("#nickNameCheck2").css("display", "none");
								$("#nickNameCheck1").css({"color":"#1DDB16", "font-weight":"bold"});
								
								$("#updateBtn").removeAttr("disabled", true);
							}else{
								$("#nickNameCheck2").css("display", "block");
								$("#nickNameCheck1").css("display", "none");
								$("#nickNameCheck2").css({"color":"red", "font-weight":"bold"});
								
								$("#updateBtn").attr("disabled", true);
							}
							
							if(nickName == ""){
								$("#nickNameCheck1").css("display", "none");
								$("#nickNameCheck2").css("display", "none");
							}
						},
						error:function(result){
							alert("실패!");
						}
						
					});
				}else{
					$("#nickNameCheck1").css("display", "none");
					$("#nickNameCheck2").css("display", "none");
				}
				
			});
		</script>
		
		<%-- 새 비밀번호, 새 비밀번호 확인 일치하는지 체크 --%>
		<script>
			function pwdCheck(){
				var userPwd = $("#userPwd").val();
				var newPwd1 = $("#newPwd1").val();
				var newPwd2 = $("#newPwd2").val();
				
				var regExp = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;
				
				if(userPwd != <%=loginUser.getPass()%>){
					alert("현재 비밀번호를 잘못 입력하였습니다.");
					$("#userPwd").val("").focus();
					return false;
				}
				if(userPwd == newPwd1){
					alert("변경하려는 비밀번호가 현재 비밀번호와 동일합니다.");
					$("#newPwd1").val("").focus();
					$("#newPwd2").val("");
					return false;
				}
				if(!regExp.test(newPwd1)){
					alert("비밀번호를 형식을 확인하고 다시 입력해주세요.");
					$("#newPwd1").val("").focus();
					$("#newPwd2").val("");
					return false;
				}
				if(newPwd1 != newPwd2){
					alert("새 비밀번호가 일치하지 않습니다.");
					$("#newPwd2").val("").focus();
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
            <h5 class="modal-title">비밀번호 변경</h5>
            <button class="close" type="button" onclick="reset();" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
          </div>
          <form action="<%=conPath %>/updatePwd.mp" method="post" onsubmit="return pwdCheck();">
	          <div class="modal-body">
	           <label>현재 비밀번호</label><input type="password" id="userPwd" name="userPwd" maxlength="16" class="form form-control"><br>
	           <label>새 비밀번호</label><input type="password" id="newPwd1" name="newPwd1" maxlength="16" class="form form-control"><br>
	           <label>새 비밀번호 확인</label><input type="password" id="newPwd2" name="newPwd2" maxlength="16" class="form form-control">
	          </div>
	          <div class="modal-footer">
	            <button class="btn btn-primary" type="submit">변경하기</button>
	            <button class="btn btn-secondary" type="button" onclick="reset();" data-dismiss="modal">닫기</button>
	          </div>
          </form>
        </div>
      </div>
    </div>
       
</body>
</html>