package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminPageService;

/**
 * Servlet implementation class AdminPage_cafeApplyRegistrationServlet
 */
@WebServlet("/cafeRegistration.ap")
public class AdminPage_cafeApplyRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminPage_cafeApplyRegistrationServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String arr = request.getParameter("arr");

		int result = new AdminPageService().cafeRegistraion(arr);
		
		if(result > 0) {
			
			response.sendRedirect("cafeApplyList.ap");
		}
		
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
