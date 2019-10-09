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


@WebServlet("")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		ArrayList<Cafe> c1 = new ArrayList<>();
		ArrayList<Cafe> c2 = new ArrayList<>();
		ArrayList<Cafe> c3 = new ArrayList<>();
		
		// 세션확인
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
			if(m != null) {
				c1 = new CafeService().mainCafeList(m.getM_no(), "selectOrderByCount");
				c2 = new CafeService().mainCafeList(m.getM_no(), "selectOrderByAvg");
				c3 = new CafeService().mainCafeList(m.getM_no(), "selectOrderPower");
				
			}else {
				c1 = new CafeService().mainCafeList(10000000, "selectOrderByCount");
				c2 = new CafeService().mainCafeList(10000000, "selectOrderByAvg");
				c3 = new CafeService().mainCafeList(10000000, "selectOrderPower");

			}
			
		request.setAttribute("c1", c1);
		request.setAttribute("c2", c2);
		request.setAttribute("c3", c3);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
