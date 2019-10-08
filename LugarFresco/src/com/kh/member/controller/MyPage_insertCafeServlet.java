package com.kh.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.cafe.model.vo.Cafe;
import com.kh.cafe.model.vo.CafeImg;
import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.service.MyPageService;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MyPage_insertCafeServlet
 */
@WebServlet("/insertCafe.mp")
public class MyPage_insertCafeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPage_insertCafeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			
			String root = request.getSession().getServletContext().getRealPath("/resources");
			
			String savePath = root + "/fileupload/cafe/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> originFiles = new ArrayList<>(); // 원본명들만 담길 list
			ArrayList<String> changeFiles = new ArrayList<>(); // 수정명들만 담길 list
			
			Enumeration<String> files = multiRequest.getFileNames(); // 전송 순서 역순대로 쌓임
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					
					// 원본명 : getOriginalFileName() -> 실제 사용자가 업로드할 때 의 파일명
					String originName = multiRequest.getOriginalFileName(name);
					// 수정명 : getFilesystemName() -> rename된 파일명(즉, 서버에 업로드된 파일명)
					String changeName = multiRequest.getFilesystemName(name);
					
					originFiles.add(originName);
					changeFiles.add(changeName);
					
				}
			}
			
			HttpSession session = request.getSession();
			Member loginUser = (Member)session.getAttribute("loginUser");
			
			int mno = loginUser.getM_no();
			
			String cafeName = multiRequest.getParameter("cafeName");
			String address = multiRequest.getParameter("content1") + multiRequest.getParameter("content2") + multiRequest.getParameter("content4");
			String addressDetail = multiRequest.getParameter("content3");
			String phone = multiRequest.getParameter("cafeTel");
			String content = multiRequest.getParameter("cafeInfo");
			String brName = "";
			String brUpName = "";
			
			Cafe c = new Cafe();
			ArrayList<CafeImg> list = new ArrayList<>();
			
			for(int i=originFiles.size()-1; i>=1; i--) {
				
				CafeImg ci = new CafeImg();
				
				ci.setImg_name(changeFiles.get(i));
				ci.setImg_path(savePath);
				
				brName = originFiles.get(0);
				brUpName = changeFiles.get(0);
			
				if(i == originFiles.size()-1) {
					ci.setImg_level(1);
				}else {
					ci.setImg_level(2);
				}
				
				list.add(ci);
				
			}
			
			c.setM_no(mno);
			c.setCafe_name(cafeName);
			c.setAddress(address);
			c.setAddress_detail(addressDetail);
			c.setPhone(phone);
			c.setContent(content);
			c.setBr_name(brName);
			c.setBr_up_name(brUpName);
			c.setBr_path(savePath);
			
			System.out.println(list);
			System.out.println(c);
			int result = new MyPageService().insertCafe(c, list);
			
			if(result > 0) {
				
				response.sendRedirect("applyCafeForm.mp");
				
			}else {
				
				for(int i=0; i<changeFiles.size(); i++) {
					File failedFile = new File(savePath + changeFiles.get(i));
					failedFile.delete();
				}
				
				request.setAttribute("msg", "사진 게시판 등록 실패~~!!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
			}
			
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
