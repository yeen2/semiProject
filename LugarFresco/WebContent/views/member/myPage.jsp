<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int[] arr = (int[])request.getAttribute("arr");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
 <body class="app sidebar-mini rtl">
   
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
    
    
   
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-file-o"></i> 마이페이지에 오신 것을 환영합니다.</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 col-lg-3">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-pencil fa-3x"></i>
            <div class="info">
              <h4>리뷰</h4>
              <p><b><%= arr[0] %></b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="widget-small danger coloured-icon"><i class="icon fa fa-heart fa-3x"></i>
            <div class="info">
              <h4>내가 좋아요한 리뷰</h4>
              <p><b><%= arr[1] %></b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="widget-small warning coloured-icon"><i class="icon fa fa-star fa-3x"></i>
            <div class="info">
              <h4>즐겨찾기</h4>
              <p><b><%= arr[2] %></b></p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="tile">
            <div class="embed-responsive embed-responsive-16by9">
              <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="tile">
            <div class="embed-responsive embed-responsive-16by9">
              <canvas class="embed-responsive-item" id="pieChartDemo"></canvas>
            </div>
          </div>
        </div>
      </div>
      
    </main>
   
    <script type="text/javascript">
      var data = {
      	labels: ["내 리뷰", "내 좋아요한 리뷰", "내 즐겨찾기"],
      	datasets: [
      		{
      			label: "My Second dataset",
      			fillColor: "rgba(151,187,205,0.2)",
      			strokeColor: "rgba(151,187,205,1)",
      			pointColor: "rgba(151,187,205,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(151,187,205,1)",
      			data: [<%= arr[0] %>, <%= arr[1] %>, <%= arr[2] %>]
      		}
      	]
      };
      var pdata = [
      	{
      		value: <%= arr[0] %>,
      		color: "#46BFBD",
      		highlight: "#5AD3D1",
      		label: "내 리뷰"
      	},
      	{
      		value: <%= arr[1] %>,
      		color:"#F7464A",
      		highlight: "#FF6C6C",
      		label: "내 좋아요한 리뷰"
      	},
      	{
      		value: <%= arr[2] %>,
      		color:"#ffc107",
      		highlight: "#FFDF24",
      		label: "내 즐겨찾기"
      		
      	}
      ]
      
      var ctxl = $("#lineChartDemo").get(0).getContext("2d");
      var lineChart = new Chart(ctxl).Line(data);
      
      var ctxp = $("#pieChartDemo").get(0).getContext("2d");
      var pieChart = new Chart(ctxp).Pie(pdata);
    </script>
  </body>
</html>