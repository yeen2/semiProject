package com.kh.question.model.vo;

import java.sql.Date;

public class Question {
// 디비짜느라 고생했어 덕분에 편하게함!
	private int q_no;
	private String q_writer;
	private String q_title;
	private String q_content;
	private Date q_date;
	private String isAnswer;
	private String a_content;
	private Date a_date;
	private String isDelete;

	public Question(String q_writer, String q_title) {
		super();
		this.q_writer = q_writer;
		this.q_title = q_title;
	}

	public Question(int q_no, String q_writer, String q_title, String q_content, Date q_date) {
		super();
		this.q_no = q_no;
		this.q_writer = q_writer;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
	}

	public Question() {

	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getQ_writer() {
		return q_writer;
	}

	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
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

	public String getIsAnswer() {
		return isAnswer;
	}

	public void setIsAnswer(String isAnswer) {
		this.isAnswer = isAnswer;
	}

	public Date getA_date() {
		return a_date;
	}

	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	

	public Question(int q_no, String q_writer, String q_title, String q_content, Date q_date, String isAnswer,
			String a_content, Date a_date, String isDelete) {
		super();
		this.q_no = q_no;
		this.q_writer = q_writer;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.isAnswer = isAnswer;
		this.a_content = a_content;
		this.a_date = a_date;
		this.isDelete = isDelete;
	}

	@Override
	public String toString() {
		return "Question [q_no=" + q_no + ", q_writer=" + q_writer + ", q_title=" + q_title + ", q_content=" + q_content
				+ ", q_date=" + q_date + ", isAnswer=" + isAnswer + ", a_content=" + a_content + ", a_date=" + a_date
				+ ", isDelete=" + isDelete + "]";
	}

	
}
