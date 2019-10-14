<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cno = (int)request.getAttribute("cno");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
		    <div>
	    		<button class="btn btn-primary" type="button" onclick="pay11();">신청</button>
	    	</div>
		  </div>
		</div>
		
   	
	<script>
	<!--
		$("#check_module").click(function() {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp65951474');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				/*
				 'kakao':카카오페이,
				 html5_inicis':이니시스(웹표준결제)
				 'nice':나이스페이
				 'jtnet':제이티넷
				 'uplus':LG유플러스
				 'danal':다날
				 'payco':페이코
				 'syrup':시럽페이
				 'paypal':페이팔
				 */

				pay_method : 'card',
				/*
				 'samsung':삼성페이,
				 'card':신용카드,
				 'trans':실시간계좌이체,
				 'vbank':가상계좌,
				 'phone':휴대폰소액결제
				 */
				merchant_uid : 'merchant_' + new Date().getTime(),
				/*
				 merchant_uid에 경우
				 https://docs.iamport.kr/implementation/payment
				 위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				 참고하세요.
				 나중에 포스팅 해볼게요.
				 */
				name : '주문명:결제테스트',
				//결제창에서 보여질 이름
				amount : 1000,
				//가격
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자이름',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			/*
			 모바일 결제시,
			 결제가 끝나고 랜딩되는 URL을 지정
			 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			 */
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
	-->
	function pay11(){
		var IMP = window.IMP; // 생략가능
		   IMP.init('iamport');  // 가맹점 식별 코드
	
		   IMP.request_pay({
		      pg : 'kakao', // 결제방식
		       pay_method : 'card',	// 결제 수단
		       merchant_uid : 'merchant_' + new Date().getTime(),
		      name : '주문명: 결제 테스트',	// order 테이블에 들어갈 주문명 혹은 주문 번호
		       amount : '100',	// 결제 금액
		       buyer_email : '',	// 구매자 email
		      buyer_name :  '',	// 구매자 이름
		       buyer_tel :  '',	// 구매자 전화번호
		       buyer_addr :  '',	// 구매자 주소
		       buyer_postcode :  '',	// 구매자 우편번호
		       m_redirect_url : ''	// 결제 완료 후 보낼 컨트롤러의 메소드명
		   }, function(rsp) {
			if ( rsp.success ) { // 성공시
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				
				var price = rsp.paid_amount;
				
				location.href="<%=conPath%>/powerIn.op?cno=<%=cno%>&price=" + price;
			} else { // 실패시
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				
			}
		});
		
	}
	   
	</script>
   		
   	</main>
   	
   	
</body>
</html>