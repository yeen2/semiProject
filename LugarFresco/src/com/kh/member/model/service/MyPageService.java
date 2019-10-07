package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.vo.PageInfo;
import com.kh.cafe.model.vo.Cafe;
import com.kh.cafe.model.vo.CafeImg;
import com.kh.member.model.dao.MyPageDao;
import com.kh.member.model.vo.Member;
import com.kh.owner.model.vo.PowerLink;
import com.kh.review.model.vo.Review;

public class MyPageService {

	public Member updatePwd(Member m, String newPwd) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().updatePwd(conn, m, newPwd);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MyPageDao().selectMember(conn, m);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
	}
	
	public int deleteMember(String id) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().deleteMember(conn, id);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<Cafe> selectFavoriteList(int mno) {
		Connection conn = getConnection();
		
		ArrayList<Cafe> list = new MyPageDao().selectFavoriteList(conn, mno);
		
		close(conn);
		
		return list;
	}
	
	/*public ArrayList<Review> selectMyReviewList(int mno) {
		Connection conn = getConnection();
		
		ArrayList<Review> list = new MyPageDao().selectMyReviewList(conn, mno);
		
		close(conn);
		
		return list;
	}
*/
	public ArrayList<Cafe> selectLikeList(int mno) {
		Connection conn = getConnection();
		
		ArrayList<Cafe> list = new MyPageDao().selectLikeList(conn, mno);
		
		close(conn);
		
		return list;
	}

	public int insertCafe(Cafe c, ArrayList<CafeImg> list) {
		Connection conn = getConnection();
		
		int result1 = new MyPageDao().insertCafe(conn, c);
		int result2 = new MyPageDao().insertCafeImg(conn, list);
		
		int result = 0;
		if(result1 > 0 && result2 > 0) {
			commit(conn);
			result = 1;
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Member updateMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().updateMember(conn, m);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MyPageDao().selectMember(conn, m);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
	}

	public int deleteReview(int rno) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().deleteReview(conn, rno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int joinCheckEmail(String email) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().joinCheckEmail(conn, email);
		
		close(conn);
		
		return result;
	}
	
	public int joinCheckNickName(String nickName) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().joinCheckNickName(conn, nickName);
		
		close(conn);
		
		return result;
	}
	
	public int ownerReviewCount(int mno) {
		Connection conn = getConnection();
		
		int count = new MyPageDao().ownerReviewCount(conn, mno);
		
		close(conn);
		
		return count;
	}
	
	public int ownerPowerCount(int mno) {
		Connection conn = getConnection();
		
		int count = new MyPageDao().ownerPowerCount(conn, mno);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Cafe> ownerCafeList(int mno) {
		Connection conn = getConnection();
		
		ArrayList<Cafe> list = new MyPageDao().ownerCafeList(conn, mno);
		
		close(conn);
		
		return list;
	}

	public ArrayList<PowerLink> ownerPowerList(PageInfo pi, int mno) {
		Connection conn = getConnection();
		
		ArrayList<PowerLink> list = new MyPageDao().ownerPowerList(conn, pi, mno);
				
		close(conn);
		
		return list;
	}

	public ArrayList<Review> ownerReviewList(PageInfo pi, int mno) {
		Connection conn = getConnection();
		
		ArrayList<Review> list = new MyPageDao().ownerReviewList(conn, pi, mno);
				
		close(conn);
		
		return list;
	}
	
	public Cafe selectBrImgSelect(int cno) {
		Connection conn = getConnection();
		
		Cafe file = new MyPageDao().selectBrImgSelect(conn, cno);
		
		close(conn);
		
		return file;
	}
}
