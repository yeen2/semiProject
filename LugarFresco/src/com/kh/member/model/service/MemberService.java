package com.kh.member.model.service;
import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;


public class MemberService {
	
	/**
	 * 일반 회원가입 메소드
	 * @param m
	 * @return int(성공유무)
	 */
	public int insertMember(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertMember(con, m);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
	
	
	
	/**
	 * 비밀번호찾기 시, 임시비밀번호로 db 변경하고 , 변경한 정보 select
	 * @param m
	 * @return int(성공유무)
	 */
	public int updateRandomPass(Member m) {
		Connection con = getConnection();
		
		int result = 0;
		
		result = new MemberDao().updateRandomPass(con, m);
		
		if(result > 0) {
			commit(con);
			
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
	
	
	
	/**
	 * 로그인시, 이메일 비밀번호 확인 서비스
	 * @param email
	 * @param pass
	 * @return 로그인 Member 객체
	 */
	public Member loginMember(String email, String pass) {
		
		Connection con = getConnection();
		Member m = null;
		
		m = new MemberDao().loginMember(con, email, pass);
		
		close(con);
		
		return m;
	}


	// 카카오 로그인
	public Member snsLoginMember(String id, String email, String nickName) {
		Connection conn = getConnection();
		
		Member m = null;
		int result = 0;
		
		m = new MemberDao().snsLoginMember(conn, id);
		
		if(m == null) {
			result = new MemberDao().insertSnsMember(conn, id, email, nickName);
			
			if(result > 0) {
				commit(conn);
				m = new MemberDao().snsLoginMember(conn, id);
			}else {
				rollback(conn);
			}
		}
		
		close(conn);
		
		return m;
	}
	
	
}//class end
