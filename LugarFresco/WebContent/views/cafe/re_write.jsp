<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.placeholder.js"></script>
<style type="text/css">
	section{
		width: 773px;
    	margin: 145px auto 0;
	}
	.content{
    	border: 1px solid #DBDBDB;
    	border-radius: 3px;
    	resize: none;
	}
	.content:placeholder-shown{
		color: #CBCBCB;
	}
	.content:focus {
  		outline: none;
	}
	.img{
	    float: left; 
	    margin: 5px;
		border-color: #CBCBCB;
	}
	#divImg1:hover, #divImg2:hover, #divImg3:hover,  
	#divImg4:hover, #divImg5:hover{
		cursor:pointer;
	}

</style>
<script type="text/javascript">
	$(function () {

	    $('.content').focus();
		$('.content').placeholder();
	});
</script>
</head>
<body>

	<%@include file="../includes/main/header.jsp" %>
	
	<form action="write.re" method="post" enctype="multipart/form-data">
	<section class="insurence-one-area section-gap" style="margin-top:30px;">

			<div class="container">

				<div class="row align-items-center">

					<!-- form-row : 하나의 행을 여러 열로 나눌때 사용한다. -->
					<div class="form-group col-6">
						<h1>
							<span style="color: orange;"> &nbsp; <%=request.getAttribute("name") %>
							</span>
						</h1>
						<h5>
							<span>&nbsp; &nbsp; 에 대한 솔직한 리뷰를 써주세요.</span>
						</h5>
					</div>


					<!-- 평점 -->
					<div class="form-group col-2" align="center" style="padding: 3px;">
						<label>맛</label> 
						<select name="flavor" id="flavor" class="form-control">
							<option value="0">----</option>
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
						</select>
					</div>

					<div class="form-group col-2" align="center" style="padding: 3px;">
						<label>서비스</label> 
						<select name="service" id="service" class="form-control">
							<option value="0">----</option>
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
						</select>
					</div>

					<div class="form-group col-2" align="center" style="padding: 3px;">
						<label>가격</label> 
						<select name="price" id="price" class="form-control">
							<option value="0">----</option>
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
						</select>
					</div>

				</div>
				<br>
				<br>
				<div class="row align-items-center">

					<div class="form-group col-2" align="center">

						<div class="thumb" >
							<div style="border-radius:50%; width: 80px; height: 80px;">
							<img class="img-fluid" style="width: 100%; height: 100%; border-radius:50%;"
								src="<%=conPath%>/resources/fileupload/profile/<%=m.getProfile()%>" alt="">
							</div>
							<h5 style="text-align: center; margin-top: 5px;"><%=m.getNickName()%></h5>
						</div>
					</div>

					<div class="form-group col-10" align="center">
						<textarea class="content" rows="5" cols="83" id="content" name="content"
							placeholder="<%=m.getNickName()%> 님, 주문하신 메뉴는 어떠셨나요? 카페 분위기와 서비스도 궁금해요!"></textarea>
					</div>
				</div>

				<div class="row align-items-center">
					<div class="form-group col-2" align="center"
						style="text-align: center; margin: auto;"></div>

					<!-- 이미지 추가  -->
					<div class="form-group col-10" align="center" style="">

						<div class="img" id="divImg1">
							<img id="img1" height="89" width="89">
						</div>
						<div class="img" id="divImg2">
							<img id="img2" height="89" width="89">
						</div>
						<div class="img" id="divImg3">
							<img id="img3" height="89" width="89">
						</div>
						<div class="img" id="divImg4">
							<img id="img4" height="89" width="89">
						</div>
						<div class="img" id="divImg5">
							<img id="img5" height="89" width="89">
						</div>

					</div>

				</div>
				<br>
				<div class="row align-items-center">
					<div class="form-group col-12" align="center">
						<button type="reset" class="genric-btn default circle" onclick="history.back(-1);"
							style="width: 130px;">취소</button>
						&nbsp;&nbsp;&nbsp;
						<button type="submit" class="genric-btn primary circle" id="submit"
							style="width: 130px;">등록</button>
					</div>
				</div>

			</div>
			<!-- 파일 업로드 하는 부분 -->
			<div id="fileArea">
				<input type="file" id="fileImg1" name="fileImg1" onchange="loadImg(this, 1);"> 
				<input type="file" id="fileImg2" name="fileImg2" onchange="loadImg(this, 2);"> 
				<input type="file" id="fileImg3" name="fileImg3" onchange="loadImg(this, 3);"> 
				<input type="file" id="fileImg4" name="fileImg4" onchange="loadImg(this, 4);">
				<input type="file" id="fileImg5" name="fileImg5" onchange="loadImg(this, 5);">
			</div>

		</section>
		<input type="hidden" name="c_no" value="<%=request.getAttribute("c_no")%>">
	</form>
	
	
	<%@include file="../includes/main/footer.jsp" %>

	<script>
		// 각 div 클릭할 때 파일 첨부 창이 뜨도록
		$(function() {
			$("#fileArea").hide();

			$("#divImg1").click(function() {
				$("#fileImg1").click();
			});
			$("#divImg2").click(function() {
				$("#fileImg2").click();
			});
			$("#divImg3").click(function() {
				$("#fileImg3").click();
			});
			$("#divImg4").click(function() {
				$("#fileImg4").click();
			});
			$("#divImg5").click(function() {
				$("#fileImg5").click();
			});
			
		});

		function loadImg(value, num) {

			if (value.files && value.files[0]) {

				// 1. 파일을 읽어들일 FileReader 객체 생성
				var reader = new FileReader();

				// 2. 파일 읽기가 다 완료되었을 때 실행되는 메소드
				reader.onload = function(e) {
					switch (num) {
					case 1:
						$("#img1").attr("src", e.target.result); // data:URL
						break;
					case 2:
						$("#img2").attr("src", e.target.result);
						break;
					case 3:
						$("#img3").attr("src", e.target.result);
						break;
					case 4:
						$("#img4").attr("src", e.target.result);
						break;
					case 5:
						$("#img5").attr("src", e.target.result);
						break;
					}
				}
				// 파일 읽기 메소드
				reader.readAsDataURL(value.files[0]);
			}
		}
		
		// 등록 버튼 활성화
		
		$("#submit").click(function() {
			
			var flavor = $("#flavor").val();
			var service = $("#service").val();
			var price = $("#price").val();
			var content = $("#content").val();
			
			if(flavor==0 || service==0 || price==0){
				alert("평점을 선택해주세요~");
				return false;
			}
			
			if(content.length == 0){
				alert("리뷰내용을 작성해주세요");
				return false;
			}
			
		});
		
		
		
		
		
		
	</script>
</body>
</html>