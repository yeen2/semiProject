package com.kh.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.question.model.service.QuestionService;
import com.kh.question.model.vo.PageInfo;
import com.kh.question.model.vo.Question;

/**
 * Servlet implementation class QuestionDeleteServlet
 */
@WebServlet("/q_delete.qu")
public class QuestionDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int q_no = Integer.parseInt(request.getParameter("q_no"));
		int result = new QuestionService().deleteQuestion(q_no);
		//---------------------- 더미 변수들  메소드 재활용을 위해 더미 값을 넣어줬다. list갯수를 파악해서 다시 jsp로 보낼려는 작업이다.-------------
		//쓰고보니 이것도 listServlet으로 q_no를잘 처리하면 합칠수 있을것같다.
		String happydog=request.getParameter("q_title");
		String luckyday=request.getParameter("q_writer");
		int listCount = new QuestionService().getListCount(happydog, luckyday);
		int currentPage =1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int pageLimit=10;
		int maxPage;
		int startPage;
		int endPage;
		int boardLimit=10;
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		startPage = (currentPage-1)/pageLimit*pageLimit+1;
		endPage = startPage-1+pageLimit;
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		ArrayList<Question> q_list = new QuestionService().selectListQuestion(pi, happydog, luckyday);
		request.setAttribute("q_list", q_list);
		request.setAttribute("pi", pi);
		if(result>0) {
			request.getRequestDispatcher("views/question/q_list.jsp").forward(request, response);
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
