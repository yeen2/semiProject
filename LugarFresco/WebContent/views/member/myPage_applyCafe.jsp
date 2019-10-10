<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>

<style>
	.app-content div{padding:15px; font-weight:bold; color:#666;}
	.app-content label{padding-top:9px;}
	/* #cafeImg, #cafeReg{display:block; width:80px; height:80px; border:1px solid black;} */
	/* #cafeName{width:353px;} */
	
	#app-content body, h1{
		text-align: center !important;
		margin-left : 150;
	}
	label{font-size:20px; color:black;}
	.form-control {
		/* width: 50%  !important; */
		text-align: center !important;
		content: center !important;
	}
	#uploadFile{width:100%;}
	#uploadFile img{width:100%; height:100%;}
	#uploadFile span{margin-right:10px;}
	#titleImgArea{display:block; width:30%; height:150px; margin-bottom:20px;}
	#contentImgArea1, #contentImgArea2, #contentImgArea3, #contentImgArea4, #contentImgArea5
	{width:22%; height:110px; display:inline-block;}
	#contentImgArea5{display:block;}
	#contentImgArea1:hover, #contentImgArea2:hover, #contentImgArea3:hover, #contentImgArea4:hover,
	#contentImgArea5:hover, #titleImgArea:hover{cursor:pointer;}
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
   	
   	<div class=app-title style="text-align:center;">
   		<h1 style="text-align:center;"><i class="app-menu__icon fa fa-file-text-o"></i> 카페 등록 신청</h1>
   	</div>
   	
   	<div class="col-md-6" style="margin-left:200px !important;" align="center">
          <div class="tile">
            <div class="tile-body">
              <form action="<%= conPath %>/insertCafe.mp" method="post" enctype="multipart/form-data" onsubmit="return validate();">
	               <div class="form-group">
	                 <label class="control-label" for="cafeName" id="nameL">카페 이름</label>
	                 <input class="form-control" type="text" placeholder="카페이름을 적어주세요" id="cafeName" name="cafeName">
	               </div>
	               
	               <div id="uploadFile" class="form-group">
	                 <label class="control-label" for="cafeImg">카페 이미지</label>
	                 <span id="titleImgArea"><img id="titleImg" src=""></span>
	                 <span id="contentImgArea1"><img id="contentImg1" src=""></span>
	                 <span id="contentImgArea2"><img id="contentImg2" src=""></span>
	                 <span id="contentImgArea3"><img id="contentImg3" src=""></span>
	                 <span id="contentImgArea4"><img id="contentImg4" src=""></span>
	                 
	               </div>
	               
	               <div class="form-group">
	                  <label class="control-label" id="aaa">카페 주소</label>
	                  <input type="button" class="btn btn-primary " style="display:block;"onclick="sample6_execDaumPostcode();" value="주소 찾기">
	                  <input type="text" class="form-control" id="sample6_postcode" name="content1" placeholder="우편번호" readonly>
					  <input type="text" class="form-control" id="sample6_address" name="content2" placeholder="주소" readonly>
					  <input type="text" class="form-control" id="sample6_detailAddress" name="content3" placeholder="상세주소">
					  <input type="text" class="form-control" id="sample6_extraAddress" name="content4" placeholder="참고항목" readonly>
	               </div>
	          
	               
	               <div class="form-group">
	                 <label class="control-label" for="cafeTel">전화번호</label>
	                 <input type="tel" class="form-control" id="cafeTel" name="cafeTel">
	               </div>
	               
	               <div class="form-group">
	                 <label class="control-label" for="cafeReg">사업자등록증</label>
	                 <span id="contentImgArea5"><img id="cafeReg" width="100%" height="100%" src=""></span>
	               </div>
	               
	                <div class="form-group">
	                  <label class="control-label">카페 정보</label>
	                  <textarea class="form-control" id="cafeInfo" name="cafeInfo" rows="4" placeholder="카페의 상세정보를 입력해주세요"></textarea>
	                </div>
	              
	            
	            
	                <div class="form-group">
	                  <div class="form-check">
	                    <p>
	                      <input class="form-check-input" id="check1" type="checkbox">등록 신청 하시면 취소 할 수 없습니다. <br>한번 더 확인하고 체크해주세요.
	                    </p>
	                  </div>
	                </div>
	             
		            <div class="tile-footer">
		              <button class="btn btn-primary" type="submit" id="applyBtn">
		              	<i class="fa fa-fw fa-lg fa-check-circle"></i>
		              		등록하기
		              </button>
		            </div>
		            
	              	 <div id="fileArea">
	                  <input class="form-control" type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this, 1);">
	                  <input class="form-control" type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this, 2);">
	                  <input class="form-control" type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="loadImg(this, 3);">
	                  <input class="form-control" type="file" id="thumbnailImg4" name="thumbnailImg4" onchange="loadImg(this, 4);">
	                  <input class="form-control" type="file" id="thumbnailImg5" name="thumbnailImg5" onchange="loadImg(this, 5);">
	                  <input class="form-control" type="file" id="thumbnailImg6" name="thumbnailImg6" onchange="loadImg(this, 6);">
	                 </div>
	                 
	            </form>
            </div>
          </div>
        </div>
        
   	</main>
    
    <script type="text/javascript">
 		CKEDITOR.replace('cafeInfo'
  					    , {height: 500                                                  
               		  });
	</script>


    <%-- 카페 주소 API --%>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
	
	<%-- 파일 첨부 관련 스크립트 --%>
	<script>
		// 각 div 클릭할 때 파일 첨부 창이 뜨도록
		$(function(){
			$("#fileArea").hide();
			
			// 순서에 맞춰서 처리
			$("#titleImgArea").click(function(){
				$("#thumbnailImg1").click();
			});
			$("#contentImgArea1").click(function(){
				$("#thumbnailImg2").click();
			});
			$("#contentImgArea2").click(function(){
				$("#thumbnailImg3").click();
			});
			$("#contentImgArea3").click(function(){
				$("#thumbnailImg4").click();
			});
			$("#contentImgArea4").click(function(){
				$("#thumbnailImg5").click();
			});
			$("#contentImgArea5").click(function(){
				$("#thumbnailImg6").click();
			});
		});
		
		// 파일 첨부했을 때 미리보기 공간에 미리보기가 가능하게 하는 함수
		function loadImg(value, num){
			// 파일의 존재 여부
			if(value.files && value.files[0]){
				// 1. 파일을 읽어들일 FileReader 객체 생성
				var reader = new FileReader();
				
				// 2. 파일 읽기가 다 완료되었을 때 실행되는 메소드
				reader.onload = function(e){
					
					switch(num){
					case 1: $("#titleImg").attr("src", e.target.result); // data:URL 
							break;
					case 2: $("#contentImg1").attr("src", e.target.result);
							break;
					case 3: $("#contentImg2").attr("src", e.target.result);
							break;
					case 4: $("#contentImg3").attr("src", e.target.result);
							break;
					case 5: $("#contentImg4").attr("src", e.target.result);
							break;
					case 6: $("#cafeReg").attr("src", e.target.result);
							break;
					}
					
				}
				
				// 파일 읽기 메소드
				reader.readAsDataURL(value.files[0]);
				
			}
			
		}
	</script>
	
	<%-- 카페 등록 유효성 검사 --%>
	<script>
		function validate(){
			
			if($("#cafeName").val().trim() == ""){
				alert("카페명을 입력해주세요.");
				$("#cafeName").val("").focus();
				return false;
			}
			
			if($("#thumbnailImg1").val().trim() == "" || $("#thumbnailImg2").val().trim() == "" || $("#thumbnailImg3").val().trim() == ""
					|| $("#thumbnailImg4").val().trim() == "" || $("#thumbnailImg5").val().trim() == ""){
				alert("카페 이미지를 모두 올려주세요.");
				location.href="#nameL";
				return false;
			}
			
			if($("input[name=content1]").val().trim() == "" || $("input[name=content2]").val().trim() == ""){
				alert("주소 찾기를 이용하여 카페 주소를 입력해주세요.");
				location.href="#contentImgArea4";
				return false;
			}
			
			if($("#cafeTel").val().trim() == ""){
				alert("카페 전화번호를 입력해주세요.");
				location.href="#aaa";
				$("#cafeTel").val("").focus();
				return false;
			}
			
			if($("#thumbnailImg6").val().trim() == ""){
				alert("사업자등록증 이미지를 올려주세요.");
				location.href="#sample6_detailAddress";
				return false;
			}
			
			if($("#cafeInfo").val().trim() == ""){
				alert("카페 정보를 입력해주세요.");
				location.href="#cafeInfo";
				$("#cafeInfo").val("").focus();
				return false;
			}
			
			var check1 = $("#check1").prop("checked");
			
			if(!check1){
				alert("카페 등록 신청에 동의해주세요.");
				return false;
			}
			
		}
	</script>

</body>
</html>