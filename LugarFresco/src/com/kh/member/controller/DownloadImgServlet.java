package com.kh.member.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cafe.model.vo.Cafe;
import com.kh.member.model.service.MyPageService;

/**
 * Servlet implementation class DownloadImgServlet
 */
@WebServlet("/download.mp")
public class DownloadImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadImgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		Cafe file = new MyPageService().selectBrImgSelect(cno);
		System.out.println(file);
		String root = request.getSession().getServletContext().getRealPath("/resources");
		
		String filePath = root + "/fileupload/reg/";
		
		// 다운로드 하고자 하는 파일 객체 생성
		File downFile = new File(filePath + file.getBr_up_name());
		
		// 클라이언트에 보여질 원본명
		String originName = new String(file.getBr_name().getBytes("UTF-8"), "ISO-8859-1");
		
		// 클라이언트쪽으로 전달할 설정들 response header 영역에 처리
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originName + "\"");
		
		// 전송할 크기만큼 사용자 컴퓨터에 공간 확보 요청하기
		response.setContentLength((int)downFile.length());
		
		
		// 클라이언트로 내보낼 출력 스트림 생성
		ServletOutputStream downOut = response.getOutputStream();
		
		// 폴더에서 파일을 읽을 입력 스트림 생성
		BufferedInputStream buf = new BufferedInputStream(new FileInputStream(downFile));
		
		int readBytes = 0;
		while((readBytes = buf.read()) != -1) { // 폴더에서 파일의 일정 단위를 입력받아옴
			downOut.write(readBytes); // 입력받아온 걸 클라이언트에 바로 출력
		}
		
		downOut.close();
		buf.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
