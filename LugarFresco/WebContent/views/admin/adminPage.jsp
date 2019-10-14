<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	int memberCount = (int)request.getAttribute("memberCount");
	int cafeCount = (int)request.getAttribute("cafeCount");
	int powerCount = (int)request.getAttribute("powerCount");
	int declareCount = (int)request.getAttribute("declareCount");
	int cafeApplyCount = (int)request.getAttribute("cafeApplyCount");
	int qnaCount = (int)request.getAttribute("qnaCount");


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
		<li><a class="app-menu__item" href="<%=request.getContextPath() %>/memberList.ap">
			<i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">
        		회원 정보 리스트</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/cafeList.ap">
        	<i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">
        		카페 리스트</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/declareList.ap">
          	<i class="app-menu__icon fa fa-heart-o"></i><span class="app-menu__label">
        		신고 리스트</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/powerList.ap">
        		<i class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">
        		파워링크 신청 리스트</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/cafeApplyList.ap">
        	<i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">
        		카페 신청 리스트</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/qnaList.ap">
        	<i class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">
        		Q&A 리스트</span></a>
        </li>
      </ul>
    </aside>
    
    
   
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-user"></i> 관리자 페이지</h1>
          <p>CafeGano</p>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 col-lg-2">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-users fa-3x"></i>
            <div class="info">
              <h4>회원 등록 수</h4>
              <p><b><%= memberCount %></b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-2">
          <div class="widget-small info coloured-icon"><i class="icon fa fa-thumbs-o-up fa-3x"></i>
            <div class="info">
              <h4>카페 등록 수</h4>
              <p><b><%=cafeCount %></b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-2">
          <div class="widget-small warning coloured-icon"><i class="icon fa fa-files-o fa-3x"></i>
            <div class="info">
              <h4>신고 등록 수</h4>
              <p><b><%= declareCount %></b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-2">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-star fa-3x"></i>
            <div class="info">
              <h4>파워 신청 수</h4>
              <p><b><%= powerCount %></b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-2">
          <div class="widget-small info coloured-icon"><i class="icon fa fa-star fa-3x"></i>
            <div class="info">
              <h4>카페 신청 수</h4>
              <p><b><%= cafeApplyCount %></b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-2">
          <div class="widget-small warning coloured-icon"><i class="icon fa fa-star fa-3x"></i>
            <div class="info">
              <h4>QnA 등록수</h4>
              <p><b><%= qnaCount %></b></p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">관리자 현황 (그래프)</h3>
            <div class="embed-responsive embed-responsive-16by9">
              <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">관리자 현황 (표)</h3>
            <div class="embed-responsive embed-responsive-16by9">
              <canvas class="embed-responsive-item" id="pieChartDemo"></canvas>
            </div>
          </div>
        </div>
      </div>
    </main>
    
    <script type="text/javascript">
      var data = {
      	labels: ["회원 수", "카페 수", "파워 등록 수", "신고 등록 수", "카페 신청 수","문의 등록 수"],
      	datasets: [
      		{
      			label: "My First dataset",
      			fillColor: "rgba(220,220,220,0.2)",
      			strokeColor: "rgba(220,220,220,1)",
      			pointColor: "rgba(220,220,220,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(220,220,220,1)",
      			data: [<%=memberCount%>, <%=cafeCount%>, <%=powerCount%>, <%=declareCount%>, <%=cafeApplyCount%>,<%=qnaCount%>]
      		}
      	]
      };
      var pdata = [
      	{
      		value: <%=memberCount%>,
      		color: "#009785",
      		highlight: "#009785",
      		label: "회원 등록 수"
      	},
      	{
      		value: <%=cafeCount%>,
      		color:"#17a2b8",
      		highlight: "#17a2b8",
      		label: "카페 등록 수"
      	},
      	{
      		value: <%=declareCount%>,
      		color:"#ffc107",
      		highlight: "#ffc107",
      		label: "신고 등록 수"
      	},
      	{
      		value: <%=powerCount%>,
      		color:"#009785",
      		highlight: "#009785",
      		label: "파워 등록 수"
      	},
      	{
      		value: <%=cafeApplyCount%>,
      		color:"#17a2b8	",
      		highlight: "#17a2b8",
      		label: "카페 신청 수"
      	},
      	{
      		value: <%=qnaCount%>,
      		color:"#ffc107",
      		highlight: "#ffc107",
      		label: "문의 등록 수"
      	}
      ]
      
      var ctxl = $("#lineChartDemo").get(0).getContext("2d");
      var lineChart = new Chart(ctxl).Line(data);
      
      var ctxp = $("#pieChartDemo").get(0).getContext("2d");
      var pieChart = new Chart(ctxp).Pie(pdata);
    </script>
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
  </body>
</html>