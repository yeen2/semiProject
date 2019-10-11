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
    
    
   
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-file-o"></i> 카페 사장님 페이지에 오신 것을 환영합니다.</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 col-lg-3">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-coffee fa-3x"></i>
            <div class="info">
              <h4>내 카페</h4>
              <p><b><%= arr[0] %></b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="widget-small danger coloured-icon"><i class="icon fa fa-pencil fa-3x"></i>
            <div class="info">
              <h4>내 카페 리뷰</h4>
              <p><b><%= arr[1] %></b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="widget-small warning coloured-icon"><i class="icon fa fa-files-o fa-3x"></i>
            <div class="info">
              <h4>내 파워링크 신청</h4>
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
      	labels: ["내 카페", "내 카페 리뷰", "내 파워링크 신청"],
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
      		label: "내 카페"
      	},
      	{
      		value: <%= arr[1] %>,
      		color:"#F7464A",
      		highlight: "#FF6C6C",
      		label: "내 카페 리뷰"
      	},
      	{
      		value: <%= arr[2] %>,
      		color:"#ffc107",
      		highlight: "#FFDF24",
      		label: "내 파워링크 신청"
      		
      	}
      ]
      
      var ctxl = $("#lineChartDemo").get(0).getContext("2d");
      var lineChart = new Chart(ctxl).Line(data);
      
      var ctxp = $("#pieChartDemo").get(0).getContext("2d");
      var pieChart = new Chart(ctxp).Pie(pdata);
    </script>
  </body>
</html>