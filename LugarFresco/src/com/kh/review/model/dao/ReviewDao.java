package com.kh.review.model.dao;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.ReviewImg;
public class ReviewDao {

	private Properties prop = new Properties();
	
	public ReviewDao() {
		
		String fileName = ReviewDao.class.getResource("/com/kh/sql/review/review-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int insertReview(Connection con, Review r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r.getM_no());
			pstmt.setInt(2, r.getC_no());
			pstmt.setInt(3, r.getFlavor());
			pstmt.setInt(4, r.getPrice());
			pstmt.setInt(5, r.getService());
			pstmt.setDouble(6, r.getSum_avg());
			pstmt.setString(7, r.getR_content());
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int insertReviewImg(Connection con, ArrayList<ReviewImg> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReviewImg");
		
		for(int i=0; i<list.size(); i++) {
			ReviewImg r = list.get(i);
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, r.getImg_name());
				pstmt.setString(2, r.getImg_path());
				
				result += pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		return result;
	}
	
	
	public ArrayList<Review> selectReview(Connection con, int c_no, int m_no) {
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql= prop.getProperty("selectReview");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, m_no);
			pstmt.setInt(2, m_no);
			pstmt.setInt(3, c_no);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				list.add(new Review(rs.getInt("r_no"), 
									rs.getInt("m_no"), 
									rs.getInt("c_no"), 
									rs.getInt("flavor"), 
									rs.getInt("price"), 
									rs.getInt("service"), 
									rs.getDouble("sum_avg"), 
									rs.getString("r_content"), 
									rs.getDate("r_date"), 
									rs.getString("isdelete"), 
									rs.getInt("r_like"), 
									rs.getInt("r_declare"), 
									rs.getString("rr_content"), 
									rs.getDate("rr_date"),
									rs.getString("profile"),
									rs.getString("nickname"),
									rs.getInt("rlike"),
									rs.getInt("rdeclare")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
	public ArrayList<ReviewImg> selectReviewImg(Connection con, int r_no){
		
		ArrayList<ReviewImg> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectReviewImg");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new ReviewImg(rs.getInt("ri_no"), 
									   rs.getInt("r_no"), 
									   rs.getString("img_name"), 
									   rs.getString("img_path"), 
									   rs.getInt("img_level")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
	public int insertLike(Connection con, int r_no, int m_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLike");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_no);
			pstmt.setInt(2, m_no);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int increaseLike(Connection con, int r_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseLike");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_no);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
}//class end
