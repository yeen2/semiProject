package com.kh.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;
import com.kh.notice.model.vo.PageInfo;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search.no")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String word = request.getParameter("word");
		String search = request.getParameter("search");
		
		int searchListCount =  new NoticeService().searchNoticeCount(word, search);
		
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int pageLimit;
		int noticeLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		pageLimit = 10;
		noticeLimit = 10;
		
		maxPage = (int)Math.ceil((double)searchListCount / noticeLimit);
		
		startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, searchListCount, pageLimit, maxPage, startPage, endPage, noticeLimit);
		System.out.println(pi);
	
			
		
		ArrayList<Notice> list = new NoticeService().searchSelectList(pi, word, search);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("word", word);
		request.setAttribute("search", search);
		request.getRequestDispatcher("views/notice/n_list.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
