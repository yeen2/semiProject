package com.kh.member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

@WebServlet("/searchPass.me")
public class SearchPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SearchPassServlet() {
        super();
 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 사용자가 입력한 이메일
		String email = request.getParameter("email");
		String nickName = request.getParameter("nickName");
		
		// 해당 이메일의 pass를 난수발생한 값으로 변경하고
		String randomPass = getRamdomPassword(10);
		
		System.out.println("랜덤비번 : " + randomPass);
		
		Member m = new Member(email, nickName, randomPass);
		// 비밃번호 바꿔주기
		int result = new MemberService().updateRandomPass(m);
		
		String mailProtocol = "smtp";
		String mailHost = "smtp.naver.com";
		String mailPort = "587";
		String mailId = "jang_test@naver.com"; 
		String mailPassword = "3288aall!"; 

		String fromName = "Lugar Fresco";
		String fromEmail = "jang_test@naver.com"; // 보내는 사람 메일
		String toName = nickName;  // 받는 사람 이름
		String toEmail = email; // 받는사람메일

		String mailTitle = nickName + "님, [Lugar Fresco] 에서 임시 비밀번호를 발급해드립니다. ";
		String mailContents = nickName + "님의 임시 비밀번호는 " + randomPass + "입니다. 로그인 하신후, 비밀번호 변경 부탁드립니다~";
		String debugMode = "false";
		String authMode = "true";

		if(result > 0) { // 임시비밀번호로 변경 성공시
				
			try {
				
				// 임시비밀번호 이메일로 전송해주기
				boolean debug = Boolean.valueOf(debugMode).booleanValue();
				Properties mailProps = new Properties();
				mailProps.put("mail.smtp.starttls.enable", "true");
				mailProps.setProperty("mail.transport.protocol", mailProtocol);
				mailProps.put("mail.debug", debugMode);
				mailProps.put("mail.smtp.host", mailHost);
				mailProps.put("mail.smtp.port", mailPort);
				mailProps.put("mail.smtp.connectiontimeout", "5000");
				mailProps.put("mail.smtp.timeout", "5000");
				mailProps.put("mail.smtp.auth", authMode);
				Session msgSession = null;

				if (authMode.equals("true")) {
					Authenticator auth = new MyAuthentication(mailId, mailPassword);
					msgSession = Session.getInstance(mailProps, auth);
				} else {
					msgSession = Session.getInstance(mailProps, null);
				}

				msgSession.setDebug(debug);
				MimeMessage msg = new MimeMessage(msgSession);
				msg.setFrom(new InternetAddress(fromEmail, fromName));
				msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail, toName));
				msg.setSubject(mailTitle);
				msg.setContent(mailContents, "text/html; charset=euc-kr");

				// 스태틱함수로 직접 보내지 않고 객체를 이용해서 보내고 객체를 닫아준다.
				Transport t = msgSession.getTransport(mailProtocol);

				try {
					t.connect();
					t.sendMessage(msg, msg.getAllRecipients());
					
					HttpSession session = request.getSession();
					session.setAttribute("msg", "입력하신 이메일로 임시비밀번호를 전송해드렸습니다.");
					response.sendRedirect(request.getContextPath()+"/loginForm.me");

				} finally {
					t.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else { // 해당정보가 없으면
			
			HttpSession session = request.getSession();
			session.setAttribute("msg", "입력하신 정보가 없습니다.");
			response.sendRedirect(request.getContextPath()+"/loginForm.me");
		}
		

	}// end
	
	
	
	class MyAuthentication extends Authenticator {

		PasswordAuthentication pa;
		
		public MyAuthentication(String mailId, String mailPass) {

			pa = new PasswordAuthentication(mailId, mailPass);
		}

		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	}
	
	
	// 비밀번호 난수발생 메소드
	public static String getRamdomPassword(int len) {
		
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		
		//System.out.println("charSet.length :::: " + charSet.length);
		for (int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거) System.out.println("idx ::::
															// "+idx);
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}
	



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
