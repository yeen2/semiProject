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
 * Servlet implementation class QuestionUpdateServlet
 */
@WebServlet("/q_update.qu")
public class QuestionUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");// 글이 써져서 jsp로 보내는 놈들은 이걸 써줘야된다.
		
		int q_no = Integer.parseInt(request.getParameter("q_no"));
		String q_content = request.getParameter("q_content");
		int reaction = new QuestionService().updateQuestion(q_content, q_no);
		Question result = new QuestionService().selectDetailQuestion(q_no);
		
		request.setAttribute("result",result);
		//----------------------------------서블릿을 적게 만들기 위한 jsp처리 코드----------------------
		//원리는 jsp에서 보낼 페이지의 info값을 미리 보내주어 서블릿에서 if문 처리하면 끝~!!
		String info = request.getParameter("info");
		
		if(reaction >0) {
			if(info.equals("info")) {
				request.getRequestDispatcher("views/question/q_info.jsp").forward(request, response);
			}else if(info.equals("reply")){
				request.getRequestDispatcher("views/question/q_info.jsp").forward(request, response);
			}
			}else {
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
