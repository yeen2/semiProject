package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cafe.model.vo.Cafe;
import com.kh.member.model.service.MyPageService;
import com.kh.member.model.vo.Member;


@WebServlet("/myFavorite.mp")
public class MyPage_FavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyPage_FavoriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			int mno = loginUser.getM_no();
			
			ArrayList<Cafe> list = new MyPageService().selectFavoriteList(mno);
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/member/myPage_favorite.jsp").forward(request, response);
			
		}else {
			request.getRequestDispatcher("views/common/loginForm.jsp").forward(request, response);
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
