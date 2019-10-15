package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminPageService;

/**
 * Servlet implementation class AdminPage_powerLinkCancel
 */
@WebServlet("/powerCancel.ap")
public class AdminPage_powerLinkCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    public AdminPage_powerLinkCancel() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String arr = request.getParameter("arr");

		int result = new AdminPageService().powerCancel(arr);
		
		if(result > 0) {
			response.sendRedirect("powerList.ap");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
