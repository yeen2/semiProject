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
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.ReviewImg;


@WebServlet("/cafeInfo.ca")
public class CafeInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CafeInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		
		// 카페정보 
		Cafe c = new CafeService().selectOneCafe(c_no);
		
		// 카페의 리뷰리스트들
		ArrayList<Review> r = new ArrayList<>();

		// 세션확인
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		if(m != null) {
			
			// 세션 있을때, 해당 m_no와 c_no로 즐겨찾기 확인
			int sessionFavorite = new CafeService().checkFavorite(m.getM_no(), c_no); // 즐겨찾기했다 = 1, 안함 = 0
			request.setAttribute("sessionFavorite", sessionFavorite);
			
			// 세션 있을때, 해당 m_no, c_no, r_no로 좋아요+신고 확인
			r = new ReviewService().selectOneCafeReview(c_no, m.getM_no());	
			
		}else {
			r = new ReviewService().selectOneCafeReview(c_no, 1000000);
		}
		
		request.setAttribute("c", c);
		request.setAttribute("r", r);
		
		request.getRequestDispatcher("views/cafe/cafeInfo.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
