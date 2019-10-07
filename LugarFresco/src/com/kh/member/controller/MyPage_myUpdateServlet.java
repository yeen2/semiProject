	package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MyPage_myUpdateServlet
 */
@WebServlet("/myUpdateForm.mp")
public class MyPage_myUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyPage_myUpdateServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		String img = loginUser.getProfile();
		String email = loginUser.getEmail();
		String nickName = loginUser.getNickName();
		
		request.setAttribute("img", img);
		request.setAttribute("email", email);
		request.setAttribute("nickName", nickName);
		
		request.getRequestDispatcher("views/member/myPage_myUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
