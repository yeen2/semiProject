package com.kh.review.model.vo;

public class ReviewImg {

	private int ri_no;
	private int r_no;
	private String img_name;
	private String img_path;
	private int img_level;

	
	public ReviewImg() {
		// TODO Auto-generated constructor stub
	}


	public ReviewImg(int ri_no, int r_no, String img_name, String img_path, int img_level) {
		super();
		this.ri_no = ri_no;
		this.r_no = r_no;
		this.img_name = img_name;
		this.img_path = img_path;
		this.img_level = img_level;
	}


	public int getRi_no() {
		return ri_no;
	}


	public void setRi_no(int ri_no) {
		this.ri_no = ri_no;
	}


	public int getR_no() {
		return r_no;
	}


	public void setR_no(int r_no) {
		this.r_no = r_no;
	}


	public String getImg_name() {
		return img_name;
	}


	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}


	public String getImg_path() {
		return img_path;
	}


	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}


	public int getImg_level() {
		return img_level;
	}


	public void setImg_level(int img_level) {
		this.img_level = img_level;
	}


	@Override
	public String toString() {
		return "ReviewImg [ri_no=" + ri_no + ", r_no=" + r_no + ", img_name=" + img_name + ", img_path=" + img_path
				+ ", img_level=" + img_level + "]";
	}

	
	
	
	
}
