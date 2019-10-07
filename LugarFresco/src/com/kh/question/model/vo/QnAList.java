package com.kh.question.model.vo;

import java.sql.Date;

public class QnAList {
	
	private int q_no;
	private int m_no;
	private String q_title;
	private String q_content;
	private Date q_date;
	private String isanswer;
	private String a_content;
	private Date a_date;
	private String isdelete;
	private String nickname;
	
	public QnAList(int q_no, String q_title, String q_content ,String nickname,Date q_date, Date a_date,String isanswer) {
		super();
		this.q_no = q_no;
		this.q_title = q_title;
		this.q_content = q_content;
		this.nickname = nickname;
		this.q_date = q_date;
		this.a_date = a_date;
		this.isanswer = isanswer;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public QnAList() {
		
	}
	
	public QnAList(int q_no, int m_no, String q_title, String q_content, Date q_date, String isanswer, String a_content,
			Date a_date, String isdelete) {
		super();
		this.q_no = q_no;
		this.m_no = m_no;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.isanswer = isanswer;
		this.a_content = a_content;
		this.a_date = a_date;
		this.isdelete = isdelete;
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public Date getQ_date() {
		return q_date;
	}

	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}

	public String getIsanswer() {
		return isanswer;
	}

	public void setIsanswer(String isanswer) {
		this.isanswer = isanswer;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public Date getA_date() {
		return a_date;
	}

	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}

	public String getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}

	@Override
	public String toString() {
		return "QnAList [q_no=" + q_no + ", m_no=" + m_no + ", q_title=" + q_title + ", q_content=" + q_content
				+ ", q_date=" + q_date + ", isanswer=" + isanswer + ", a_content=" + a_content + ", a_date=" + a_date
				+ ", isdelete=" + isdelete + "]";
	}

	
}
