package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;




@WebServlet("/join.me")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public JoinServlet() {
        super();

    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		String nickName = request.getParameter("nickName");
		String pass = request.getParameter("pass");
		
		// 이메일 중복확인 + 닉네임 중복확인 소스 해야함 (ajax도 알아보기)
		
		Member m = new Member(email, nickName, pass);
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("msg", "회원 가입 성공!!");
			
			//메인으로
			response.sendRedirect(request.getContextPath());
			
		}else {
			request.setAttribute("msg", "회원가입에 실패하셨습니다");
			
			//에러페이지로
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response);
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
