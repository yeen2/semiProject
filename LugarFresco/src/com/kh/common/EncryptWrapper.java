package com.kh.common;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {
	
	// 상속받는 부모타입에는 기본생성자가 없기 때문에
	// 반드시 명시적으로 HttpServletRequest 를 매개변수로 하는 생성자를 작성해야됨!!

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String key) {
		String value = "";
		
		if(key != null && (key.equals("userPwd") || key.equals("newPwd"))) {
			// request에 담긴 key값이 userPwd인 경우 해당 그 value 암호화처리
			String userPwd = super.getParameter(key);
			
			
			// SHA-512 방식의 암호화 객체
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-512");
				
				// 기존의 비밀번호를 바이트 배열로 받아주기
				byte[] bytes = userPwd.getBytes(Charset.forName("UTF-8"));
				
				// md 객체에 해당 바이트 배열을 전달해서 갱신
				md.update(bytes);
				
				value=Base64.getEncoder().encodeToString(md.digest());
			
			} catch (NoSuchAlgorithmException e) {
				
				e.printStackTrace();
			}
			
			
			
		}else {
			// 그 외인 경우 기존의 값
			value = super.getParameter(key);
		}
		
		return value;
	}

}
