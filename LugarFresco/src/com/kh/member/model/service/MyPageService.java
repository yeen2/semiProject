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
import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.ReviewImg;

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
	
	public int deleteMember(int mno) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().deleteMember(conn, mno);
		
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
	
	public ArrayList<Review> selectMyReviewList(int mno) {
		Connection conn = getConnection();
		
		ArrayList<Review> r = new ArrayList<>();
		ArrayList<ReviewImg> imgList = new ArrayList<>();
		//반환변수
		ArrayList<Review> list = new ArrayList<>();
		
		//1.이미지뺀, review리스트만 총 불러오기
		r = new MyPageDao().selectMyReviewList(conn, mno);

		//2. 해당 r_no에 해당하는 img갖고와서 저장하기
		for(int i=0; i<r.size(); i++) {
			
			int rno = r.get(i).getR_no();
			imgList = new MyPageDao().selectMyReviewImg(conn, rno);
 
			list.add(new Review(r.get(i).getR_no(),
								r.get(i).getC_no(), 
								r.get(i).getFlavor(), 
								r.get(i).getPrice(), 
								r.get(i).getService(), 
								r.get(i).getSum_avg(), 
								r.get(i).getR_content(),
								r.get(i).getR_date(),
								r.get(i).getR_like(), 
								r.get(i).getR_declare(), 
								r.get(i).getRr_content(), 
								r.get(i).getRr_date(),
								r.get(i).getCafe_name(),
								r.get(i).getImg_name(),
								imgList,
								r.get(i).getProfile(),
								r.get(i).getNickname()));
		}
		
		close(conn);
		
		return list;
	}

	public ArrayList<Review> selectLikeList(int mno) {
		Connection conn = getConnection();
		
		ArrayList<Review> r = new ArrayList<>();
		ArrayList<ReviewImg> imgList = new ArrayList<>();
		//반환변수
		ArrayList<Review> list = new ArrayList<>();
		
		//1.이미지뺀, review리스트만 총 불러오기
		r = new MyPageDao().selectLikeList(conn, mno);

		//2. 해당 r_no에 해당하는 img갖고와서 저장하기
		for(int i=0; i<r.size(); i++) {
			
			int rno = r.get(i).getR_no();
			imgList = new MyPageDao().selectMyReviewImg(conn, rno);
 
			list.add(new Review(r.get(i).getR_no(),
								r.get(i).getC_no(), 
								r.get(i).getFlavor(), 
								r.get(i).getPrice(), 
								r.get(i).getService(), 
								r.get(i).getSum_avg(), 
								r.get(i).getR_content(),
								r.get(i).getR_date(),
								r.get(i).getR_like(), 
								r.get(i).getR_declare(), 
								r.get(i).getRr_content(), 
								r.get(i).getRr_date(),
								r.get(i).getCafe_name(),
								r.get(i).getImg_name(),
								imgList,
								r.get(i).getProfile(),
								r.get(i).getNickname()));
		}
		
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
	
	public Member updateMemberNick(Member m) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().updateMemberNick(conn, m);
		
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
	
	public int ownerReviewCountCn(int mno, String search) {
		Connection conn = getConnection();
		
		int count = new MyPageDao().ownerReviewCountCn(conn, mno, search);
		
		close(conn);
		
		return count;
	}
	
	public int ownerReviewCountCt(int mno, String search) {
		Connection conn = getConnection();
		
		int count = new MyPageDao().ownerReviewCountCt(conn, mno, search);
		
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
	
	public ArrayList<Review> ownerReviewSelectCn(PageInfo pi, int mno, String search) {
		Connection conn = getConnection();
		
		ArrayList<Review> list = new MyPageDao().ownerReviewSelectCn(conn, pi, mno, search);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Review> ownerReviewSelectCt(PageInfo pi, int mno, String search) {
		Connection conn = getConnection();
		
		ArrayList<Review> list = new MyPageDao().ownerReviewSelectCt(conn, pi, mno, search);
		
		close(conn);
		
		return list;
	}

	public int insertPowerPay(int mno, int cno, int price) {
		Connection conn = getConnection();
		int result = 0;
		
		int result1 = new MyPageDao().insertPower(conn, mno, cno);
		int result2 = new MyPageDao().insertPay(conn, mno, price);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
			result = 1;
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int[] myPageCount(int mno) {
		Connection conn = getConnection();
		
		int[] arr = new MyPageDao().myPageCount(conn, mno);
		
		close(conn);
		
		return arr;
	}

	public int[] ownerPageCount(int mno) {
		Connection conn = getConnection();
		
		int[] arr = new MyPageDao().ownerPageCount(conn, mno);
		
		close(conn);
		
		return arr;
	}

	public int likeRemove(int mno, int rno) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().likeRemove(conn, mno, rno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int favoriteRemove(int mno, int fno) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().favoriteRemove(conn, mno, fno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int deleteMyCafe(int cno) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().deleteMyCafe(conn, cno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	
}
