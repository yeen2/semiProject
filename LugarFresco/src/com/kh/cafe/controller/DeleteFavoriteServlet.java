package com.kh.cafe.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cafe.model.service.CafeService;
import com.kh.member.model.vo.Member;


@WebServlet("/deleteFavorite.ca")
public class DeleteFavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteFavoriteServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int m_no = ((Member)request.getSession().getAttribute("loginUser")).getM_no();
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		String str = "실패";
		
		int result = new CafeService().deleteFavorite(m_no, c_no);
		
		if(result > 0){
			str ="성공";
		}
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(str);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
