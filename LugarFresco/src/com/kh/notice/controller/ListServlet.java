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


@WebServlet("/list.no")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount = new NoticeService().getListCount();
		
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
		
		maxPage = (int)Math.ceil((double)listCount / noticeLimit);
		
		startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, noticeLimit);
		System.out.println(pi);
	
			
		
		ArrayList<Notice> list = new NoticeService().selectList(pi);
		//System.out.println(list);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/notice/n_list.jsp").forward(request, response);
		
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
