<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cafe.model.vo.Cafe, java.util.ArrayList" %>
<%
	ArrayList<Cafe> list = (ArrayList<Cafe>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	#div123{padding:15px; font-weight:bold; color:#666;}
	#cafeClick:hover{cursor:pointer; background:#dee2e6;}
	#noData{width:100%; height:100px; text-align:center; font-size:1.250em; font-weight:bold; margin-top:100px;}
	.app-content div{padding:15px; font-weight:bold; color:#666;}
</style>
</head>
<body>
	 <%@include file="../includes/header.jsp" %>
   
   <!-- 각 li 누를때마다 active 바뀌게 js 코드 짜기 -->
      <ul class="app-menu">
		<li><a class="app-menu__item" href="<%=request.getContextPath() %>/myCafeList.op">
			<i class="app-menu__icon fa fa-coffee"></i><span class="app-menu__label">
        		내 카페 리스트</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/myCafeReview.op">
        	<i class="app-menu__icon fa fa-pencil"></i><span class="app-menu__label">
        		내 카페 리뷰 전체보기</span></a>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath() %>/myPowerList.op">
          	<i class="app-menu__icon fa fa-file-text-o"></i><span class="app-menu__label">
        		파워링크 신청 리스트</span></a>
        </li>
      </ul>
    </aside>
    
    
    <!-- ----------------------------------코드시작 <main> 안에서 작성해야합니다~ --------------------------------------- -->
    
   	<main class="app-content">
 	 <h1 style="text-align:center;">My Cafe List</h1>
 	 
	  <div class="row user">
        <div class="col-md-9" style="margin-left:auto; margin-right:auto;">
          <div class="tab-content">
            <div class="tab-pane active" id="my-review">
            <%-- 반복 --%>
            <% if(list.isEmpty()){ %>
              <div id="noData">
						<div>
							<i class="fa fa-coffee" aria-hidden="true" style="font-size:50px; line-height:80px; color:#c2c2c2; margin-bottom:-20%;"></i>
						</div>
						<div>
							<p style="color:#c2c2c2;">내 카페가 없습니다!<br>카페 등록을 신청해주세요!</p>
						</div>
					</div>
            <% }else{ %>
              <% for(Cafe oc : list){ %>
              <div align="right" style="margin-bottom:-3%;">
              	<div style="display:inline-block; margin-left:20px;">
					<form action="<%=conPath %>/powerApplyForm.op" method="post">
						<input type="hidden" name="cno" value="<%=oc.getC_no()%>">
						<button type="submit" id="powerApply" class="btn btn-info" style="display:inline-block;">파워등록 신청</button>
					</form>
				</div>
				<div style="display:inline-block;">
					<form action="<%=conPath %>/deleteMyCafe.op" method="post">
						<input type="hidden" name="cno" value="<%=oc.getC_no()%>">
						<button type="submit" id="deleteCafe" class="btn btn-secondary" style="display:inline-block;">삭제</button>
					</form>
				</div>
			  </div>
			  
              <div id="cafeClick" class="timeline-post" onclick="location.href='<%=conPath%>/cafeInfo.ca?c_no=<%=oc.getC_no()%>';">
                <div class="post-media"><img src="<%=conPath %>/resources/fileupload/cafe/<%=oc.getImg_name() %>" style="width:100px; height:100px;">
                  <div class="content">
                  	<h4><%=oc.getCafe_name() %>&nbsp;&nbsp;<label style="color:#ffc107;"><%=oc.getSum_avg() %></label>&nbsp;&nbsp;</h4>
                    <h5><%=oc.getAddress() %>&nbsp;<%=oc.getAddress_detail() %></h5>
                    <p class="text-muted"><small><%=oc.getReg_date() %></small></p>
                  </div>
                </div>
                <div class="post-content">
                  <p><%=oc.getContent() %></p>
                </div>
                <ul class="post-utility">
                  <li class="shares"><i style="color:gray;" class="fa fa-fw fa-lg fa-eye"></i>조회 <%=oc.getCount() %></li>
                  <li class="shares"><i style="color:gray;" class="fa fa-fw fa-lg fa-pencil"></i>리뷰 <%=oc.getReview_count() %></li>
                  <li class="shares"><i style="color:gray;" class="fa fa-fw fa-lg fa-star"></i>즐겨찾기 <%=oc.getFavorite() %></li>
                </ul>
              </div>
              
              <% } %>
            <% } %>
            
            </div>
          </div>
        </div>
      </div>
   		
   	</main>
   	
   	
</body>
</html>