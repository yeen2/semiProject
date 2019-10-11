package com.kh.review.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Review {
	
	private int r_no;
	private int m_no;
	private int c_no;
	private int flavor;
	private int price;
	private int service;
	private double sum_avg; 
	
	private String r_content;
	private Date r_date;
	private String isDelete;
	private int r_like;
	private int r_declare;
	
	private String rr_content;
	private Date rr_date;
	
	// 마이페이지
	private String cafe_name;
	private String img_path;
	private String img_name;
	
	// cafeInfo
	private ArrayList<ReviewImg> imgList;
	private String profile;
	private String nickname;
	
	// 좋아요, declare ==> 0이면 안한거, 1이면 한거
	private int like;
	private int declare;
		
	
	public Review() {
		super();
	}

	// cafeInfo 에서 댓글불러오는 생성자
	public Review(int r_no, int m_no, int c_no, int flavor, int price, int service, double sum_avg, String r_content,
			Date r_date, String isDelete, int r_like, int r_declare, String rr_content, Date rr_date,
			ArrayList<ReviewImg> imgList, String profile, String nickname, int like, int declare) {
		super();
		this.r_no = r_no;
		this.m_no = m_no;
		this.c_no = c_no;
		this.flavor = flavor;
		this.price = price;
		this.service = service;
		this.sum_avg = sum_avg;
		this.r_content = r_content;
		this.r_date = r_date;
		this.isDelete = isDelete;
		this.r_like = r_like;
		this.r_declare = r_declare;
		this.rr_content = rr_content;
		this.rr_date = rr_date;
		this.imgList = imgList;
		this.profile = profile;
		this.nickname = nickname;
		this.like = like;
		this.declare = declare;
		
	}
	
	// cafeInfo 에서 댓글불러오는 생성자
		public Review(int r_no, int m_no, int c_no, int flavor, int price, int service, double sum_avg, String r_content,
				Date r_date, String isDelete, int r_like, int r_declare, String rr_content, 
				Date rr_date, String profile, String nickname, int like, int declare) {
			super();
			this.r_no = r_no;
			this.m_no = m_no;
			this.c_no = c_no;
			this.flavor = flavor;
			this.price = price;
			this.service = service;
			this.sum_avg = sum_avg;
			this.r_content = r_content;
			this.r_date = r_date;
			this.isDelete = isDelete;
			this.r_like = r_like;
			this.r_declare = r_declare;
			this.rr_content = rr_content;
			this.rr_date = rr_date;
			this.profile = profile;
			this.nickname = nickname;
			this.like = like;
			this.declare = declare;
		}


	/**
	 * --- 마이페이지 나의 리뷰 매개변수 생성자 ---
	 * @param c_no
	 * @param r_content
	 * @param cafe_name
	 * @param img_src
	 * @param img_name
	 */
	public Review(int r_no, int c_no, int flavor, int price, int service, double sum_avg, String r_content,
			Date r_date, int r_like, int r_declare, String rr_content, Date rr_date, String cafe_name, String img_name,
			ArrayList<ReviewImg> imgList, String profile, String nickname) {
		super();
		this.r_no = r_no;
		this.c_no = c_no;
		this.flavor = flavor;
		this.price = price;
		this.service = service;
		this.sum_avg = sum_avg;
		this.r_content = r_content;
		this.r_date = r_date;
		this.r_like = r_like;
		this.r_declare = r_declare;
		this.rr_content = rr_content;
		this.rr_date = rr_date;
		this.cafe_name = cafe_name;
		this.img_name = img_name;
		this.imgList = imgList;
		this.profile = profile;
		this.nickname = nickname;
	}
	
	
	public Review(int r_no, int c_no, int flavor, int price, int service, double sum_avg, String r_content,
			Date r_date, int r_like, int r_declare, String rr_content, Date rr_date, String cafe_name, String img_name,
			String profile, String nickname) {
		super();
		this.r_no = r_no;
		this.c_no = c_no;
		this.flavor = flavor;
		this.price = price;
		this.service = service;
		this.sum_avg = sum_avg;
		this.r_content = r_content;
		this.r_date = r_date;
		this.r_like = r_like;
		this.r_declare = r_declare;
		this.rr_content = rr_content;
		this.rr_date = rr_date;
		this.cafe_name = cafe_name;
		this.img_name = img_name;
		this.profile = profile;
		this.nickname = nickname;
	}
	

	public Review(int r_no, int m_no, int c_no, int flavor, int price, int service, double sum_avg, String r_content,
			Date r_date, String isDelete, int r_like, int r_declare, String rr_content, Date rr_date, String cafe_name) {
		super();
		this.r_no = r_no;
		this.m_no = m_no;
		this.c_no = c_no;
		this.flavor = flavor;
		this.price = price;
		this.service = service;
		this.sum_avg = sum_avg;
		this.r_content = r_content;
		this.r_date = r_date;
		this.isDelete = isDelete;
		this.r_like = r_like;
		this.r_declare = r_declare;
		this.rr_content = rr_content;
		this.rr_date = rr_date;
		this.cafe_name = cafe_name;
	}

	

	public Review(int r_no2, int m_no2, int c_no2, int flavor2, int price2, int service2, double sum_avg2,
			String r_content2, Date r_date2, String isDelete2, int r_like2, int r_declare2, String rr_content2,
			Date rr_date2, ReviewImg reviewImg) {
		// TODO Auto-generated constructor stub
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

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getFlavor() {
		return flavor;
	}

	public void setFlavor(int flavor) {
		this.flavor = flavor;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getService() {
		return service;
	}

	public void setService(int service) {
		this.service = service;
	}

	public double getSum_avg() {
		return sum_avg;
	}

	public void setSum_avg(double sum_avg) {
		this.sum_avg = sum_avg;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	public int getR_like() {
		return r_like;
	}

	public void setR_like(int r_like) {
		this.r_like = r_like;
	}

	public int getR_declare() {
		return r_declare;
	}

	public void setR_declare(int r_declare) {
		this.r_declare = r_declare;
	}

	public String getRr_content() {
		return rr_content;
	}

	public void setRr_content(String rr_content) {
		this.rr_content = rr_content;
	}

	public Date getRr_date() {
		return rr_date;
	}

	public void setRr_date(Date rr_date) {
		this.rr_date = rr_date;
	}

	public String getCafe_name() {
		return cafe_name;
	}

	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	
	//cafeInfo
	public ArrayList<ReviewImg> getImgList() {
		return imgList;
	}


	public void setImgList(ArrayList<ReviewImg> imgList) {
		this.imgList = imgList;
	}
	
	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	@Override
	public String toString() {
		return "Review [r_no=" + r_no + ", m_no=" + m_no + ", c_no=" + c_no + ", flavor=" + flavor + ", price=" + price
				+ ", service=" + service + ", sum_avg=" + sum_avg + ", r_content=" + r_content + ", r_date=" + r_date
				+ ", isDelete=" + isDelete + ", r_like=" + r_like + ", r_declare=" + r_declare + ", rr_content="
				+ rr_content + ", rr_date=" + rr_date + ", imgList=" + imgList + "]";
	}

	


	
	
	
	

	
}
