<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Login - Vali Admin</title>
    
    <style>
    .cover img{
		position: absolute; top:0; left: 0;
		width: 100%;
		height: 70%;
	}
	.login-box{
		 width:350px;
		 height:520px;
	}
    </style>
    
  </head>
  <body>
  
  	<%@include file="../includes/main/header.jsp" %>
  
    <section class="material-half-bg" style="background:white;">
      <div class="cover">
      	<img src="<%=conPath %>/resources/images/login_main.jpg">
      </div>
      
    </section>
    <section class="login-content">
      <div class="logo">
      </div>
      <div class="login-box">
      
      	<!-- 로그인 form -->
        <form class="login-form" action="login.me" method="post">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
          <div class="form-group">
            <label class="control-label">EMAIL</label>
            <input class="form-control" type="text" placeholder="Email" name="email" autofocus>
          </div>
          <div class="form-group">
            <label class="control-label">PASSWORD</label>
            <input class="form-control" type="password" name="pass" placeholder="Password">
          </div>
          <div class="form-group">
            <div class="utility">
              <div class="animated-checkbox">
                <label>
                  <input type="checkbox"><span class="label-text">Stay Signed in</span>
                </label>
              </div>
              <p class="semibold-text mb-2"><a href="#" data-toggle="flip">Forgot Password ?</a></p>
            </div>
          </div>
          
          <!-- 로그인 버튼 -->
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>SIGN IN</button>
          </div>
          
          <br>
          
          <!-- 카카오 로그인 버튼 -->         
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block" type="button" id="kakaoBtn"
            		style="padding-top: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;
	    			border-top-width: 0px;border-right-width: 0px;border-bottom-width: 0px;border-left-width: 0px;width: 240px;
	    			height: 44px;margin-left: 15px;">
	    		<img src="<%=conPath%>/resources/images/login_kakao_btn.png" width="240" height="46">
	    	</button>
          </div>
 
          <!-- 네이버 로그인 버튼 -->   
          <div class="form-group btn-container" style="margin-top: 15px;">
            <button class="btn btn-primary btn-block" style="padding-top: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;
	    				border-top-width: 0px;border-right-width: 0px;border-bottom-width: 0px;border-left-width: 0px;width: 240px;
	    				height: 44px;margin-left: 15px;">
	    		<img src="<%=conPath%>/resources/images/login_naver_btn.png" width="240" height="45">
	    	</button>
          </div>
        </form>
              
        <!-- 비밀번호 찾기  -->
        <form class="forget-form" action="searchPass.me" method="post">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Forgot Password ?</h3>
          <div class="form-group">
            <label class="control-label">이메일</label>
            <input class="form-control" type="email" placeholder="Email" name="email">
          </div>
          <div class="form-group">
            <label class="control-label">닉네임</label>
            <input class="form-control" type="text" placeholder="Nick Name" name="nickName">
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>RESET</button>
          </div>
          <div class="form-group mt-3">
            <p class="semibold-text mb-0"><a href="#" data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Back to Login</a></p>
          </div>
        </form>   
      </div>
    </section>
    
    <%@include file="../includes/main/footer.jsp" %>
    
    
    <!-- Essential javascripts for application to work-->
    <script src="<%=conPath %>/resources/js/jquery-3.2.1.min.js"></script>
    <script src="<%=conPath %>/resources/js/popper.min.js"></script>
    <script src="<%=conPath %>/resources/js/bootstrap.min.js"></script>
    <script src="<%=conPath %>/resources/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="<%=conPath %>/resources/js/plugins/pace.min.js"></script>
    
    
    
    <script type="text/javascript">
      // Login Page Flipbox control
      $('.login-content [data-toggle="flip"]').click(function() {
      	$('.login-box').toggleClass('flipped');
      	return false;
      });
    </script>
    
    <%-- 카카오 로그인 api --%>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
		$(document).ready(function(){
			Kakao.init("43c418db70d8c1c6392316577a947ee1");
			function getKakaotalkUserProfile(){
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						alert(res.kakao_account);
						location.href="<%=conPath%>/joinForm.me";
						
					},
					fail: function(error) {
						console.log(error);
					}
				});
			}
			function createKakaotalkLogin(){
				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
				var loginBtn = $("#kakaoBtn");
				loginBtn.click(function(){
					Kakao.Auth.login({
						persistAccessToken: true,
						persistRefreshToken: true,
						success: function(authObj) {
							getKakaotalkUserProfile();
							createKakaotalkLogout();
						},
						fail: function(err) {
							console.log(err);
						}
					});
				});
				$("#kakao-logged-group").prepend(loginBtn)
			}
			function createKakaotalkLogout(){
				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
				var logoutBtn = $("<a/>",{"class":"kakao-logout-btn","text":"로그아웃"});
				logoutBtn.click(function(){
					Kakao.Auth.logout();
					createKakaotalkLogin();
					$("#kakao-profile").text("");
				});
				$("#kakao-logged-group").prepend(logoutBtn);
			}
			if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){
				createKakaotalkLogout();
				getKakaotalkUserProfile();
			}else{
				createKakaotalkLogin();
			}
		});
	</script>
  </body>
  
  
</html>