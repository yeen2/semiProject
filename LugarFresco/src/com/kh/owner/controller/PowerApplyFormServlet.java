package com.kh.owner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;


@WebServlet("/powerApplyForm.op")
public class PowerApplyFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public PowerApplyFormServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			int cno = Integer.parseInt(request.getParameter("cno"));
			
			request.setAttribute("cno", cno);
			request.getRequestDispatcher("views/owner/applyPower.jsp").forward(request, response);
			
		}else {
			request.getRequestDispatcher("views/common/loginForm.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
