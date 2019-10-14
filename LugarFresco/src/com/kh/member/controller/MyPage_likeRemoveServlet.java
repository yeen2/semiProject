package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MyPageService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MyPage_likeRemoveServlet
 */
@WebServlet("/likeRm.mp")
public class MyPage_likeRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPage_likeRemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			int mno = loginUser.getM_no();
			int rno = Integer.parseInt(request.getParameter("rno"));
			System.out.println(rno);
			int result = new MyPageService().likeRemove(mno, rno);
			
			if(result > 0) {
				response.getWriter().print("1");
			}else {
				response.getWriter().print("2");
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
