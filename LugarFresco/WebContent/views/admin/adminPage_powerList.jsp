<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.PowerLink.model.vo.*,com.kh.admin.model.vo.*,java.util.ArrayList"%>
<%
   ArrayList<PowerLink> list = (ArrayList<PowerLink>) request.getAttribute("list");

   int result = (int)request.getAttribute("result");
   
   PageInfo pi = (PageInfo) request.getAttribute("pi");

   String hidden = (String) request.getAttribute("buttonhidden"); // 찾을땐 페이징 빼려고 넣음

   String msg = (String) request.getAttribute("msg");
   
   String str = "";

   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   

%>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
   

   <div style="margin-top: 50px; height: 20%;" align="center" class="form-inline">
      <form action="<%=request.getContextPath()%>/powerList.ap"  class="form-inline my-2 my-lg-0">
         <select name="kinds" class="form-control">
            <option>-----</option>
            <option value="cafeName">카페명</option>
            <option value="applicantName">신청자</option>
         </select> <input type="text" name="search" class="form-control mr-sm-2"
            size="20" placeholder="내용을 입력하세요.">
         <button type="submit" class="btn btn-outline-secondary my-2 my-sm-0">검색</button>
      </form>
   </div>
   <div style="height: 50%;">
      <table class="table"
         style="text-align: center; border: 1px solid #dddddd; margin-top: 50px;">
         <thead>
            <tr>
               <th style="background-color: #fafafa; text-align: center;">No.</th>
               <th style="background-color: #fafafa; text-align: center;">카페명</th>
               <th style="background-color: #fafafa; text-align: center;">신청자</th>
               <th style="background-color: #fafafa; text-align: center;">등록날짜</th>
               <th style="background-color: #fafafa; text-align: center;">신청날짜</th>
               <th style="background-color: #fafafa; text-align: center;">상태여부</th>
               <th style="background-color: #fafafa; text-align: center;">파워링크 등록여부</th>
            </tr>
            <%if(msg == null){ %>
            <%for(PowerLink p : list) { %>
            
            <tr>
               <td style="padding-top:15px;"><%=p.getP_no()%></td>
               <td style="padding-top:15px;"><p style="margin: 0px;" id = "profile"><%=p.getCafe_name()%></p></td>
               <td style="padding-top:15px;"><a class="announce" data-toggle="modal" ><%=p.getNickname() %></a></td>
               <td style="padding-top:15px;"><%=p.getReg_date()%></td>
               <td style="padding-top:15px;"><%=p.getUpload_date()%></td>
                 <% if(p.getStatus()==1){
                                          str = "등록전";
                                       }else if(p.getStatus() == 2){
                                             str = "등록중";
                                          }else{
                                             str = "등록완료";
                                          }%> 
                                           
                                    
               <td class="td3" style="padding-top:15px;" ><%=str%></td>
               <td width="300">
               
                  <form action="<%=request.getContextPath()%>/powerCk2.ap" value="d">
                     <input type="hidden" value ="<%=p.getP_no() %>">
                     <input type="hidden" value ="<%=p.getC_no() %>">
                     
                     <input type="radio" name="registration" value="1">등록전 &nbsp;&nbsp;
                     <input type="radio" name="registration" value="2">등록중 &nbsp;&nbsp;
                     <input type="radio" name="registration" value="3">등록완료 &nbsp;&nbsp;
                     <input type="button"class="bbtn btn btn-primary btn-sm" value="등록" />
                  </form>
         
               </td>
               
            </tr>
         
            <%}   %>
            <%} else {%>
            <tr>
               <td colspan="6"><%=msg%></td>
            </tr>
            <%}%>
         </thead>

      </table>
   </div>
      <script>
      
      $(function(){
         $(".bbtn").click(function(){   

         var this_btn = this;
         // 상태값
         var ck = $(this).siblings("input:checked").val();
         // P_NO
         var no = $(this).siblings().eq(0).val();
         // c_no
          var c_no = $(this).siblings().eq(1).val();

             $.ajax({
               url:"powerCk2.ap",    
               data:{radio:ck, Mno:no, c_no:c_no}, 
               type:"GET",
               success:function(result){
               
                  if(ck == 1){
                     
                  /*    console.log($(this).parent().parent().prev().attr('class'));
                   */   
                   console.log($(this_btn).parent().parent().siblings().eq(0).attr('class'));
                     $(this_btn).parent().parent().prev().text("등록전");
                     location.href="powerList.ap";
                  }else if(ck==2){
                     if(<%=result%> > 5 ){
                        alert("파워링크 초과하셨습니다.");
                        return;
                     }
                     $(this_btn).parent().parent().prev().text("등록중");
                     location.href="powerList.ap";
                     
                  }else{
                     $(this_btn).parent().parent().prev().text("등록완료");
                     location.href="powerList.ap";
                     
                  }
               
            /*       $.each(result, function(index, value){
                     
                     if(value.p_no == no){
                        $(".td3").text(value.status);
                        console.log("================");
                      }
               
                  });*/
                  
                  console.log("ajax 통신 성공");   
                  console.log(result);
                  
               },
               error:function(){ 
                  console.log("ajax 통신 실패");
               },
               complete:function(){ 
                  console.log("무조건 출력 ! ! ");
                  
               }

             });
         });
      });

   </script>
   
   
