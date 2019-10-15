<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.*,com.kh.admin.model.vo.*"%>
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
	
	//ArrayList<Member> list2 = (ArrayList<Member>) request.getAttribute("list2");
	
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	String hidden = (String) request.getAttribute("buttonhidden"); // 찾을땐 페이징 빼려고 넣음

	String msg = (String) request.getAttribute("msg");

	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<style>
 .announce:hover{
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
         <li><a class="app-menu__item" href="<%=request.getContextPath() %>/reviewList.ap">
			<i class="app-menu__icon fa fa-bars"></i><span class="app-menu__label">
        		리뷰 리스트</span></a>
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
		<form action="<%=request.getContextPath() %>/memberList.ap" class="form-inline my-2 my-lg-0">
		<select name="kinds" class="form-control">
			<option>-----</option>   
			<option value="memberNick">닉네임</option>
			<option value="memberEmail">이메일</option>
		</select> 				
		<input type="text" name="search" class="form-control mr-sm-2" size="20" placeholder="내용을 입력하세요.">
		<button type="submit" class="btn btn-outline-secondary my-2 my-sm-0">검색</button>
		</form>
	</div>
	<div style="float:right">	
		<button class = "btn btn-danger md" onclick="blackShow();">블랙리스트회원 보기</button>
	</div>
	<div style="height: 50%;">
		<table class="table"
			style="text-align: center; border: 1px solid #dddddd; margin-top: 50px;">
			<thead>
				<tr>
					<th style="background-color: #fafafa; text-align: center;">No.</th>
					<th style="background-color: #fafafa; text-align: center;">블랙리스트추가</th> 
					<th style="background-color: #fafafa; text-align: center;">이메일</th>
					<th style="background-color: #fafafa; text-align: center;">닉네임</th>
					<th style="background-color: #fafafa; text-align: center;">가입날짜</th>
					<th style="background-color: #fafafa; text-align: center;">블랙리스트</th>
					<th style="background-color: #fafafa; text-align: center;">탈퇴유무</th>
				</tr>
				<%if(msg == null){ %>
				<%for(Member m : list) { %>
				<tr>
					<td>
					<input type="checkbox" value="<%=m.getM_no()%>"
						name="ckbox">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=m.getM_no() %></td>
					<td><button value="<%=m.getM_no()%>" class="btn btn-primary sm bc" onclick="black(this.value);">블랙</button></td>
					<td><p style="margin: 0px;" id = "profile" value ="<%=m.getM_no()%>"><%=m.getEmail() %></p></td>
					<td><a class="announce" data-toggle="modal" value="<%=m.getNickName()%>"><%=m.getNickName() %></a></td>
					<td><%=m.getReg_date() %></td>
					<td><%=m.getIsBlack() %></td>
					<td><%=m.getIsOut() %></td>
				</tr>

				<%}%>
				<%} else {%>
				<tr>
					<td colspan="6"><%=msg%></td>
				</tr>
				<%}%>
			</thead>

		</table>
	</div>
	
	<script>
	   $(document).ready(function(){
	         $(".announce").click(function(){ // Click to only happen on announce links
	            var cc = $(this).attr('value');
	            $('#modal').text(cc+"님");
	            <% for(Member m : list) {%>
	               if(cc == "<%= m.getNickName() %>"){
	                  $("#bbsCount").val(<%= m.getReviewCount()%>);
	                  
	                  $("#memberFace").attr("src","<%=conPath%>/resources/fileupload/profile/<%=m.getProfile()%>");
	               }
	         <% }%>

	         $('#nicModal').modal('show');
	               
	         });
	      });
	      
	function black(b){
		alert("회원번호" + b + "번 블랙리스트에 추가하셨습니다.");
		location.href="<%=request.getContextPath() %>/blackListAdd.ap?b=" + b;
	}
	function blackShow(){
		location.href="<%=request.getContextPath() %>/blackShow.ap"
	}
	
	
	
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

	function deleteCafe(){
		if($("input:checkbox[name=ckbox]:checked").length == 0){
			alert("삭제하실 카페번호를 체크하세요.");
		}else{

			location.href="<%=request.getContextPath() %>/deleteMember.ap?arr=" + arr.toString();
	
		}
	}
	</script>
<div style="margin-top: 10px; height: 50%; display: block" >
   		<button class="btn btn-primary pull-right" onclick="deleteCafe();">회원삭제</button>
</div>

	
	<%if(hidden != null) {%>
		
	<%} else { %>
	<div class="pagingArea" align="center" style="margin-top: 30px;">

		<!-- 맨 처음으로 (<<) -->
		<!-- 이전 페이지(<) -->
		<%if(currentPage == 1){ %>
		<button disabled="disabled" class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/memberList.ap?currentPage=1';">
			&lt;&lt;</button>
		<button disabled="disabled" class="btn btn-primary">&lt;</button>
		<%} else{ %>
		<button class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/memberList.ap?currentPage=1';">
			&lt;&lt;</button>
		<button class="btn btn-primary"
			onclick="location.href='<%= request.getContextPath()%>/memberList.ap?currentPage=<%=currentPage-1%>';">&lt;</button>
		<%} %>
		
		<!-- 10개의 페이지 목록 -->
		<%for(int p=startPage; p<=endPage; p++){ %>
		<% 	if(p == currentPage){ %>

		<button disabled="disabled" class="btn btn-danger"><%=p%></button>

		<%} else{ %>
		
		

		<button
			onclick="location.href='<%=request.getContextPath()%>/memberList.ap?currentPage=<%=p%>';"
			class="btn btn-primary"><%=p %></button>

		<%}} %>

		<!-- 다음 페이지(>) -->
		<% if(currentPage == maxPage){ %>
		<button class="btn btn-primary" disabled="disabled">&gt;</button>
		<button disabled="disabled" class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/memberList.ap?currentPage=<%=maxPage%>';">&gt;&gt;</button>
		<%} else { %>
		<button class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/memberList.ap?currentPage=<%=currentPage+1%>';">&gt;</button>
		<button class="btn btn-primary"
			onclick="location.href='<%=request.getContextPath()%>/memberList.ap?currentPage=<%=maxPage%>';">&gt;&gt;</button>

		<%} %>
		<!-- 맨끝페이지(>>) -->
	</div>	
   	<%} %>
   	</main>
   	
   	<div class="modal fade" id ="nicModal" tabindex="-1" role ="dialog" aria-labelledby="modal"aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class= "modal-content"> <!-- modal 1  -->
			
				<div class="modal-header"> <!-- modal header -->
					<h5 class="modal-title" id="modal"></h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"> &times; </span>
					</button>
				</div>
				<div class="modal-body">
					 <div class="form-row">   
                  		<div class="col-md-4">
                     		<div  style="width: 60px; height: 60px; margin: auto;">
                       			<img style="width: 100%; height: 100%; border-radius: 50%; border: 1px solod red;" 
                           			id="memberFace">
                    		 </div>
                 		 </div>
                  	 	<div class="col-md-8">
                     		<label>게시글 작성 수</label> 
                     		<input type="text" id="bbsCount" class="form-control" maxlength="20" readonly
                        		style="display: inline;"/>               
                  	 	</div>
               		</div>
					
					<!-- <div >
							form-row : 하나의 행을 여러 열로 나눌때 사용한다.
							<div class="form-group col-sm-6">
								<label>게시글 작성 수</label> <input type="text" id="bbsCount"
									class="form-control" maxlength="20" readonly/>
							</div>
							<div class="form-group col-sm-6">
								<label>회원 얼굴</label> 
								<div style="width: 240px; height: 300px; border: 1px solid black;">
									<img id="memberFace" alt="" style="width: 240px; height: 300px; border: 1px solid red;">
								</div>
								
								
								
							</div>
						</div> -->
				</div>

			</div>
		</div>
	</div>
   	

</body>
</html>