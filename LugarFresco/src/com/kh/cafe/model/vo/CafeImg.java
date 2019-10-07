package com.kh.cafe.model.vo;

public class CafeImg {
	
	private int ci_no;
	private int c_no;
	private String img_name;
	private String img_path;
	private int img_level;
	
	public CafeImg() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CafeImg(int ci_no, int c_no, String img_name, String img_path, int img_level) {
		super();
		this.ci_no = ci_no;
		this.c_no = c_no;
		this.img_name = img_name;
		this.img_path = img_path;
		this.img_level = img_level;
	}

	public int getCi_no() {
		return ci_no;
	}

	public void setCi_no(int ci_no) {
		this.ci_no = ci_no;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
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
		return "CafeImg [ci_no=" + ci_no + ", c_no=" + c_no + ", img_name=" + img_name + ", img_path=" + img_path
				+ ", img_level=" + img_level + "]";
	}
	
	
	
}
