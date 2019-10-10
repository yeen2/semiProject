package com.kh.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.PowerLink.model.vo.PowerLink;
import com.kh.admin.model.service.AdminPageService;


@WebServlet("/powerCk2.ap")
public class AdminPage_powerCk2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminPage_powerCk2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ck = Integer.parseInt(request.getParameter("radio"));
		int no = Integer.parseInt(request.getParameter("Mno"));
		
		int result = new AdminPageService().powerLinkStatusChange(ck,no);
 		
		System.out.println("==================================================================");
		System.out.println(result);
		System.out.println("==================================================================");
		
		if(result > 0) {

			response.getWriter().print("success");
//			ArrayList<PowerLink> list = new AdminPageService().selectPowerLinkStatus(no);
//				
//			response.setContentType("application/json; charset=UTF-8");
//
//			Gson gson = new Gson();
//
//			gson.toJson(list, response.getWriter());
//		
		}
		
		
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
