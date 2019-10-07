<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/main.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	.app-content td{padding:15px; font-weight:bold; color:#666;}
	.app-content label{padding-top:9px;}
	#profileImg{display:block; width:27%; border:1px solid black;}
	#app input{width:353px;}
	#app{margin-left:2%;}
</style>
<script>
	var msg = "<%= message %>";
	
	$(function(){
		if(msg != "null"){ // 메세지가 담겨있을 경우
			alert(msg);
		}
		
		if(msg == "성공적으로 비밀번호가 변경되었습니다."){
			close();
		}
	});
</script>
</head>
<body>
    
    <!-- ----------------------------------코드시작 <main> 안에서 작성해야합니다~ --------------------------------------- -->
    
   	<main class="app-content">
   		
   		<div align="center">
	
			<h1 style="font-size:30px; color:#666;">비밀번호 변경</h1>
			<br>
			<hr>
			<form id="updatePwd" action="<%= request.getContextPath() %>/updatePwd.mp" method="post">
				<table id="app">
		            <tr>
		            	<td><label>현재 비밀번호</label>
		            	<input type="password" name="userPwd" id="userPwd" class="form-control"></td>
		                <td></td>
		            </tr>
		            <tr>
		            	<td><label>새 비밀번호</label>
		            	<input type="password" name="newPwd1" id="newPwd1" class="form-control"></td>
		                <td></td>
		            </tr>
		            <tr>
		            	<td><label>새 비밀번호 확인</label>
		            	<input type="password" name="newPwd2" id="newPwd2" class="form-control"></td>
		                <td></td>
		            </tr>
		            
		        </table>
		    </form>
		    <hr>
			
			<button type="submit" name="updatePwdBtn" class="btn btn-primary" onclick="checkPwd();">변경하기</button>
        	<button type="button" name="cancelBtn" class="btn btn-secondary" onclick="cancel();">취소</button>
	        
		</div>
   		
   		<script>
			function checkPwd(){
			
				var userPwd = $("#userPwd");
				var newPwd1 = $("#newPwd1");
				var newPwd2 = $("#newPwd2");
				
				if(userPwd.val().trim() == "" || newPwd1.val().trim() == "" || newPwd2.val().trim() == ""){
					alert("값이 누락되었습니다.");
					return;
				}
				
				if(newPwd1.val() != newPwd2.val()){
					alert("비밀번호가 다릅니다.");
					newPwd2.val("").focus();
					return;
				}
				
				$("#updatePwd").submit();
			}
			
			function cancel(){
				close();
			}
   		</script>
   	</main>
   	
   	
</body>
</html>