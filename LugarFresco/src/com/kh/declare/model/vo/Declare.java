package com.kh.declare.model.vo;

import java.sql.Date;

public class Declare {

	private int d_no;
	private int r_no;
	private int m_no;
	private String category;
	private String content;
	private Date reg_date;
	
	
	//신고자, 신고갯수, 내용, 후기내용
	private String nickname;
	private int declare_count;
	private String review_content;
	private String profile;
	private String profile_path;
	
	public Declare() {
		
	}
	
	//search 용 
	

	@Override
	public String toString() {
		return "Declare [d_no=" + d_no + ", r_no=" + r_no + ", m_no=" + m_no + ", category=" + category + ", content="
				+ content + ", reg_date=" + reg_date + ", nickname=" + nickname + ", declare_count=" + declare_count
				+ ", review_content=" + review_content + ", profile=" + profile + ", profile_path=" + profile_path
				+ "]";
	}




	public Declare(int d_no, String review_content, String content, String nickname, Date reg_date ) {
		super();
		this.d_no = d_no;
		this.review_content = review_content;
		this.content = content;
		this.nickname = nickname;
		this.reg_date = reg_date;
	}

	public String getProfile() {
		return profile;
	}







	public void setProfile(String profile) {
		this.profile = profile;
	}







	public String getProfile_path() {
		return profile_path;
	}







	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}







	public Declare(int d_no, int r_no, int m_no, String nickname, String category, String content, Date reg_date, 
			String review_content,int declare_count, String profile, String profile_path ) {
		super();
		this.d_no = d_no;
		this.r_no = r_no;
		this.m_no = m_no;
		this.nickname = nickname;
		this.category = category;
		this.content = content;
		this.reg_date = reg_date;
		this.review_content = review_content;
		this.declare_count = declare_count;
		this.profile = profile;
		this.profile_path = profile_path;
	}




	public String getReview_content() {
		return review_content;
	}




	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}




	//기본 테이블 필드
	public Declare(int d_no, int r_no, int m_no, String category, String content, Date reg_date) {
		super();
		this.d_no = d_no;
		this.r_no = r_no;
		this.m_no = m_no;
		this.category = category;
		this.content = content;
		this.reg_date = reg_date;
	}
	public String getNickname() {
		return nickname;
	}




	public void setNickname(String nickname) {
		this.nickname = nickname;
	}




	public int getDeclare_count() {
		return declare_count;
	}




	public void setDeclare_count(int declare_count) {
		this.declare_count = declare_count;
	}




	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
