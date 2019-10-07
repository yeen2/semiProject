package com.kh.question.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.question.model.service.QuestionService;
import com.kh.question.model.vo.Question;

/**
 * Servlet implementation class QuestionDetailServlet
 */
@WebServlet("/selectQuestion.qu")
public class QuestionDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int q_no = Integer.parseInt(request.getParameter("q_no"));
		Question result = new QuestionService().selectDetailQuestion(q_no);
		request.setAttribute("result", result);
		//----------------------------------서블릿을 적게 만들기 위한 jsp처리 코드----------------------
		//원리는 jsp에서 보낼 페이지의 info값을 미리 보내주어 서블릿에서 if문 처리하면 끝~!!
		String info=request.getParameter("info");
		
		if(info.equals("update")) {	
			request.getRequestDispatcher("views/question/q_update.jsp").forward(request, response);
		}else if(info.equals("info")||info.equals("cancle")) {
			request.getRequestDispatcher("views/question/q_info.jsp").forward(request, response);
		}else if(info.equals("reply")) {
			request.getRequestDispatcher("views/question/q_reply.jsp").forward(request, response);
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
