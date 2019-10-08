package com.kh.review.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.ReviewImg;

public class ReviewService {

	/**
	 * 1. 리뷰 + 리뷰이미지 insert서비스
	 * @param r
	 * @param list
	 * @return
	 */
	public int insertReview(Review r, ArrayList<ReviewImg> list) {
		Connection con = getConnection();
		
		int result1 = new ReviewDao().insertReview(con, r);
		int result2 = new ReviewDao().insertReviewImg(con, list);
		
		int result = 0;
		if(result1>0 && result2>0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
		
	
	
	/**
	 * 2. 한카페의 총 리뷰 select 서비스
	 * @param c_no
	 * @return
	 */
	public ArrayList<Review> selectOneCafeReview(int c_no , int m_no){ 
		
		Connection con = getConnection();
		ArrayList<Review> rList = new ArrayList<>();
		ArrayList<ReviewImg> imgList = new ArrayList<>();
		//반환변수
		ArrayList<Review> reviewList = new ArrayList<>();
		
		//1.이미지뺀, review리스트만 총 불러오기
		rList = new ReviewDao().selectReview(con,c_no, m_no);

		//2. 해당 r_no에 해당하는 img갖고와서 저장하기
		for(int i=0; i<rList.size(); i++) {
			
			int r_no = rList.get(i).getR_no();
			imgList = new ReviewDao().selectReviewImg(con, r_no);
 
			reviewList.add(new Review(rList.get(i).getR_no(), 
									  rList.get(i).getM_no(), 
									  rList.get(i).getC_no(),
									  rList.get(i).getFlavor(), 
									  rList.get(i).getPrice(), 
									  rList.get(i).getService(),
									  rList.get(i).getSum_avg(), 
									  rList.get(i).getR_content(), 
									  rList.get(i).getR_date(),
									  rList.get(i).getIsDelete(), 
									  rList.get(i).getR_like(), 
									  rList.get(i).getR_declare(),
									  rList.get(i).getRr_content(), 
									  rList.get(i).getRr_date(), 
									  imgList,
									  rList.get(i).getProfile(),
									  rList.get(i).getNickname(),
									  rList.get(i).getLike(),
									  rList.get(i).getDeclare()));
			
		}
		close(con);
		
		return reviewList;
	}
	
	
	/**
	 * 리뷰 좋아요 하는 서비스
	 * @param r_no
	 * @param m_no
	 * @return
	 */
	public int insertLike(int r_no, int m_no) {
		int result = 0;
		Connection con = getConnection();
		
		int result1 = new ReviewDao().insertLike(con, r_no, m_no);
		int result2 = new ReviewDao().increaseLike(con, r_no);
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
	
	
	/**
	 * 리뷰 좋아요 취소 서비스
	 * @param r_no
	 * @param m_no
	 * @return
	 */
	public int deleteLike(int r_no, int m_no) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new ReviewDao().deleteLike(con, r_no, m_no);
		int result2 = new ReviewDao().decreaseLike(con, r_no);
		
		if(result1>0 && result2>0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
	
	
	
	
	
}//class end
