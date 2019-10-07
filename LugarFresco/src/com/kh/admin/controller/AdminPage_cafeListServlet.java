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
import com.kh.cafe.model.vo.Cafe;

@WebServlet("/cafeList.ap")
public class AdminPage_cafeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminPage_cafeListServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//검색기능 사용할때
		
		if (request.getParameter("kinds") != null && request.getParameter("search") != null) {

			int listCount = new AdminPageService().getListCount();

			
			// currentPage : 현재 페이지
			int currentPage = 1; // 기본적으로 페이지는 1부터 시작하기 때문에.

			if (request.getParameter("currentPage") != null) {

				currentPage = Integer.parseInt(request.getParameter("currentPage"));

			}
			// -------------------페이징 처리 추가---------------------
			int pageLimit; // 한 페이지 하단에 보여질 페이지 수
			int boardLimit; // 한 페이지에 보여질 게시글 최대 수
			int maxPage; // 전체 페이지에서 제일 마지막 페이지수 --> listCount, boardLimit을 통해 알아낼 것
			int startPage; // 한 페이지 하단에 보여질 시작 페이지 --> currentPage, pageLimit을 통해 알아낼 것
			int endPage; // 한 페이지 하단에 보여질 마지막 페이지 --> startPage를 통해 알아낼 것

			pageLimit = 10; // 한 페이지에 10개씩 보여지게
			boardLimit = 10;

			// *maxPage : 전체 페이지에서 제일 마지막 페이지
			// ex) 총 갯수 : 123개 --> maxPage 12페이지x 13페이지o

			// ex) boardLimit = 10
			// 100.0 / 10 = 10 => 10페이지
			// 101.0 / 10 = 10.1 => 11페이지
			// 105.0 / 10 = 10.5 => 11페이지
			// 109.0 / 10 = 10.9 => 11페이지

			maxPage = (int) Math.ceil((double) listCount / boardLimit);

			// * startPage : 현재 페이지 하단에 보여질 페이지의 시작 수
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

			// * endPage : 한 페이지 하단에 보여질 마지막 페이지
			// 10, 20, 30 . . .
			endPage = startPage + pageLimit - 1;
			// ex) maxPage = 13, emdPage = 20 ==> xxxxxxx

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			// 페이지 정보를 담는 PageInfo

			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			System.out.println(pi);

			String kinds = request.getParameter("kinds");
			
			ArrayList<Cafe> list = null;
			
			if (kinds.equals("cafeName")) {

				String search = request.getParameter("search");

				list = new AdminPageService().selectCafeNameSearch(search);

			} else {
				
				String search = request.getParameter("search");

				list = new AdminPageService().selectApplicantNameSearch(search);
			}
			
			
			if(list.isEmpty()) {
				String hidden = "hidden";   
				request.setAttribute("buttonhidden", hidden);
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				request.setAttribute("msg", "검색 내용은 카페리스트에 존재하지 않습니다.");
				
				request.getRequestDispatcher("views/admin/adminPage_cafeList.jsp").forward(request, response);
			
			}else {
				String hidden = "hidden";
				request.setAttribute("buttonhidden", hidden);
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				System.out.println(
						"===================================================================================================================================");

				request.getRequestDispatcher("views/admin/adminPage_cafeList.jsp").forward(request, response);

			}
			
			//------------------------------------------리스트 불러올때------------------------------------------
		
		} else {

			int listCount = new AdminPageService().getListCount();

			// currentPage : 현재 페이지
			int currentPage = 1; // 기본적으로 페이지는 1부터 시작하기 때문에.

			if (request.getParameter("currentPage") != null) {

				currentPage = Integer.parseInt(request.getParameter("currentPage"));

			}
			// -------------------페이징 처리 추가---------------------
			int pageLimit; // 한 페이지 하단에 보여질 페이지 수
			int boardLimit; // 한 페이지에 보여질 게시글 최대 수
			int maxPage; // 전체 페이지에서 제일 마지막 페이지수 --> listCount, boardLimit을 통해 알아낼 것
			int startPage; // 한 페이지 하단에 보여질 시작 페이지 --> currentPage, pageLimit을 통해 알아낼 것
			int endPage; // 한 페이지 하단에 보여질 마지막 페이지 --> startPage를 통해 알아낼 것

			pageLimit = 10; // 한 페이지에 10개씩 보여지게
			boardLimit = 10;

			// *maxPage : 전체 페이지에서 제일 마지막 페이지
			// ex) 총 갯수 : 123개 --> maxPage 12페이지x 13페이지o

			// ex) boardLimit = 10
			// 100.0 / 10 = 10 => 10페이지
			// 101.0 / 10 = 10.1 => 11페이지
			// 105.0 / 10 = 10.5 => 11페이지
			// 109.0 / 10 = 10.9 => 11페이지

			maxPage = (int) Math.ceil((double) listCount / boardLimit);

			// * startPage : 현재 페이지 하단에 보여질 페이지의 시작 수
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

			// * endPage : 한 페이지 하단에 보여질 마지막 페이지
			// 10, 20, 30 . . .
			endPage = startPage + pageLimit - 1;
			// ex) maxPage = 13, emdPage = 20 ==> xxxxxxx

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			// 페이지 정보를 담는 PageInfo

			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			System.out.println(pi);

			ArrayList<Cafe> list = new AdminPageService().selectCafeList(pi);
//			ArrayList<Cafe> list2 = new AdminPageService().CafeImgWriteCount(pi);
		
			
			System.out.println("hhhhhhhhhhhㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
//			request.setAttribute("list2", list2);
			request.getRequestDispatcher("views/admin/adminPage_cafeList.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
