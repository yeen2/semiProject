package com.kh.owner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MyPageService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class OwnerPagePowerServlet
 */
@WebServlet("/powerIn.op")
public class OwnerPagePowerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerPagePowerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			int mno = loginUser.getM_no();
			int cno = Integer.parseInt(request.getParameter("cno"));
			int price = Integer.parseInt(request.getParameter("price"));
			System.out.println(cno);
			System.out.println(price);
			
			int result = new MyPageService().insertPowerPay(mno, cno, price);
			
			if(result > 0) {
				request.getSession().setAttribute("msg", "결제 완료! 파워등록 신청이 완료되었습니다.");
				response.sendRedirect("myPowerList.op");
			}else {
				request.setAttribute("msg", "파워등록 신청에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
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
