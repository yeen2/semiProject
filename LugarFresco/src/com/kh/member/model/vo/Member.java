package com.kh.member.model.vo;

import java.sql.Date;


public class Member {

	private int m_no;        // 회원번호
	private String loginType;     // 가입유형 
	private String snsId;    // sns 로그인id
	private String email;    // 이메일
	private String nickName; // 닉네임
	private String pass;     // 비밀번호
	private Date reg_date; // 가입날짜
	private String isOwner;  // 사장인지아닌지 default-'N'
	private String profile;   // 프로필사진 default-'profil.png'
	private String profile_path;
	private int like;        // 내가받은 좋아요 default-0
	private int declare;     // 내가받은 신고 default-0
	private String isOut;    // 탈퇴여부 default-'N'
	private String isBlack;  // 블랙리스트여부 dafault-'N'
	private Date out_date;   // 탈퇴날쨔
	
	//성환
	private int reviewCount;
	
	
	public Member() {

	}


	// 일반 회원가입 생성자
	public Member(String email, String nickName, String pass) {
		super();
		this.email = email;
		this.nickName = nickName;
		this.pass = pass;
	}

	// 게시글 작성 수 and 회원 사진을 구하기 위한 매개변수 생성자
	public Member(String profile, String profile_path, String nickName, int reviewCount) {
		super();
		this.profile = profile;
		this.profile_path = profile_path;
		this.nickName = nickName;
		this.reviewCount = reviewCount;
	}

	public Member(int m_no, String loginType, String snsId, String email, String nickName, String pass, Date reg_date,
			String isOwner, String profile, String profile_path, int like, int declare, String isOut, String isBlack,
			Date out_date) {
		super();
		this.m_no = m_no;
		this.loginType = loginType;
		this.snsId = snsId;
		this.email = email;
		this.nickName = nickName;
		this.pass = pass;
		this.reg_date = reg_date;
		this.isOwner = isOwner;
		this.profile = profile;
		this.profile_path = profile_path;
		this.like = like;
		this.declare = declare;
		this.isOut = isOut;
		this.isBlack = isBlack;
		this.out_date = out_date;
	}


	public int getM_no() {
		return m_no;
	}


	public void setM_no(int m_no) {
		this.m_no = m_no;
	}


	public String getLoginType() {
		return loginType;
	}


	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}


	public String getSnsId() {
		return snsId;
	}


	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public Date getReg_date() {
		return reg_date;
	}


	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}


	public String getIsOwner() {
		return isOwner;
	}


	public void setIsOwner(String isOwner) {
		this.isOwner = isOwner;
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


	public int getLike() {
		return like;
	}


	public void setLike(int like) {
		this.like = like;
	}


	public int getDeclare() {
		return declare;
	}


	public void setDeclare(int declare) {
		this.declare = declare;
	}


	public String getIsOut() {
		return isOut;
	}


	public void setIsOut(String isOut) {
		this.isOut = isOut;
	}


	public String getIsBlack() {
		return isBlack;
	}


	public void setIsBlack(String isBlack) {
		this.isBlack = isBlack;
	}


	public Date getOut_date() {
		return out_date;
	}


	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}

	
	public int getReviewCount() {
		return reviewCount;
	}


	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}


	@Override
	public String toString() {
		return "Member [m_no=" + m_no + ", loginType=" + loginType + ", snsId=" + snsId + ", email=" + email
				+ ", nickName=" + nickName + ", pass=" + pass + ", reg_date=" + reg_date + ", isOwner=" + isOwner
				+ ", profile=" + profile + ", profile_path=" + profile_path + ", like=" + like + ", declare=" + declare
				+ ", isOut=" + isOut + ", isBlack=" + isBlack + ", out_date=" + out_date + "]";
	}


	


	
	
	
}
