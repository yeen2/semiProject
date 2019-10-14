package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminPageService;
import com.kh.member.model.vo.Member;


@WebServlet("/adminPage.ap")
public class AdminPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminPageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			
		
			int memberCount = new AdminPageService().getMemberListCount();
			
			int cafeCount = new AdminPageService().getListCount();
			
			int powerCount = new AdminPageService().getPowerLinkCount();
			
			int declareCount = new AdminPageService().getDeclareList();
			
			int cafeApplyCount = new AdminPageService().getCafeApplyCount();
			
			int qnaCount = new AdminPageService().getQnaCount();
			
			request.setAttribute("memberCount", memberCount);
			request.setAttribute("cafeCount", cafeCount);
			request.setAttribute("powerCount", powerCount);
			request.setAttribute("declareCount", declareCount);
			request.setAttribute("cafeApplyCount", cafeApplyCount);
			request.setAttribute("qnaCount", qnaCount);
			
			
			request.getRequestDispatcher("views/admin/adminPage.jsp").forward(request, response);
				
		}else {
			request.getRequestDispatcher("views/common/loginForm.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
