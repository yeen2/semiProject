package com.kh.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/writeForm.re")
public class WriteFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WriteFormServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getParameter("utf-8");
		
		request.setAttribute("c_no", Integer.parseInt(request.getParameter("c_no")));
		request.setAttribute("name", request.getParameter("name"));
		request.getRequestDispatcher("views/cafe/re_write.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
