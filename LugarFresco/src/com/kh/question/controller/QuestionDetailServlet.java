package com.kh.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.question.model.service.QuestionService;
import com.kh.question.model.vo.QnAList;

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
		// ----------------------------------delete기능!!-------------------------------------
		int q_no = Integer.parseInt(request.getParameter("q_no"));
		QnAList result = new QuestionService().selectDetailQuestion(q_no);
		request.setAttribute("result", result);
		//---------------------------------로그인 안하면 jsp로 안가고 에러페이지 가게끔 -------------------
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println(loginUser);
		int m_no =0;
		if(loginUser!=null) {
		m_no = loginUser.getM_no();
		}
		
		if(m_no!=0) {
		//----------------------------------서블릿을 적게 만들기 위한 jsp처리 코드----------------------
		//원리는 jsp에서 보낼 페이지의 info값을 미리 보내주어 서블릿에서 if문 처리하면 끝~!!
			String info=request.getParameter("info");
			
			if("update".equals(info)) {	
				request.getRequestDispatcher("views/question/q_update.jsp").forward(request, response);
			}else if("info".equals(info)||"cancle".equals(info)) {
				request.getRequestDispatcher("views/question/q_info.jsp").forward(request, response);
			}else if("reply".equals(info)) {
				request.getRequestDispatcher("views/question/q_reply.jsp").forward(request, response);
			}
		}else {// 에러페이지
			String msg = "로그인을 해주세요.";
			session.setAttribute("msg", msg);
			request.getRequestDispatcher("/q_list.qu").forward(request, response);;
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
