<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cafe.model.vo.*,com.kh.admin.model.vo.*"%>

<%
	ArrayList<Cafe> list = (ArrayList<Cafe>) request.getAttribute("list");
		
	//ArrayList<Cafe> list2 = (ArrayList<Cafe>) request.getAttribute("list2");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	String hidden = (String)request.getAttribute("buttonhidden"); // 찾을땐 페이징 빼려고 넣음
	
	String msg = (String)request.getAttribute("msg");
	
	System.out.println(msg);

	System.out.println("dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
	
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
     
<!DOCTYPE html>
<html>
<head>
<style>
	.announce{
		cursor: pointer;
	}	

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

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
    
   
        <!-- ----------------------------------코드시작 <main> 안에서 작성해야합니다~ --------------------------------------- -->

	<main class="app-content" style="background:white;">

	<div style="margin-top: 50px; height: 20%;" align="center"
		class="form-inline">
		<form action="<%=request.getContextPath() %>/cafeList.ap" class="form-inline my-2 my-lg-0">
		<select name="kinds" class="form-control">
			<option>-----</option>   
			<option value="cafeName">카페이름</option>
			<option value="applicant">신청자</option>
		</select> 				
		<input type="text" name="search" class="form-control mr-sm-2" size="20" placeholder="내용을 입력하세요.">
		<button type="submit" class="btn btn-outline-secondary my-2 my-sm-0">검색</button>
		</form>
	</div>
	
	<div style="height: 50%;">
		<table class="table"
			style="text-align: center; border: 1px solid #dddddd; margin-top: 50px;">
			<thead>
				<tr>
					<th style="background-color: #fafafa; text-align: center;">No.</th>
					<th style="background-color: #fafafa; text-align: center;">카페이름</th>
					<th style="background-color: #fafafa; text-align: center;">신청자</th>
					<th style="background-color: #fafafa; text-align: center;">신청날짜</th>
					<th style="background-color: #fafafa; text-align: center;">등록여부</th>
				</tr>
				<%if(msg == null){ %>
 				<%for(Cafe c : list) { %>
				<tr>
					<td><input type="checkbox" value="<%=c.getC_no() %>"
						name="ckbox">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=c.getC_no() %></td>
					<td><a class="announce" data-toggle="modal" value="<%=c.getCafe_name() %>"><%=c.getCafe_name() %></a></td>
					<!-- cafeInfo에서 수정 삭제 처리. -->
					<td><%=c.getNickname() %></td>
					<td><%=c.getReg_date() %></td>
					<td><%=c.getIsUpload() %></td>
				</tr>

					<%} %>
				<%} else {%>
				<tr>
					<td colspan="5"><%=msg %></td>
				</tr>
				<%} %>
			</thead>

		</table>
	</div>
	<script>
		
	$(document).ready(function(){
		   $(".announce").click(function(){ // Click to only happen on announce links
			   var cc = $(this).attr('value');
			   $('#modal').text(cc);
			   <% for(Cafe c : list) {%>
			   	if(cc == "<%= c.getCafe_name() %>"){
			   		$("#review_count").val(<%= c.getReview_count()%>);
			   		
			   		$("#memberFace").attr("src","<%=conPath%>/<%=c.getImg_path()%>");
			   		console.log("<%=conPath%>/<%=c.getImg_path()%>");
			   	}
			<% }%>
			   
			   
			   $('#nicModal').modal('show');
			   
		   });
		});
	
	
	
		var arr = [];
		$(function(){
			$("input:checkbox").change(function(){
				if($(this).prop("checked")){
					var ck = $(this).val();
					arr.push(ck);
					console.log(arr);
				}else{
					arr.pop(ck);
				}
				
			})
		})
		
		function ckCount(){
			if($("input:checkbox[name=ckbox]:checked").length == 0){
				alert("등록하실 카페번호를 체크하세요.");
			}else{

			location.href="<%=request.getContextPath() %>/cafeCk.ap?arr=" + arr.toString();
		
			}
		}
		function deleteCafe(){
			if($("input:checkbox[name=ckbox]:checked").length == 0){
				alert("삭제하실 카페번호를 체크하세요.");
			}else{

			location.href="<%=request.getContextPath() %>/deleteCafe.ap?arr=" + arr.toString();
		
			}
		}
	
	</script>
	
	<div style="margin-top: 30px; height: 50%">
		<button class="btn btn-danger btn-lg pull-right" onclick="deleteCafe();">삭제</button>
		<button style="margin-right: 10px;"
			class="btn btn-primary btn-lg pull-right" onclick="ckCount();">수정</button>
	</div>
	
	<%if(hidden != null) {%>
		
	<%} else { %>
	<div class="pagingArea" align="center">

		<!-- 맨 처음으로 (<<) -->
		<!-- 이전 페이지(<) -->
		<%if(currentPage == 1){ %>
		<button disabled="disabled" class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/cafeList.ap?currentPage=1';">
			&lt;&lt;</button>
		<button disabled="disabled" class="btn btn-primary">&lt;</button>
		<%} else{ %>
		<button class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/cafeList.ap?currentPage=1';">
			&lt;&lt;</button>
		<button class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/cafeList.ap?currentPage=<%=currentPage-1%>';">&lt;</button>
		<%} %>
		
		<!-- 10개의 페이지 목록 -->
		<%for(int p=startPage; p<=endPage; p++){ %>
		<% 	if(p == currentPage){ %>

		<button disabled="disabled" class="btn btn-danger"><%=p%></button>

		<%} else{ %>
		
		

		<button
			onclick="location.href='<%=request.getContextPath()%>/cafeList.ap?currentPage=<%=p%>';"
			class="btn btn-primary"><%=p %></button>

		<%}} %>

		<!-- 다음 페이지(>) -->
		<% if(currentPage == maxPage){ %>
		<button class="btn btn-primary" disabled="disabled">&gt;</button>
		<button disabled="disabled" class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/cafeList.ap?currentPage=<%=maxPage%>';">&gt;&gt;</button>
		<%} else { %>
		<button class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/cafeList.ap?currentPage=<%=currentPage+1%>';">&gt;</button>
		<button class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/cafeList.ap?currentPage=<%=maxPage%>';">&gt;&gt;</button>

		<%} %>
		<!-- 맨끝페이지(>>) -->

	</div>
<%} %>
	</main>
	<!--  -->
   	<div class="modal fade" id ="nicModal" tabindex="-1" role ="dialog" aria-labelledby="modal"aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class= "modal-content"> <!-- modal 1  -->
			
				<div class="modal-header"> <!-- modal header -->
				
					<h5 class="modal-title" id="modal" ></h5>
			
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"> &times; </span>
					</button>
				</div>
				<div class="modal-body">
					<div >
							<!-- form-row : 하나의 행을 여러 열로 나눌때 사용한다. -->
							<div class="form-group col-sm-4">
								<label>리뷰 작성 개수</label> <input type="text" id="review_count" readonly
									class="form-control" maxlength="20" />
							</div>
							<div class="form-group col-sm-12">
								<label>카페 대표 사진</label>
								<div style="width: 400px;height: 300px;margin-left: auto;margin-right: auto;">
									<img id="memberFace" src="" alt="" style="width: 400px;height: 300px;" />
								</div>
							</div>
						</div>
				</div>

			</div>
		</div>
	</div>
   	
</body>
</html>