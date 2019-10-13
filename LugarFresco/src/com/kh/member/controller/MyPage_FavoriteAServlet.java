package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.cafe.model.vo.Cafe;
import com.kh.member.model.service.MyPageService;
import com.kh.member.model.vo.Member;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class MyPage_FavoriteAServlet
 */
@WebServlet("/myFavoriteA.mp")
public class MyPage_FavoriteAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPage_FavoriteAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			int mno = loginUser.getM_no();
			
			ArrayList<Cafe> list = new MyPageService().selectFavoriteList(mno);
			response.setContentType("application/json; charset=utf-8");
			
			Gson gson = new Gson();
			gson.toJson(list, response.getWriter());
			
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
