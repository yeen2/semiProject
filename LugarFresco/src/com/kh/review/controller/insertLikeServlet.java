package com.kh.review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.review.model.service.ReviewService;


@WebServlet("/insertLike.re")
public class insertLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public insertLikeServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int r_no = Integer.parseInt(request.getParameter("r_no"));
		int m_no = ((Member) request.getSession().getAttribute("loginUser")).getM_no();
		String str = "실패";
		
		int result = new ReviewService().insertLike(r_no, m_no);
		
		if(result > 0) {
			str = "성공";
		}
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(str);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
