package com.kh.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int n_no;			// 공지사항번호
	private String title;		// 제목
	private String content;		// 내용
	private Date reg_date;		// 작성날짜
	private Date update_date;	// 수정날짜
	private int count;			// 조회수
	private String isdelete;	// 삭제여부

	
	public Notice() {
		
	}


	public Notice(int n_no, String title, String content, Date reg_date, int count, String isdelete) {
		super();
		this.n_no = n_no;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.count = count;
		this.isdelete = isdelete;
	}


	public Notice(int n_no, String title, Date reg_date, int count) {
		super();
		this.n_no = n_no;
		this.title = title;
		this.reg_date = reg_date;
		this.count = count;
	}




	public Notice(int n_no, String title, String content, Date reg_date, Date update_date, int count, String isdelete) {
		super();
		this.n_no = n_no;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.update_date = update_date;
		this.count = count;
		this.isdelete = isdelete;
	}



	public int getN_no() {
		return n_no;
	}



	public void setN_no(int n_no) {
		this.n_no = n_no;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
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



	public Date getUpdate_date() {
		return update_date;
	}



	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}



	public String getIsdelete() {
		return isdelete;
	}



	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}



	@Override
	public String toString() {
		return "Notice [n_no=" + n_no + ", title=" + title + ", content=" + content + ", reg_date=" + reg_date
				+ ", update_date=" + update_date + ", count=" + count + ", isdelete=" + isdelete + "]";
	}
	
	
	
	
	

}
