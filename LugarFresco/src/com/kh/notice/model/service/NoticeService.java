package com.kh.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;
import com.kh.notice.model.vo.PageInfo;

import static com.kh.common.JDBCTemplate.*;


public class NoticeService {
	
	/**
	 * 1-1. 공지사항 리스트 조회
	 * @return
	 */
	public ArrayList<Notice> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	
	/**
	 * 1-2. 공지사항 리스트 갯수
	 * @return
	 */
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new NoticeDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	
	
	/**
	 * 2. 공지사항 작성용 서비스
	 * @param n
	 * @return
	 */
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 3. 공지사항 상세보기용 서비스
	 * @param n_no --> 조회하고자 하는 공지사항 글 번호
	 * @return	  --> 조회된 Notice 객체
	 */
	public Notice selectNotice(int n_no) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(conn, n_no);
		
		Notice n = null;
		if(result > 0) {
			commit(conn);
			n = new NoticeDao().selectNotice(conn, n_no);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return n;
		
	}
	
	/**
	 * 4. 수정할 공지사항 조회용 서비스
	 * @param n_no
	 * @return
	 */
	public Notice selectUpdateNotice(int n_no) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, n_no);
		
		close(conn);
		
		return n;
	}
	
	/**
	 * 5. 공지사항 수정용 서비스
	 * @param n
	 * @return
	 */
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	/**
	 * 6. 공지사항 삭제용 서비스
	 * @param n_no
	 * @return
	 */
	public int deleteNotice(int n_no) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, n_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
}
