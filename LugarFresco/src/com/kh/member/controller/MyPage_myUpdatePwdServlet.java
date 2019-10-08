package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MyPageService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MyPage_myUpdatePwdServlet
 */
@WebServlet("/updatePwd.mp")
public class MyPage_myUpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPage_myUpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd1");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String email = loginUser.getEmail();
		
		Member m = new Member();
		
		m.setEmail(email);
		m.setPass(userPwd);
		
		Member updateMem = new MyPageService().updatePwd(m, newPwd);
		
		if(updateMem != null) {
			session.setAttribute("msg", "성공적으로 비밀번호가 변경되었습니다.");
			
			session.setAttribute("loginUser", updateMem);
			
			request.getRequestDispatcher("views/member/myPage_myUpdate.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
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
