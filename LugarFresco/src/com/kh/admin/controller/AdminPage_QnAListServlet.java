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
import com.kh.question.model.vo.QnAList;


@WebServlet("/qnaList.ap")
public class AdminPage_QnAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdminPage_QnAListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if (request.getParameter("kinds") != null && request.getParameter("search") != null) {

			int listCount = new AdminPageService().getPowerLinkCount();

			System.out.println(listCount);
			
			// currentPage : ���� ������
			int currentPage = 1; // �⺻������ �������� 1���� �����ϱ� ������.

			if (request.getParameter("currentPage") != null) {

				currentPage = Integer.parseInt(request.getParameter("currentPage"));

			}
			// -------------------����¡ ó�� �߰�---------------------
			int pageLimit; // �� ������ �ϴܿ� ������ ������ ��
			int boardLimit; // �� �������� ������ �Խñ� �ִ� ��
			int maxPage; // ��ü ���������� ���� ������ �������� --> listCount, boardLimit�� ���� �˾Ƴ� ��
			int startPage; // �� ������ �ϴܿ� ������ ���� ������ --> currentPage, pageLimit�� ���� �˾Ƴ� ��
			int endPage; // �� ������ �ϴܿ� ������ ������ ������ --> startPage�� ���� �˾Ƴ� ��

			pageLimit = 10; // �� �������� 10���� ��������
			boardLimit = 10;

			// *maxPage : ��ü ���������� ���� ������ ������
			// ex) �� ���� : 123�� --> maxPage 12������x 13������o

			// ex) boardLimit = 10
			// 100.0 / 10 = 10 => 10������
			// 101.0 / 10 = 10.1 => 11������
			// 105.0 / 10 = 10.5 => 11������
			// 109.0 / 10 = 10.9 => 11������

			maxPage = (int) Math.ceil((double) listCount / boardLimit);

			// * startPage : ���� ������ �ϴܿ� ������ �������� ���� ��
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

			// * endPage : �� ������ �ϴܿ� ������ ������ ������
			// 10, 20, 30 . . .
			endPage = startPage + pageLimit - 1;
			// ex) maxPage = 13, emdPage = 20 ==> xxxxxxx

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			// ������ ������ ��� PageInfo

			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			System.out.println(pi);

			String kinds = request.getParameter("kinds");
			
			ArrayList<QnAList> list = null;
			
			if (kinds.equals("applicantName")) {

				String search = request.getParameter("search");

				list = new AdminPageService().selectQnaApplicantNameSearch(search);

			} else {
				
				String search = request.getParameter("search");

				list = new AdminPageService().selectQnaTitleSearch(search);
			}
			
			
			if(list.isEmpty()) {
				String hidden = "hidden";   
				request.setAttribute("buttonhidden", hidden);
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
			//	int result = new AdminPageService().PowerLinkCount();
			//	request.setAttribute("result", result);

				request.setAttribute("msg", "검색 내용은 QnA리스트에 존재하지 않습니다.");
				
				request.getRequestDispatcher("views/admin/adminPage_QnAList.jsp").forward(request, response);
			
			}else {
				String hidden = "hidden";
				request.setAttribute("buttonhidden", hidden);
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
			//	int result = new AdminPageService().PowerLinkCount();
			//	request.setAttribute("result", result);

				System.out.println(
						"===================================================================================================================================");

				request.getRequestDispatcher("views/admin/adminPage_QnAList.jsp").forward(request, response);

			}
			
			//------------------------------------------����Ʈ �ҷ��ö�------------------------------------------
		
		} else {

			int listCount = new AdminPageService().getPowerLinkCount();

			// currentPage : ���� ������
			int currentPage = 1; // �⺻������ �������� 1���� �����ϱ� ������.

			if (request.getParameter("currentPage") != null) {

				currentPage = Integer.parseInt(request.getParameter("currentPage"));

			}
			// -------------------����¡ ó�� �߰�---------------------
			int pageLimit; // �� ������ �ϴܿ� ������ ������ ��
			int boardLimit; // �� �������� ������ �Խñ� �ִ� ��
			int maxPage; // ��ü ���������� ���� ������ �������� --> listCount, boardLimit�� ���� �˾Ƴ� ��
			int startPage; // �� ������ �ϴܿ� ������ ���� ������ --> currentPage, pageLimit�� ���� �˾Ƴ� ��
			int endPage; // �� ������ �ϴܿ� ������ ������ ������ --> startPage�� ���� �˾Ƴ� ��

			pageLimit = 10; // �� �������� 10���� ��������
			boardLimit = 10;

			// *maxPage : ��ü ���������� ���� ������ ������
			// ex) �� ���� : 123�� --> maxPage 12������x 13������o

			// ex) boardLimit = 10
			// 100.0 / 10 = 10 => 10������
			// 101.0 / 10 = 10.1 => 11������
			// 105.0 / 10 = 10.5 => 11������
			// 109.0 / 10 = 10.9 => 11������

			maxPage = (int) Math.ceil((double) listCount / boardLimit);

			// * startPage : ���� ������ �ϴܿ� ������ �������� ���� ��
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

			// * endPage : �� ������ �ϴܿ� ������ ������ ������
			// 10, 20, 30 . . .
			endPage = startPage + pageLimit - 1;
			// ex) maxPage = 13, emdPage = 20 ==> xxxxxxx

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			// ������ ������ ��� PageInfo
			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			
			System.out.println(pi);

			ArrayList<QnAList> list = new AdminPageService().selectQnAList(pi);

			System.out.println("test");
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			

			request.getRequestDispatcher("views/admin/adminPage_QnAList.jsp").forward(request, response);
			
			
		}	

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
