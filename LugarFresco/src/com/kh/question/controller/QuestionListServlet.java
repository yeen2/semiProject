package com.kh.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.question.model.service.QuestionService;
import com.kh.question.model.vo.PageInfo;
import com.kh.question.model.vo.QnAList;


@WebServlet("/q_list.qu")
public class QuestionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		public QuestionListServlet() {
			super();
		}
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			
	
			request.setCharacterEncoding("UTF-8");
			
			String word = request.getParameter("word");
			String search = request.getParameter("search");
			
			int listCount = new QuestionService().getListCount(search, word);
			int currentPage =1;
			
				if(request.getParameter("currentPage")!=null) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
			int pageLimit=10;
			int maxPage;
			int startPage;
			int endPage;
			int boardLimit=10;
			int startQuestion;
			int endQuestion;
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
			startPage = (currentPage-1)/pageLimit*pageLimit+1;
			endPage = startPage-1+pageLimit;
				if(maxPage<endPage) {
					endPage=maxPage;
				}
			startQuestion = (currentPage-1)*boardLimit+1;
			endQuestion = startQuestion+boardLimit-1;
			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit, startQuestion, endQuestion);
			ArrayList<QnAList> q_list = new QuestionService().selectListQuestion(pi, search, word);
			request.setAttribute("q_list", q_list);
			request.setAttribute("pi", pi);
			request.setAttribute("word", word);
			request.setAttribute("search", search);
			request.getRequestDispatcher("views/question/q_list.jsp").forward(request, response);
		
		}else {
			request.getRequestDispatcher("views/common/loginForm.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
