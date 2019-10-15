package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.PowerLink.model.vo.PowerLink;
import com.kh.admin.model.service.AdminPageService;
import com.kh.admin.model.vo.PageInfo;
import com.kh.cafe.model.vo.Cafe;


@WebServlet("/cafeApplyList.ap")
public class AdminPage_cafeApplyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdminPage_cafeApplyListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("UTF-8");
			
			if (request.getParameter("kinds") != null && request.getParameter("search") != null) {

			int listCount = new AdminPageService().getCafeApplyCount();
			
			// currentPage : 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
			int currentPage = 1; // 占썩본占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 1占쏙옙占쏙옙 占쏙옙占쏙옙占싹깍옙 占쏙옙占쏙옙占쏙옙.

			if (request.getParameter("currentPage") != null) {

				currentPage = Integer.parseInt(request.getParameter("currentPage"));

			}
			// -------------------占쏙옙占쏙옙징 처占쏙옙 占쌩곤옙---------------------
			int pageLimit; // 占쏙옙 占쏙옙占쏙옙占쏙옙 占싹단울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙
			int boardLimit; // 占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌉시깍옙 占쌍댐옙 占쏙옙
			int maxPage; // 占쏙옙체 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 --> listCount, boardLimit占쏙옙 占쏙옙占쏙옙 占싯아놂옙 占쏙옙
			int startPage; // 占쏙옙 占쏙옙占쏙옙占쏙옙 占싹단울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 --> currentPage, pageLimit占쏙옙 占쏙옙占쏙옙 占싯아놂옙 占쏙옙
			int endPage; // 占쏙옙 占쏙옙占쏙옙占쏙옙 占싹단울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 --> startPage占쏙옙 占쏙옙占쏙옙 占싯아놂옙 占쏙옙

			pageLimit = 10; // 占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 10占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙
			boardLimit = 10;

			// *maxPage : 占쏙옙체 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
			// ex) 占쏙옙 占쏙옙占쏙옙 : 123占쏙옙 --> maxPage 12占쏙옙占쏙옙占쏙옙x 13占쏙옙占쏙옙占쏙옙o

			// ex) boardLimit = 10
			// 100.0 / 10 = 10 => 10占쏙옙占쏙옙占쏙옙
			// 101.0 / 10 = 10.1 => 11占쏙옙占쏙옙占쏙옙
			// 105.0 / 10 = 10.5 => 11占쏙옙占쏙옙占쏙옙
			// 109.0 / 10 = 10.9 => 11占쏙옙占쏙옙占쏙옙

			maxPage = (int) Math.ceil((double) listCount / boardLimit);

			// * startPage : 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占싹단울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙
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

			// * endPage : 占쏙옙 占쏙옙占쏙옙占쏙옙 占싹단울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
			// 10, 20, 30 . . .
			endPage = startPage + pageLimit - 1;
			// ex) maxPage = 13, emdPage = 20 ==> xxxxxxx

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			// 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占� PageInfo

			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);

			String kinds = request.getParameter("kinds");
			
			ArrayList<Cafe> list = null;
			
			if (kinds.equals("applicantName")) {

				String search = request.getParameter("search");

				list = new AdminPageService().selectCafeApplyApplicantNameSearch(search);

			} else {
				
				String search = request.getParameter("search");

				list = new AdminPageService().selectCafeApplyCafeNameSearch(search);
			}
			
			
			if(list.isEmpty()) {
				String hidden = "hidden";   
				request.setAttribute("buttonhidden", hidden);
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				request.setAttribute("msg", "조회하신 내용은 존재하지 않습니다");
				
				request.getRequestDispatcher("views/admin/adminPage_cafeApplyList.jsp").forward(request, response);
			
			}else {
				String hidden = "hidden";
				request.setAttribute("buttonhidden", hidden);
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
			
				request.getRequestDispatcher("views/admin/adminPage_cafeApplyList.jsp").forward(request, response);

			}
			
			//------------------------------------------占쏙옙占쏙옙트 占쌀뤄옙占시띰옙------------------------------------------
		
		} else {

			int listCount = new AdminPageService().getCafeApplyCount();

			// currentPage : 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
			int currentPage = 1; // 占썩본占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 1占쏙옙占쏙옙 占쏙옙占쏙옙占싹깍옙 占쏙옙占쏙옙占쏙옙.

			if (request.getParameter("currentPage") != null) {

				currentPage = Integer.parseInt(request.getParameter("currentPage"));

			}
			// -------------------占쏙옙占쏙옙징 처占쏙옙 占쌩곤옙---------------------
			int pageLimit; // 占쏙옙 占쏙옙占쏙옙占쏙옙 占싹단울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙
			int boardLimit; // 占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌉시깍옙 占쌍댐옙 占쏙옙
			int maxPage; // 占쏙옙체 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 --> listCount, boardLimit占쏙옙 占쏙옙占쏙옙 占싯아놂옙 占쏙옙
			int startPage; // 占쏙옙 占쏙옙占쏙옙占쏙옙 占싹단울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 --> currentPage, pageLimit占쏙옙 占쏙옙占쏙옙 占싯아놂옙 占쏙옙
			int endPage; // 占쏙옙 占쏙옙占쏙옙占쏙옙 占싹단울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 --> startPage占쏙옙 占쏙옙占쏙옙 占싯아놂옙 占쏙옙

			pageLimit = 10; // 占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 10占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙
			boardLimit = 10;

			// *maxPage : 占쏙옙체 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
			// ex) 占쏙옙 占쏙옙占쏙옙 : 123占쏙옙 --> maxPage 12占쏙옙占쏙옙占쏙옙x 13占쏙옙占쏙옙占쏙옙o

			// ex) boardLimit = 10
			// 100.0 / 10 = 10 => 10占쏙옙占쏙옙占쏙옙
			// 101.0 / 10 = 10.1 => 11占쏙옙占쏙옙占쏙옙
			// 105.0 / 10 = 10.5 => 11占쏙옙占쏙옙占쏙옙
			// 109.0 / 10 = 10.9 => 11占쏙옙占쏙옙占쏙옙

			maxPage = (int) Math.ceil((double) listCount / boardLimit);

			// * startPage : 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占싹단울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙
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

			// * endPage : 占쏙옙 占쏙옙占쏙옙占쏙옙 占싹단울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
			// 10, 20, 30 . . .
			endPage = startPage + pageLimit - 1;
			// ex) maxPage = 13, emdPage = 20 ==> xxxxxxx

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			// 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占� PageInfo
			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);

			ArrayList<Cafe> list = new AdminPageService().selectCafeApplyList(pi);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			

			request.getRequestDispatcher("views/admin/adminPage_cafeApplyList.jsp").forward(request, response);
			
			
		}	

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
