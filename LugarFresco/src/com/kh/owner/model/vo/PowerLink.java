package com.kh.owner.model.vo;

import java.sql.Date;

public class PowerLink {

	private int p_no;
	private int m_no;
	private int c_no;
	private Date reg_date;
	private Date upload_date;
	private int status;
	private String cafe_name;
	
	public PowerLink() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PowerLink(int p_no, int m_no, int c_no, Date reg_date, Date upload_date, int status, String cafe_name) {
		super();
		this.p_no = p_no;
		this.m_no = m_no;
		this.c_no = c_no;
		this.reg_date = reg_date;
		this.upload_date = upload_date;
		this.status = status;
		this.cafe_name = cafe_name;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
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

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCafe_name() {
		return cafe_name;
	}

	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}

	@Override
	public String toString() {
		return "PowerLink [p_no=" + p_no + ", m_no=" + m_no + ", c_no=" + c_no + ", reg_date=" + reg_date
				+ ", upload_date=" + upload_date + ", status=" + status + ", cafe_name=" + cafe_name + "]";
	}
	
	
}
