package com.kh.cafe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cafe.model.service.CafeService;
import com.kh.cafe.model.vo.Cafe;


@WebServlet("/nav_search.ca")
public class NavSearchCafeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public NavSearchCafeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("nav_search");
		
		ArrayList<Cafe> list = new CafeService().selectNavSearch(keyword);
		
		request.setAttribute("list", list);
		
		request.setAttribute("keyword",keyword);
		request.getRequestDispatcher("views/cafe/searchCafe.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
