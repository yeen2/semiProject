package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MyPageService;
import com.kh.member.model.vo.Member;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class MyPage_myReviewDeleteServlet
 */
@WebServlet("/deleteReview.mp")
public class MyPage_myReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPage_myReviewDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			String arr = request.getParameter("arr");
			
			int result = new MyPageService().deleteReview(arr);
			
			if(result > 0) {
				request.getSession().setAttribute("msg", "리뷰 삭제에 성공하였습니다.");
				response.sendRedirect("myReview.mp");
				
			}else {
				request.setAttribute("msg", "리뷰 삭제에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
			}
			
		}else {
			request.getRequestDispatcher("views/common/loginForm.jsp").forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
