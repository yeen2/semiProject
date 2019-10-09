package com.kh.owner.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cafe.model.vo.Cafe;
import com.kh.member.model.service.MyPageService;
import com.kh.member.model.vo.Member;


@WebServlet("/myCafeList.op")
public class OwnerPage_myCafeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public OwnerPage_myCafeListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		if(loginUser != null) {
			int mno = loginUser.getM_no();
			
			ArrayList<Cafe> list = new MyPageService().ownerCafeList(mno);
			
			if(list != null) {
				request.setAttribute("list", list);
				request.getRequestDispatcher("views/owner/ownerPage_myCafeList.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "내 카페 리스트 조회에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
			}
			
		}else {
			request.getRequestDispatcher("views/common/loginForm.jsp").forward(request, response);
			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
