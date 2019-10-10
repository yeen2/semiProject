package com.kh.cafe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cafe.model.service.CafeService;
import com.kh.cafe.model.vo.Cafe;
import com.kh.member.model.vo.Member;
import com.kh.review.model.service.ReviewService;


@WebServlet("/nav_search.ca")
public class NavSearchCafeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public NavSearchCafeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		ArrayList<Cafe> list = new ArrayList<>();
		String keyword = request.getParameter("nav_search");
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		
		if(m != null) {
			System.out.println("m_no : " + m.getM_no() + "keyword : " + keyword);
			list = new CafeService().selectNavSearch(m.getM_no(), keyword);

		}else {
			list = new CafeService().selectNavSearch(1000000, keyword);
		}
		
		
		request.setAttribute("list", list);
		request.setAttribute("keyword",keyword);
		request.getRequestDispatcher("views/cafe/searchCafe.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
