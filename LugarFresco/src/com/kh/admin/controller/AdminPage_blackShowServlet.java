package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminPageService;
import com.kh.admin.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AdminPage_blackShowServlet
 */
@WebServlet("/blackShow.ap")
public class AdminPage_blackShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPage_blackShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount = new AdminPageService().getBlackListCount();

		// currentPage : �쁽�옱 �럹�씠吏�
		int currentPage = 1; // 湲곕낯�쟻�쑝濡� �럹�씠吏��뒗 1遺��꽣 �떆�옉�븯湲� �븣臾몄뿉.

		if (request.getParameter("currentPage") != null) {

			currentPage = Integer.parseInt(request.getParameter("currentPage"));

		}
		// -------------------�럹�씠吏� 泥섎━ 異붽�---------------------
		int pageLimit; // �븳 �럹�씠吏� �븯�떒�뿉 蹂댁뿬吏� �럹�씠吏� �닔
		int boardLimit; // �븳 �럹�씠吏��뿉 蹂댁뿬吏� 寃뚯떆湲� 理쒕� �닔
		int maxPage; // �쟾泥� �럹�씠吏��뿉�꽌 �젣�씪 留덉�留� �럹�씠吏��닔 --> listCount, boardLimit�쓣 �넻�빐 �븣�븘�궪 寃�
		int startPage; // �븳 �럹�씠吏� �븯�떒�뿉 蹂댁뿬吏� �떆�옉 �럹�씠吏� --> currentPage, pageLimit�쓣 �넻�빐 �븣�븘�궪 寃�
		int endPage; // �븳 �럹�씠吏� �븯�떒�뿉 蹂댁뿬吏� 留덉�留� �럹�씠吏� --> startPage瑜� �넻�빐 �븣�븘�궪 寃�

		pageLimit = 10; // �븳 �럹�씠吏��뿉 10媛쒖뵫 蹂댁뿬吏�寃�
		boardLimit = 10;

		// *maxPage : �쟾泥� �럹�씠吏��뿉�꽌 �젣�씪 留덉�留� �럹�씠吏�
		// ex) 珥� 媛��닔 : 123媛� --> maxPage 12�럹�씠吏�x 13�럹�씠吏�o

		// ex) boardLimit = 10
		// 100.0 / 10 = 10 => 10�럹�씠吏�
		// 101.0 / 10 = 10.1 => 11�럹�씠吏�
		// 105.0 / 10 = 10.5 => 11�럹�씠吏�
		// 109.0 / 10 = 10.9 => 11�럹�씠吏�

		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		// * startPage : �쁽�옱 �럹�씠吏� �븯�떒�뿉 蹂댁뿬吏� �럹�씠吏��쓽 �떆�옉 �닔
		// ex) pageLimit : 10
		// 1, 11, 21 . . . => n * 10 + 1
		// currentPage = 1 => 0 * 10 + 1 =>1
		// currentPage = 5 => 0 * 10 + 1 => 1
		// currentPage = 10 => 0 * 10 + 1 => 1
		// currentPage = 11 => 1 * 10 + 1 => 11
		// currentPage = 15 => 1 * 10 + 1 => 11
		// currentPage = 20 => 1 * 10 + 1 => 11

		// currentPage = 1~10 => n = 0 => (currentPage-1)/10
		// currentPage = 11~20 => n = 1

		startPage = (currentPage - 1) / pageLimit * 10 + 1;

		// * endPage : �븳 �럹�씠吏� �븯�떒�뿉 蹂댁뿬吏� 留덉�留� �럹�씠吏�
		// 10, 20, 30 . . .
		endPage = startPage + pageLimit - 1;
		// ex) maxPage = 13, emdPage = 20 ==> xxxxxxx

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// �럹�씠吏� �젙蹂대�� �떞�뒗 PageInfo

		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);

		ArrayList<Member> list = new AdminPageService().selectBlackList(pi);
//		ArrayList<Cafe> list2 = new AdminPageService().CafeImgWriteCount(pi);
	
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
//		request.setAttribute("list2", list2);
		request.getRequestDispatcher("views/admin/adminPage_blackShow.jsp").forward(request, response);
	

}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
