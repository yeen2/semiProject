<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join</title>
<style>
h2 {
	text-align: center;
}

p {
	text-align: center;
}

table {
	margin: auto;
	font-size:13px;
}

#inputmem td {
	text-align: right;
}

.full {
	width: 100%;
}

</style>
</head>
<body>
	<%@include file="../includes/main/header.jsp"%>

	<div class="container"
		style="border: 1px solid white; margin-top: 70px;">
		<br> <br>

		<h2>회원가입을 환영합니다.</h2>
		<br>
		<p font-size="14px">
			회원가입시 <b>Lugar Fresco</b> 의 다양한 서비스를 이용할 수 있습니다.
		</p>
		<br>

		<form action="<%=conPath%>/join.me" method="post" id="joinForm" onsubmit="return joinValidate();">
		
			<table id="inputmem" style="margin-left:29%;">
				<!-- 로그인창 정보입력테이블 -->
				<tr>
					<td style="padding: 10px;">
						<label>이메일주소 (아이디) : </label>
					</td>
					<td colspan='4'>
						<input type="text" id="email" name="email" maxlength="35" class="form-control" style="width:300px"
								placeholder="(이메일 주소를 제외한 아이디는 4~20자로 작성해주세요)">
					</td>
					
					<td colspan='3' style="width:250px; text-align:left; padding-left:15px; padding-bottom:3px;">
						<span id="emailCheck1" style="display:none;">사용 가능한 이메일입니다!</span>
						<span id="emailCheck2" style="display:none;">이미 사용중인 이메일입니다!</span>
						<span id="emailCheck3" style="display:none;">형식에 맞지 않는 이메일입니다!</span>
						
					</td>
				</tr>
				
				<tr>
					<td style="padding: 10px;">
						<label>닉네임 : </label>
					</td>
					<td colspan='4'>
						<input type="text" id="nickName" name="nickName" maxlength="8" placeholder="(한글, 영문, 숫자를 사용하여 3~8자로 작성해주세요)" class="form-control">
					</td>
					<td colspan='3' style="width:250px; text-align:left; padding-left:15px; padding-bottom:3px;">
						<span id="nickNameCheck1" style="display:none;">사용 가능한 닉네임입니다!</span>
						<span id="nickNameCheck2" style="display:none;">이미 사용중인 닉네임입니다!</span>
						<span id="nickNameCheck3" style="display:none;">형식에 맞지 않는 닉네임입니다!</span>
					</td>
				</tr>
	
				<tr>
					<td style="padding: 10px;">
						<label>비밀번호 : </label>
					</td>
					<td colspan="4">
						<input type="password" id="pass" name="pass" class="form-control" maxlength="16"
								placeholder="(8~16자의 영문 대,소문자, 숫자, 특수문자만 작성해주세요)">
					</td>
					<td colspan='3' style="text-align:left; padding-left:15px; padding-bottom:3px;">
						<i id="passCheck" class="fa fa-lock" aria-hidden="true" style="font-size:15px;"></i>
					</td>
				</tr>

				<tr>
					<td style="padding: 10px;">
						<label>비밀번호 확인 : </label>
					</td>
					<td colspan="4">
						<input type="password" id="pass2" name="pass2" class="form-control" maxlength="16">
					</td>
					<td colspan='3' style="text-align:left; padding-left:15px; padding-bottom:3px;">
						<i id="pass2Check" class="fa fa-lock" aria-hidden="true" style="font-size:15px;"></i>
					</td>
				</tr>

			</table>
			<br>
			<br>
			<hr>
			<table style="border-spacing: 20px; ">

				<tr>
					<th colspan="2"><label>위치기반 서비스 이용약관</label></th>

				</tr>

				<tr>
					<td colspan="2"><span> 제1장 총칙<br>
						<br> 제1조 (목적)<br> 이 약관은 <b>Lugar Fresco</b>(이하 “회사”)가 제공하는
							위치기반서비스(이하 ‘서비스’)에 관하여 회사와 이용계약을 체결한 고객이 서비스를 이용하는 데 필요한 회사와 고객의
							권리 및 의무, 기타 제반 사항을 정함을 목적으로 합니다.<br>
						<br> 제2조 (약관의 효력 및 변경)<br> ① 본 약관은 본 서비스를 이용하고자 하는 모든
							고객을 대상으로 합니다. ② 본 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 고객에게 공시하고, 이에
							동의한 고객이 본 서비스에 가입함으로써 효력이 발생합니다. ③ 회사는 필요하다고 인정되면 본 약관을 변경할 수
							있으며, 회사가 약관을 변경할 때에는 적용일자와 변경사유를 구체적으로 기재하여 제2항과 같은 방법으로 그 적용일자
							7일 전부터 공지합니다. 다만, 이용자에게 불리한 약관을 변경할 때에는 그 적용일자 30일 전부터 공지하며,
							이메일(E-mail)을 통해 이용자에게 개별 통지합니다. 단, 이용자가 연락처를 기재하지 않았거나, 변경 후 수정하지
							않아 개별 통지가 어려우면 본 항의 공지를 개별 통지한 것으로 간주합니다. ④ 회사가 제3항에 따라 변경 약관을
							공지하거나 통지할 때 약관 변경 적용일까지 거부 의사를 표시하지 않으면 약관의 변경에 동의한 것으로 간주한다는 내용을
							이용자에게 통지하였음에도 이용자가 구체적으로 약관 변경에 거부 의사를 표시하지 않으면 서비스제공자는 이용자가 변경
							약관에 동의한 것으로 간주합니다. 이용자는 변경된 약관 사항에 동의하지 않으면 서비스 이용을 중단하고 이용 계약을
							해지할 수 있습니다.
					</span><br>
					<br></td>
				</tr>

				<tr>
					<td padding-left="3px" width="3px">
						<input id="chk" type="checkbox" name="agree_service">
					</td>
					<td><span>위치기반 서비스 이용약관에 동의합니다.</span></td>
				</tr>
			</table>
			<hr>
			<table>

				<tr>
					<th colspan="2"><label>개인정보수집 및 이용</label></th>
				</tr>

				<tr>
					<td colspan="2"><span>제1장 총칙<br>
						<br> ⓐ개인정보란 생존하고 있는 개인에 관한 정보로서 당해 개인을 알아볼 수 있는 부호, 문자, 음성,
							음향 및 영상 등의 정보(당해 정보만으로는 특정 개인을 알아볼 수 없는 경우에도 다른 정보와 용이하게 결합하여 알아볼
							수 있는 것을 포함)를 말합니다. ⓑ회사는 가입자정보보호를 위해 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하
							“정보통신망법”이라 함) 및 개인정보보호법을 비롯한 모든 개인정보보호 관련 법률규정을 준수하고 있습니다. ⓒ회사는 본
							개인정보처리방침을 통하여 가입자에게 제공하는 개인정보가 어떤 용도와 방식으로 이용되고 있으며 개인정보를 효과적이고
							적극적으로 보호하기 위해 회사가 노력하는 사항을 알립니다. ⓓ회사는 본 개인정보처리방침을 서비스 가입 화면 및 서비스
							공지사항 내에 공개함으로써 가입자가 용이하게 볼 수 있도록 조치하고 있습니다. ⓔ본 서비스의 개인정보처리방침은 관련
							법률 및 관련 규정의 변경 또는 내부 운영 방침의 변경에 따라 변경될 수 있습니다. 개인정보처리방침이 변경될 경우
							변경된 사항을 홈페이지를 통하여 공지함으로써 개정된 내용을 가입자가 쉽게 알아볼 수 있도록 하고 있습니다.<br>
						<br></span></td>
				</tr>

				<tr>
					<td><input id="infoagree" type="checkbox" name="agree_member"></td>
					<td><span>개인정보수집 및 이용에 동의합니다.</span></td>
				</tr>

				<tr>
					<td><input id="mailagree" type="checkbox" name="agree_mail"></td>
					<td><span>메일 수신 동의(메일 수신에 동의하시면 회사가 제공하는 서비스의 업데이트 및
							이벤트 소식을 받을 수 있습니다.)</span></td>
				</tr>

			</table>
			<br>
			<br>
					<%-- 동의 체크 해야 가입완료가 넘어가게끔해줄것!! --%>
				<div class="box on" align="center">
					<button type="submit" class="btn btn-primary btn-lg">가입하기</button>
					&nbsp;
					<input type="reset" value="취소" class="btn btn-danger btn-lg">
				</div>
			</form>
		</div>


		<%-- 가입정보 체크  --%>
		<script>
		
			function joinValidate() {
				// 각각의 input 요소들 변수에 담아두기 
				var email = $("#joinForm input[name=email]");
				var nickName = $("#joinForm input[name=nickName]");
				var pass = $("#joinForm input[name=pass]");
				var pass2 = $("#joinForm input[name=pass2]");
				
				// 값 다 있나 검사
				if(email.val().trim() == ""){
					alert("이메일을 입력해주세요.");
					email.focus();
					return false;
				}else if(nickName.val().trim() == ""){
					alert("닉네임을 입력해주세요.");
					nickName.focus();
					return false;
				}else if(pass.val().trim() == ""){
					alert("비밀번호를 입력해주세요.");
					pass.focus();
					return false;
				}else if(pass2.val().trim() == ""){
					alert("비밀번호를 확인해주세요.");
					pass2.focus();
					return false;
				}
				
				// 아이디 형식 검사
				var regExp = /^[\w]{4,20}@[\w]+(\.[\w]+){1,2}$/;
				if(!regExp.test(email.val())){
					alert("이메일이 형식에 맞지 않습니다.")
					email.val("").focus();
					return false;
				}
				
				// 닉네임 검사
				regExp = /^[가-힣a-zA-Z0-9]{3,8}$/;
				
				if (!regExp.test(nickName.val())) {
					alert("닉네임이 형식에 맞지 않습니다.");
					nickName.val("").focus();
					return false;
				}

				// 비밀번호 검사
				regExp = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;
				if (!regExp.test(pass.val())) {
					alert("비밀번호를 형식에 맞게 입력해주세요.");
					pass.val("").focus();
					pass2.val("");
					return false;
				}

				
				if (pass.val() != pass2.val()) {
					alert("비밀번호가 일치하지 않습니다.");
					pass2.val("").focus();
					return false;
				}

			}
			
			
		</script>


		<%-- 회원가입 동의 체크 이벤트 --%>
		<script>
		    $(".box button").attr("disabled", true);

			$("#chk,#infoagree,#mailagree").on('click', function() {

				var chk = $('#chk').prop("checked");
				var infoagree = $('#infoagree').prop("checked");
				var mailagree = $('#mailagree').prop("checked");

				if (chk && infoagree && mailagree) {
					$(".box button").removeAttr("disabled");
				} else {
				 	$(".box button").attr("disabled", true); 
				}
			});
		</script>
		
		<script>
			$("#email").on("input", function(){
				var email = $("#email").val();
				
				var regExp = /^[\w]{4,20}@[\w]+(\.[\w]+){1,2}$/;
				
				if(regExp.test(email)){
					
					$.ajax({
						url:"joinCheckEmail.me",
						data:{email:email},
						type:"post",
						success:function(result){
							if(result == "1"){
								$("#emailCheck1").css("display", "block");
								$("#emailCheck2").css("display", "none");
								$("#emailCheck3").css("display", "none");
								$("#emailCheck1").css({"color":"#1DDB16", "font-weight":"bold"});
								
								$(".box button").removeAttr("disabled", true);
							}else{
								$("#emailCheck2").css("display", "block");
								$("#emailCheck1").css("display", "none");
								$("#emailCheck3").css("display", "none");
								$("#emailCheck2").css({"color":"red", "font-weight":"bold"});
								
								$(".box button").attr("disabled", true);
							}
							
							if(email == ""){
								$("#emailCheck1").css("display", "none");
								$("#emailCheck2").css("display", "none");
								$("#emailCheck3").css("display", "none");
							}
							
						},
						error:function(result){
							alert("실패!");
						}
						
					});
				}else{
					$("#emailCheck1").css("display", "none");
					$("#emailCheck2").css("display", "none");
					$("#emailCheck3").css("display", "block");
					$("#emailCheck3").css({"color":"red", "font-weight":"bold"});
					
					if(email == ""){
						$("#emailCheck1").css("display", "none");
						$("#emailCheck2").css("display", "none");
						$("#emailCheck3").css("display", "none");
					}
				}
				
			});
			
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
								$("#nickNameCheck3").css("display", "none");
								$("#nickNameCheck1").css({"color":"#1DDB16", "font-weight":"bold"});
								
								$(".box button").removeAttr("disabled", true);
							}else{
								$("#nickNameCheck3").css("display", "none");
								$("#nickNameCheck2").css("display", "block");
								$("#nickNameCheck1").css("display", "none");
								$("#nickNameCheck2").css({"color":"red", "font-weight":"bold"});
								
								$(".box button").attr("disabled", true);
							}
							
							if(nickName == ""){
								$("#nickNameCheck1").css("display", "none");
								$("#nickNameCheck2").css("display", "none");
								$("#nickNameCheck3").css("display", "none");
							}
						},
						error:function(result){
							alert("실패!");
						}
						
					});
				}else{
					$("#nickNameCheck1").css("display", "none");
					$("#nickNameCheck2").css("display", "none");
					$("#nickNameCheck3").css("display", "block");
					$("#nickNameCheck3").css({"color":"red", "font-weight":"bold"});
					
					if(nickName == ""){
						$("#nickNameCheck1").css("display", "none");
						$("#nickNameCheck2").css("display", "none");
						$("#nickNameCheck3").css("display", "none");
					}
				}
				
			});
			
			$("#pass, #pass2").on("input", function(){
				var pass = $("#pass").val();
				var pass2 = $("#pass2").val();
				
				var regExp = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;
				
				if (regExp.test(pass)) {
					$.ajax({
						url:"joinCheckPass.me",
						data:{pass:pass, pass2:pass2},
						success:function(result){
							if(result == "1"){
								$("#passCheck").css("color", "#1DDB16");
								$("#pass2Check").css("color", "#1DDB16");
							}else{
								$("#passCheck").css("color", "gray");
								$("#pass2Check").css("color", "gray");
							}
							
							if(pass == "" && pass2 == ""){
								$("#passCheck").css("color", "gray");
								$("#pass2Check").css("color", "gray");
							}
						},
						error:function(result){
							alert("실패!");
						}
					});
				}else{
					$("#passCheck").css("color", "gray");
					$("#pass2Check").css("color", "gray");
				}
				
			});
		</script>

	<br>
	<br>
	<br>
	<%@include file="../includes/main/footer.jsp"%>

</body>
</html>