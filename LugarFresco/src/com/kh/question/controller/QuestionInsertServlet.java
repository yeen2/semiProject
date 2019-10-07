package com.kh.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.question.model.service.QuestionService;
import com.kh.question.model.vo.Question;

/**
 * Servlet implementation class QuestionInsertServlet
 */
@WebServlet("/q_insert.qu")
public class QuestionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");// 글이 써져서 jsp로 보내는 놈들은 이걸 써줘야된다.
		String m_no=request.getParameter("m_no");
		String q_title=request.getParameter("q_title");
		String q_content=request.getParameter("q_content");
		
		Question q = new Question();
		q.setQ_writer(m_no);
		q.setQ_title(q_title);
		q.setQ_content(q_content);
		
		int result = new QuestionService().insertQuestion(q);
		
		if(result>0) {
			response.sendRedirect("q_list.qu");
		}else {
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
