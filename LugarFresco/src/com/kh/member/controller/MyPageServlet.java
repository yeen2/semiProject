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

@WebServlet("/myPage.mp")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyPageServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			int mno = loginUser.getM_no();
			
			int[] arr = new MyPageService().myPageCount(mno);
			
			request.setAttribute("arr", arr);
			request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
			
		}else {
			request.getRequestDispatcher("views/common/loginForm.jsp").forward(request, response);
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
