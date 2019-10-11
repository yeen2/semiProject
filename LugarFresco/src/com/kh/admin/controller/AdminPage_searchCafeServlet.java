package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminPageService;
import com.kh.cafe.model.vo.Cafe;

/**
 * Servlet implementation class AdminPage_searchCafeServlet
 */
@WebServlet("/searchCafe")
public class AdminPage_searchCafeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPage_searchCafeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String search = request.getParameter("search");
		
		String kinds = request.getParameter("kinds");
		
		if(kinds.equals("cafeName")) {
			
			ArrayList<Cafe> list = new AdminPageService().selectCafeNameSearch(search);

			if(list != null) {
				
				response.sendRedirect("cafeList.ap?list="+ list);
			
			}else {
				
				request.setAttribute("msg", "조회하신 내용은 존재하지 않습니다");
				request.getRequestDispatcher("views/admin/adminPage_cafeList.jsp").forward(request, response);
				
			}
			
		} else {
			
			ArrayList<Cafe> list = new AdminPageService().selectApplicantNameSearch(search);
			
			if(list != null) {

				response.sendRedirect("cafeList.ap");

			}else {
				
				
				request.setAttribute("msg", "조회하신 내용은 존재하지 않습니다");
				request.getRequestDispatcher("views/admin/adminPage_cafeList.jsp").forward(request, response);

			}
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
