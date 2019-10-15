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

import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.service.MyPageService;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MyPage_myUpdateMemberServlet
 */
@WebServlet("/updateMember.mp")
public class MyPage_myUpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPage_myUpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			if(ServletFileUpload.isMultipartContent(request)) {
				
				int maxSize = 10*1024*1024;
				
				String root = request.getSession().getServletContext().getRealPath("/resources");
				
				String savePath = root + "/fileupload/profile/";
				
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
				
				
				int mno = loginUser.getM_no();
				String email = multiRequest.getParameter("email");
				String nickName = multiRequest.getParameter("nickName");
				String profile = "";
				
				Member m = new Member();
				
				m.setM_no(mno);
				m.setEmail(email);
				m.setNickName(nickName);
				
				for(int i=originFiles.size(); i>=0; i--) {
					try {
						profile = changeFiles.get(0);
					} catch(IndexOutOfBoundsException e){
						
					}
				
				}
				m.setProfile(profile);
				m.setProfile_path(savePath);
				
				Member updateMem = null;
				
				if(profile.length() != 0) {
					updateMem = new MyPageService().updateMember(m);
				}else {
					updateMem = new MyPageService().updateMemberNick(m);
				}
				
				
				if(updateMem != null) {
					session.setAttribute("loginUser", updateMem);
					session.setAttribute("msg", "성공적으로 회원정보가 수정되었습니다.");
					
					response.sendRedirect("myUpdateForm.mp");
					
				}else {
					for(int i=0; i<changeFiles.size(); i++) {
						File failedFile = new File(savePath + changeFiles.get(i));
						failedFile.delete();
					}
					
					request.setAttribute("msg", "회원정보 수정에 실패하였습니다.");
					
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
				
			}
			
		}else {
			request.getRequestDispatcher("views/common/loginForm.jsp").forward(request, response);
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
