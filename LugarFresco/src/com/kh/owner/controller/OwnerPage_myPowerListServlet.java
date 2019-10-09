package com.kh.owner.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.vo.PageInfo;
import com.kh.member.model.service.MyPageService;
import com.kh.member.model.vo.Member;
import com.kh.owner.model.vo.PowerLink;


@WebServlet("/myPowerList.op")
public class OwnerPage_myPowerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OwnerPage_myPowerListServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			int mno = loginUser.getM_no();
			
			int listCount = new MyPageService().ownerPowerCount(mno);
			
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int pageLimit;
			int boardLimit;
			int maxPage;
			int startPage;
			int endPage;
			
			pageLimit = 10;
			boardLimit = 10;
			
			maxPage = (int)Math.ceil((double)listCount / boardLimit);
			
			startPage = (currentPage-1)/pageLimit * pageLimit + 1;
			
			endPage = startPage + pageLimit - 1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			
			ArrayList<PowerLink> list = new MyPageService().ownerPowerList(pi, mno);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/owner/ownerPage_myPowerList.jsp").forward(request, response);
			
		}else {
			request.getRequestDispatcher("views/common/loginForm.jsp").forward(request, response);
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
