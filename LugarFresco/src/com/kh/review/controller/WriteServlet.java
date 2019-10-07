package com.kh.review.controller;

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

import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.vo.Member;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.ReviewImg;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/write.re")
public class WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WriteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Member mem = (Member) session.getAttribute("loginUser");

		if (ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 10 * 1024 * 1024;

			String root = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = root + "/fileupload/review/";

			// 2_1. HttpServletRequest -> MultipartRequest 변경
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			ArrayList<String> originFiles = new ArrayList<>(); // 원본명들만 담길 list
			ArrayList<String> changeFiles = new ArrayList<>(); // 수정명들만 담길 list

			// getFileName() - 폼에서 전송된 파일 리스트들의 name값들을 반환
			Enumeration<String> files = multiRequest.getFileNames(); // 전송 순서 역순으로 쌓임

			while (files.hasMoreElements()) {
				String name = files.nextElement();

				// 파일이 존재할 경우
				if (multiRequest.getFilesystemName(name) != null) {

					// 원본명 : getOriginalFileName() - 실제 사용자가 업로드 할 때의 파일명
					String originName = multiRequest.getOriginalFileName(name);
					// 수정명 : getFilesystemName() - rename된 파일명(즉, 서버에 업로드된 파일명)
					String changeName = multiRequest.getFilesystemName(name);

					originFiles.add(originName);
					changeFiles.add(changeName);
				}
			}

			// 3_1. Board 테이블에 insert할 내용 뽑아서 Board객체 생성
			int m_no = ((Member) request.getSession().getAttribute("loginUser")).getM_no();
			int c_no = Integer.parseInt(multiRequest.getParameter("c_no"));
			int flavor = Integer.parseInt(multiRequest.getParameter("flavor"));
			int price = Integer.parseInt(multiRequest.getParameter("price"));
			int service = Integer.parseInt(multiRequest.getParameter("service"));
			String content = multiRequest.getParameter("content");
			

			Review r = new Review();
			r.setM_no(m_no);
			r.setC_no(c_no);
			r.setFlavor(flavor);
			r.setPrice(price);
			r.setService(service);
			r.setSum_avg((flavor+price+service)/3);
			r.setR_content(content);

			ArrayList<ReviewImg> list = new ArrayList<>();
			
			// 전송 역순으로 changeFiles, originFiles에 저장되어있기 때문에 반복문을 역으로 수행함
			for (int i = originFiles.size() - 1; i >= 0; i--) {

				ReviewImg ri = new ReviewImg();
				ri.setImg_name(changeFiles.get(i));
				ri.setImg_path(savePath);

				list.add(ri);

			}

			// 4. 서비스 요청
			int result = new ReviewService().insertReview(r, list);

			if (result > 0) {
				
				//해당 c_no를 session에 저장하고 cafeInfo로 보낼까??
				response.sendRedirect("cafeList.ca");
				
			} else {
				
				for (int i = 0; i < changeFiles.size(); i++) {

					File failedFile = new File(savePath + changeFiles.get(i));
					failedFile.delete();
				}

				request.setAttribute("msg", "리뷰 등록 실패!!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
