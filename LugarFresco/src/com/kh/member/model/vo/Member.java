package com.kh.member.model.vo;

import java.sql.Date;


public class Member {

	private int m_no;        // �쉶�썝踰덊샇
	private String loginType;     // 媛��엯�쑀�삎 
	private String snsId;    // sns 濡쒓렇�씤id
	private String email;    // �씠硫붿씪
	private String nickName; // �땳�꽕�엫
	private String pass;     // 鍮꾨�踰덊샇
	private Date reg_date; // 媛��엯�궇吏�
	private String isOwner;  // �궗�옣�씤吏��븘�땶吏� default-'N'
	private String profile;   // �봽濡쒗븘�궗吏� default-'profil.png'
	private String profile_path;
	private int like;        // �궡媛�諛쏆� 醫뗭븘�슂 default-0
	private int declare;     // �궡媛�諛쏆� �떊怨� default-0
	private String isOut;    // �깉�눜�뿬遺� default-'N'
	private String isBlack;  // 釉붾옓由ъ뒪�듃�뿬遺� dafault-'N'
	private Date out_date;   // �깉�눜�궇夷�
	
	//�꽦�솚admin
	private Date start_date;
	private Date end_date;
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
	
	
	
	public Member(int m_no, String loginType, String snsId, String email, String nickName, String pass, Date reg_date,
			String isOwner, String profile, String profile_path, int like, int declare, String isOut, String isBlack,
			Date out_date, int reviewCount) {
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
		this.reviewCount = reviewCount;
	}
	
	// �꽦�솚- 釉붾옓由ъ뒪�듃
	public Member(int m_no, String nickname, Date start_date, Date end_date) {
		super();
		this.m_no = m_no;
		this.nickName=nickname;
		this.start_date = start_date;
		this.end_date = end_date;
		
		
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


	public Date getStart_date() {
		return start_date;
	}


	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}


	public Date getEnd_date() {
		return end_date;
	}


	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}


	@Override
	public String toString() {
		return "Member [m_no=" + m_no + ", loginType=" + loginType + ", snsId=" + snsId + ", email=" + email
				+ ", nickName=" + nickName + ", pass=" + pass + ", reg_date=" + reg_date + ", isOwner=" + isOwner
				+ ", profile=" + profile + ", profile_path=" + profile_path + ", like=" + like + ", declare=" + declare
				+ ", isOut=" + isOut + ", isBlack=" + isBlack + ", out_date=" + out_date + "]";
	}


	


	
	
	
}
