package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminPageService;


@WebServlet("/blackListAdd.ap")
public class AdminPage_blackListAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminPage_blackListAdd() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int blackNum = Integer.parseInt(request.getParameter("b"));

		int result = new AdminPageService().updateBlack(blackNum);
		
		if(result > 0) {
			
			response.sendRedirect("memberList.ap");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
