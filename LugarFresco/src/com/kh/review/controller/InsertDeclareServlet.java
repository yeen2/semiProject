package com.kh.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Declare;


@WebServlet("/declare.re")
public class InsertDeclareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertDeclareServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int c_no = Integer.parseInt(request.getParameter("c_no")); // info로 갈 url에 전송
		int r_no = Integer.parseInt(request.getParameter("r_no"));
		int m_no = ((Member) request.getSession().getAttribute("loginUser")).getM_no();
		String cate = request.getParameter("cate");
		String content = request.getParameter("content");
		
		Declare de = new Declare();
		de.setR_no(r_no);
		de.setM_no(m_no);
		de.setCategory(cate);
		de.setContent(content);
		
		int result = new ReviewService().insertDeclare(de);
		
		if(result > 0) { //신고등록 성공
			
			request.getSession().setAttribute("msg", "신고 등록 완료되었습니다~");
			response.sendRedirect("cafeInfo.ca?c_no="+c_no);
			
		}else {
			request.setAttribute("msg", "신고 등록 실패! 다시 시도해주세요");
			request.getRequestDispatcher("views/common/errorPage.jsp");
		}
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
