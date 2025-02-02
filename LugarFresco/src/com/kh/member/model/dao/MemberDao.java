package com.kh.member.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.member.model.vo.Member;


public class MemberDao {

	// 기본생성자 안에서 properties파일 가져오기
	private Properties prop = new Properties();

	public MemberDao() {

		String fileName = MemberDao.class.getResource("/com/kh/sql/member/member-query.properties").getPath();
		// 이거나중에 지우기
		//fileName = fileName.replace("WEB-INF/classes/", "");
		System.out.println(fileName);

		try {
			prop.load(new FileReader(fileName));

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	
	/**
	 * 일반 회원 회원가입 서비스
	 * @param con
	 * @param m
	 * @return
	 */
	public int insertMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getEmail());
			pstmt.setString(2, m.getNickName());
			pstmt.setString(3, m.getPass());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	/**
	 * 비밀번호 찾기시, 비밀번호를 임시번호로 바꿔 저장시키는 서비스
	 * @param con
	 * @param m
	 * @return
	 */
	public int updateRandomPass(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRandomPass");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getPass());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getNickName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public Member loginMember(Connection con, String email, String pass) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = new Member(rs.getInt("m_no"), 
							   rs.getString("logintype"), 
							   rs.getString("snsid"), 
							   rs.getString("email"), 
							   rs.getString("nickname"), 
							   rs.getString("pass"), 
							   rs.getDate("reg_date"), 
							   rs.getString("isowner"), 
							   rs.getString("profile"), 
							   rs.getString("profile_path"),
							   rs.getInt("r_like"), 
							   rs.getInt("r_declare"), 
							   rs.getString("isout"), 
							   rs.getString("isblack"),
							   rs.getDate("out_date")
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return m;
	}


	/**
	 * --- 카카오톡 로그인 멤버 객체 존재하는지 확인 ---
	 * @param conn
	 * @param id
	 * @return
	 */
	public Member snsLoginMember(Connection conn, String id) {
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("snsLoginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("m_no"), 
							   rset.getString("logintype"), 
							   rset.getString("snsid"), 
							   rset.getString("email"), 
							   rset.getString("nickname"), 
							   rset.getString("pass"), 
							   rset.getDate("reg_date"), 
							   rset.getString("isowner"), 
							   rset.getString("profile"), 
							   rset.getString("profile_path"),
							   rset.getInt("r_like"), 
							   rset.getInt("r_declare"), 
							   rset.getString("isout"), 
							   rset.getString("isblack"),
							   rset.getDate("out_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return m;
		
	}


	public int insertSnsMember(Connection conn, String id, String email, String nickName) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertSnsMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, nickName);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}



}//class end
