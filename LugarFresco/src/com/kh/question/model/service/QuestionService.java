package com.kh.question.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.question.model.dao.QuestionDao;
import com.kh.question.model.vo.PageInfo;
import com.kh.question.model.vo.QnAList;

public class QuestionService {
	// 검색시, 등록완료시, QnA로 들어올때 사용하는 메소드 list의 갯수를 파악할때 쓰이는 메소드들을 재사용을 위해 오버로딩과 if문을 사용해봤다.
	public int getListCount(String search, String word) {
		Connection conn = getConnection();
		int listCount =0;
	
		if("q_title".equals(search)&& word!=null) {
			listCount = new QuestionDao().getListCount(conn, word);
			
			close(conn);
			
		}else if("q_writer".equals(search)&& word!=null) {
			int godblessyou=0;
			listCount = new QuestionDao().getListCount(conn, word, godblessyou);
			
			close(conn);
			
		}else{
			listCount = new QuestionDao().getListCount(conn);

			close(conn);
			
		}
		
		return listCount;
	}
	
	/**실제 Question디비에 정보들을 불러오는 메소드
	 * @param pi 페이지 처리 변수
	 * @param search 검색시 분류 변수
	 * @param word 검색시 서칭 변수
	 * @return Question객체
	 * 위와 마찬가지로 오버로딩과if문을이용해서 재사용할 수있도록 해봤다.
	 */
	public ArrayList<QnAList> selectListQuestion(PageInfo pi, String search, String word) {
		Connection conn = getConnection();
		ArrayList<QnAList> q_list = new ArrayList<QnAList>();
				
		if ("q_title".equals(search)&& word!=null) {
			q_list = new QuestionDao().selectListQuestion(conn, pi, word);
			
			close(conn);
			
		}else if("q_writer".equals(search)&& word!=null) {
			int thankyou=0;
			q_list = new QuestionDao().selectListQuestion(conn, pi, word, thankyou);
		
			close(conn);
			
		}else {
			q_list = new QuestionDao().selectListQuestion(conn, pi);
			
			close(conn);
			
		}
	
		return q_list;
	}

	/**글쓰기 메소드 insert, update, delete는 트랜잭션 처리를 해야된다.
	 * @param q Question 객체
	 * @return 성공? 실패? 숫자로 반환
	 */
	public int insertQuestion(QnAList q) {
		Connection conn = getConnection();
		int result = new QuestionDao().insertQuestion(conn, q);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	/** 게시글마다 닉네임 확인 메소드
	 * @param m_no 확인할 회원 번호
	 * @return 닉네임값
	 */
	public String getNickName(int m_no) {
		Connection conn = getConnection();
		String nickName = new QuestionDao().getNickName(conn, m_no);
		
		close(conn);

		return nickName;
	}
	/**상세보기 
	 * @param q_no question 넘버
	 * @return question 객체
	 */
	public QnAList selectDetailQuestion(int q_no) {
		Connection conn = getConnection();
		QnAList result = new QuestionDao().selectDetailQuestion(conn, q_no);
		
		close(conn);
		
		return result;
	}
	public int deleteQuestion(String q_no) {
		Connection conn = getConnection();
		int Q_no = Integer.parseInt(q_no);
		int result = new QuestionDao().deleteQuestion(conn, Q_no);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	public int updateQuestion(String q_content, int q_no, String info) {
		Connection conn = getConnection();
		int result = new QuestionDao().updateQuestion(conn, q_content, q_no);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	public int updateQuestion(String a_content, int q_no) {
		Connection conn = getConnection();
		int result = new QuestionDao().updateReply(conn, a_content, q_no);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
}