<!--    <div style="margin-top: 30px; height: 50%">
         <button class="btn btn-danger pull-right ml-3" onclick="powerCancel();">파워취소</button>
         <button class="btn btn-primary pull-right" onclick="power();">파워등록</button>
   </div>
   <script>
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
    -->
<%--    function powerCancel(){
         if($("input:checkbox[name=ckbox]:checked").length == 0){
            alert("파워취소 카페번호를 체크하세요.");
         }else if($("input:checkbox[name=ckbox]:checked").length == 2) {
            
            alert("하나만 체크 하세요.");
            
      
         }else{
            location.href="<%=request.getContextPath() %>/powerCancel.ap?arr=" + arr.toString();
         }
      }
   
   
   function power(){
      if($("input:checkbox[name=ckbox]:checked").length == 0){
         alert("파워등록 카페번호를 체크하세요.");
      }else if($("input:checkbox[name=ckbox]:checked").length == 2){
         
         alert("하나만 체크 하세요.");
      }else{
         if(<%=result%> >= 3){
            
            alert("파워링크 개수 초과하셨습니다.");
            
            location.href="<%=request.getContextPath() %>/powerList.ap";
            
         }else{
         
               location.href="<%=request.getContextPath() %>/powerCk.ap?arr=" + arr.toString();
            }
         }

      
   }
   </script> --%>
   
   <%if(hidden != null) {%>
      
   <%} else { %>
   <div class="pagingArea" align="center" style="margin-top: 30px;">

      <!-- 맨 처음으로 (<<) -->
      <!-- 이전 페이지(<) -->
      <%if(currentPage == 1){ %>
      <button disabled="disabled" class="btn btn-primary"
         onclick="location.href='<%= request.getContextPath()%>/powerList.ap?currentPage=1';">
         &lt;&lt;</button>
      <button disabled="disabled" class="btn btn-primary">&lt;</button>
      <%} else{ %>
      <button class="btn btn-primary"
         onclick="location.href='<%= request.getContextPath()%>/powerList.ap?currentPage=1';">
         &lt;&lt;</button>
      <button class="btn btn-primary"
         onclick="location.href='<%= request.getContextPath()%>/powerList.ap?currentPage=<%=currentPage-1%>';">&lt;</button>
      <%} %>
      
      <!-- 10개의 페이지 목록 -->
      <%for(int p=startPage; p<=endPage; p++){ %>
      <%    if(p == currentPage){ %>

      <button disabled="disabled" class="btn btn-danger"><%=p%></button>

      <%} else{ %>
      
      

      <button
         onclick="location.href='<%=request.getContextPath()%>/powerList.ap?currentPage=<%=p%>';"
         class="btn btn-primary"><%=p %></button>

      <%}} %>

      <!-- 다음 페이지(>) -->
      <% if(currentPage == maxPage){ %>
      <button class="btn btn-primary" disabled="disabled">&gt;</button>
      <button disabled="disabled" class="btn btn-primary"
         onclick="location.href='<%=request.getContextPath()%>/powerList.ap?currentPage=<%=maxPage%>';">&gt;&gt;</button>
      <%} else { %>
      <button class="btn btn-primary"
         onclick="location.href='<%=request.getContextPath()%>/powerList.ap?currentPage=<%=currentPage+1%>';">&gt;</button>
      <button class="btn btn-primary"
         onclick="location.href='<%=request.getContextPath()%>/powerList.ap?currentPage=<%=maxPage%>';">&gt;&gt;</button>

      <%} %>
      <!-- 맨끝페이지(>>) -->
   </div>   
      <%} %>
      </main>

          
</body>
</html>