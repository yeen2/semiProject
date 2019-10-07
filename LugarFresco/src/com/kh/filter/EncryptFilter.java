package com.kh.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.kh.common.EncryptWrapper;


/**
 * Servlet Filter implementation class EncryptFilter
 */
@WebFilter(filterName="encrypt", 
		   servletNames= {"InsertMemberServlet","LoginServlet", "UpdatePwdServlet"})
public class EncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncryptFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// 래퍼 : 필터에 넘어온 request, response를 변경할 때 사용되는 개념
		//		 request, response를 특정한 형태로 감싸서 변형 시키는 애
		
		// 전달받아온 request --> 암호화 래퍼로 감싼채로 생성
		EncryptWrapper encRequest = new EncryptWrapper((HttpServletRequest)request);
		
		// 변형된 encRequest를 서블릿으로 보냄
		chain.doFilter(encRequest, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
