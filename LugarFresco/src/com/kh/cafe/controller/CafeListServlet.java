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
import com.kh.cafe.model.vo.PageInfo;


@WebServlet("/cafeList.ca")
public class CafeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CafeListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		// 만약, 로그인세션이 있으면 해당 m_no로 db가서 리스트들중, 카페즐겨찾기 한게 있나 확인하기
		
		// 페이징 처리로 게시글 불러오기
		int listCount = new CafeService().getListCount();
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int pageLimit = 10;    // 페이지 하단에 보여질 총 페이지 수
		int boardLimit = 9;     // 한 페이지에 보여질 게시글 최대 수
		// 전체 페이지에서 제일 마지막 페이지
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		ArrayList<Cafe> paginglist = new CafeService().selectList(pi);
		
		// 카페 전체 리스트 불러오기
		ArrayList<Cafe> cafeList = new CafeService().selectCafeList();
		
		request.setAttribute("pi", pi);
		request.setAttribute("paginglist", paginglist);
		request.setAttribute("list", cafeList);
		
		request.getRequestDispatcher("views/cafe/list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
