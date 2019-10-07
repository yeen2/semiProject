package com.kh.question.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.kh.question.model.vo.PageInfo;
import com.kh.question.model.vo.Question;

public class QuestionDao {
	private Properties prop = new Properties();
	public QuestionDao() {
		String FileName = QuestionDao.class.getResource("/com/kh/sql/question/question-query.properties").getPath();
		try {
			prop.load(new FileReader(FileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**일반적인 리스트 갯수 파악 메소드
	 * @param conn
	 * @return
	 */
	public int getListCount(Connection conn) {
		int listCount=0;
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		String sql = prop.getProperty("getListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount=rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(conn);
			close(pstmt);
		}
		return listCount;
	}
	
	/**제목으로 검색시 리스트 파악 메소드
	 * @param conn
	 * @param Q_title
	 * @return
	 */
	public int getListCount(Connection conn, String Q_title) {
		int listCount=0;
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		String sql = prop.getProperty("getQ_titleSearchListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Q_title);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount=rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(conn);
			close(pstmt);
		}
		return listCount;
		
	}
	
	/**닉네임으로 검색시 리스트 갯수 파악 메소드
	 * @param conn
	 * @param nickName
	 * @param godblessyou 신이 당신과 함께하기를 오버로딩때문에 넣었다.
	 * @return
	 */
	public int getListCount(Connection conn, String nickName, int godblessyou) {
		int listCount=0;
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		String sql = prop.getProperty("getQ_writerSearchListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount=rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(conn);
			close(pstmt);
		}
		return listCount;
		
	}
	
	/**일반적인 리스트 갯수를 알때 갯수만큼의 question정보를 담는 메소드
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Question> selectListQuestion(Connection conn, PageInfo pi){
		ArrayList<Question> q_list = new ArrayList<>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectQ_list");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow-1+pi.getBoardLimit();
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				q_list.add(new Question(rset.getInt("q_no"),
									  rset.getString("nickname"),
									  rset.getString("q_title"),
									  rset.getString("q_content"),
									  rset.getDate("q_date"),
									  rset.getString("isanswer"),
									  rset.getString("a_content"),
									  rset.getDate("a_date"),
									  rset.getString("isdelete")));
			}
			
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return q_list;
		
	}
	/**제목으로 검색시 question객체에 담는 메소드
	 * @param conn
	 * @param pi
	 * @param Q_title
	 * @return
	 */
	public ArrayList<Question> selectListQuestion(Connection conn, PageInfo pi, String Q_title){
		ArrayList<Question> q_list = new ArrayList<>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectQ_titleSearchQ_list");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow-1+pi.getBoardLimit();
			pstmt.setString(1, Q_title);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3,endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				q_list.add(new Question(rset.getInt("q_no"),
									  rset.getString("nickname"),
									  rset.getString("q_title"),
									  rset.getString("q_content"),
									  rset.getDate("q_date"),
									  rset.getString("isanswer"),
									  rset.getString("a_content"),
									  rset.getDate("a_date"),
									  rset.getString("isdelete")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return q_list;
		
	}
	/**닉네임으로 검색시 question객체 담는 메소드
	 * @param conn
	 * @param pi
	 * @param nickName
	 * @param Thankyou
	 * @return
	 */
	public ArrayList<Question> selectListQuestion(Connection conn, PageInfo pi, String nickName, int Thankyou){
		ArrayList<Question> q_list = new ArrayList<>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectQ_writerSearchQ_list");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow-1+pi.getBoardLimit();
			pstmt.setString(1, nickName);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3,endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				q_list.add(new Question(rset.getInt("q_no"),
									  rset.getString("nickname"),
									  rset.getString("q_title"),
									  rset.getString("q_content"),
									  rset.getDate("q_date"),
									  rset.getString("isanswer"),
									  rset.getString("a_content"),
									  rset.getDate("a_date"),
									  rset.getString("isdelete")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return q_list;
		
	}
	
	public int insertQuestion(Connection conn, Question q) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(q.getQ_writer()));
			pstmt.setString(2, q.getQ_title());
			pstmt.setString(3, q.getQ_content());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	public String getNickName(Connection conn, int m_no) {
		String nickName=null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectNickName");
		ResultSet rset=null;
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, m_no);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				nickName=rset.getString(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return nickName;
	}
	
	public Question selectDetailQuestion(Connection conn, int q_no) {
		Question result = new Question();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQuestion");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q_no);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result= new Question(rset.getInt("Q_NO"),
									 rset.getString("NICKNAME") + "," +rset.getInt("M_NO"), 
									 rset.getString("Q_TITLE"), 
									 rset.getString("Q_CONTENT"), 
									 rset.getDate("Q_DATE"), 
									 rset.getString("ISANSWER"), 
									 rset.getString("A_CONTENT"), 
									 rset.getDate("A_DATE"),
									 rset.getString("ISDELETE"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
	}
	public int deleteQuestion(Connection conn, int q_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q_no);
			result = pstmt.executeUpdate();
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	/**회원이 쓴글 업데이트시 쓰는 메소드
	 * @param conn
	 * @param q_content 회원이 작성한글
	 * @param q_no
	 * @return
	 */
	public int updateQuestion(Connection conn, String q_content, int q_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q_content);
			pstmt.setInt(2, q_no);
			result = pstmt.executeUpdate();
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	/**관리자가 작성한 답글 업데이트 메소드
	 * @param conn
	 * @param a_content 관리자가 작성한 글
	 * @param q_no
	 * @return
	 */
	public int updateReply(Connection conn, String a_content, int q_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReply");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a_content);
			pstmt.setInt(2, q_no);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		return result;
		
	}
}
