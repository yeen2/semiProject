package com.kh.cafe.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cafe.model.dao.CafeDao;
import com.kh.cafe.model.vo.Cafe;
import com.kh.cafe.model.vo.PageInfo;

public class CafeService {

	/**
	 * 실제로 메인에 보여질 카페리스트 
	 * @return
	 */
	public ArrayList<Cafe> selectCafeList(){
		
		Connection con = getConnection();
		ArrayList<Cafe> list = new CafeDao().selectCafeList(con);
		
		close(con);
		
		return list;
	}
	
	
	
	/**
	 * 하나의 카페정보 불러오는 서비스
	 * @param c_no
	 * @return c_no의 카페정보
	 */
	public Cafe selectOneCafe(int c_no) {
		
		Connection con = getConnection();
		Cafe c = new CafeDao().selectOneCafe(con, c_no);
		
		close(con);
		
		return c;
	}
	
	
	/**
	 * 네비바 검색창에서 카페명or지역 검색 서비스
	 * @param keyword
	 * @return 검색된 카페 리스트
	 */
	public ArrayList<Cafe> selectNavSearch(String keyword){
		Connection con = getConnection();
		ArrayList<Cafe> list = new CafeDao().selectNavSearch(con, keyword);
		
		close(con);
		
		return list;
	}
	
	
	/**
	 * 현재 로그인한 회원이 해당 c_no의 카페를 즐겨찾기 했냐 
	 * @param m_no
	 * @param c_no
	 * @return 
	 */
	public int checkFavorite(int m_no, int c_no) {
		
		Connection con = getConnection();
		int result = new CafeDao().checkFavorite(con, m_no, c_no);
		
		close(con);
		
		return result;
	}
	
	
	/**
	 * 카페 즐겨찾기 추가 
	 * @param m_no
	 * @param c_no
	 * @return
	 */
	public int insertFavorite(int m_no, int c_no) {
		int result = 0;
		Connection con = getConnection();
		
		int result1 = new CafeDao().insertFavorite(con, m_no, c_no);
		int result2 = new CafeDao().increaseCafeFavorite(con, c_no);

		if(result1 > 0 && result2>0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		return result;
	}
	
	
	/**
	 * 카페 즐겨찾기 제거
	 * @param m_no
	 * @param c_no
	 * @return
	 */
	public int deleteFavorite(int m_no, int c_no) {
		int result = 0;
		Connection con = getConnection();
		
		int result1 = new CafeDao().deleteFavorite(con, m_no, c_no);
		int result2 = new CafeDao().decreaseCafeFavorite(con, c_no);
		
		if(result1 > 0 && result2 >0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		return result;
	}
	
	
	/** 페이징 처리 위한, 카페총리스트 갯수 불러오기
	 * @return
	 */
	public int getListCount() {
		Connection con = getConnection();
		
		int result = new CafeDao().getListCount(con);
		
		return result;
	}
	
	/**
	 * 페이징 처리로 카페리스트 불러오기
	 * @param pi
	 * @return
	 */
	public ArrayList<Cafe> selectList(PageInfo pi){

		Connection con = getConnection();
		ArrayList<Cafe> list = new CafeDao().selectList(con, pi);
		
		return list;
	}
	
	
	
	
	
	
}//class end
