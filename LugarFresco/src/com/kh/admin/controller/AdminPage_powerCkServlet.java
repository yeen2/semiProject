	package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminPageService;

/**
 * Servlet implementation class AdminPage_powerCkServlet
 */
@WebServlet("/powerCk.ap")
public class AdminPage_powerCkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPage_powerCkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String arr = request.getParameter("arr");
		
		
		int result = new AdminPageService().powerRegistration(arr);
		
		if(result > 0) {
			
			response.sendRedirect("powerList.ap");
		
		}else {
			
			request.setAttribute("message", "파워링크 개수 초과");
			
			request.getRequestDispatcher("views/admin/adminPage_powerList.jsp").forward(request, response);
		
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
