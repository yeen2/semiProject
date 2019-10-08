package com.kh.member.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.admin.model.vo.PageInfo;
import com.kh.cafe.model.vo.Cafe;
import com.kh.cafe.model.vo.CafeImg;
import com.kh.member.model.vo.Member;
import com.kh.owner.model.vo.PowerLink;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.ReviewImg;


public class MyPageDao {

	private Properties prop = new Properties();
	
	public MyPageDao() {
		String fileName = MyPageDao.class.getResource("/com/kh/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * --- 이메일과 비밀번호 체크 후 비밀번호 변경 ---
	 * @param conn
	 * @param id
	 * @param userPwd
	 * @param newPwd
	 * @return
	 */
	public int updatePwd(Connection conn, Member m, String newPwd) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, newPwd);
			pstmt.setString(2, m.getEmail());
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
	 * --- 이메일로 멤버 객체 1개 리턴하는 메소드 ---
	 * @param conn
	 * @param id
	 * @return
	 */
	public Member selectMember(Connection conn, Member m) {
		Member updateMem = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getEmail());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				updateMem = new Member(rset.getInt("m_no"),
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
			close(rset);
			close(pstmt);
		}
		return updateMem;
		
	}
	
	/**
	 * --- 회원탈퇴 처리 ---
	 * @param conn
	 * @param id
	 * @return
	 */
	public int deleteMember(Connection conn, String id) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * --- 나의 즐겨찾기 리스트 담기 ---
	 * @param conn
	 * @param mno
	 * @return
	 */
	public ArrayList<Cafe> selectFavoriteList(Connection conn, int mno) {
		ArrayList<Cafe> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFavoriteList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cafe(rset.getInt("c_no"),
								  rset.getString("cafe_name"),
								  rset.getInt("favorite"),
								  rset.getInt("count"),
								  rset.getInt("review_count"),
								  rset.getDouble("sum_avg"),
								  rset.getInt("f_no"),
								  rset.getString("img_path"),
								  rset.getString("img_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	/**
	 * --- 나의 리뷰 리스트 ---
	 * @param conn
	 * @param mno
	 * @return
	 */
	public ArrayList<Review> selectMyReviewList(Connection conn, int mno) {
		ArrayList<Review> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMyReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("r_no"),
									rset.getInt("c_no"), 
									rset.getInt("flavor"), 
									rset.getInt("price"), 
									rset.getInt("service"), 
									rset.getDouble("sum_avg"), 
									rset.getString("r_content"),
									rset.getDate("r_date"),
									rset.getInt("r_like"), 
									rset.getInt("r_declare"), 
									rset.getString("rr_content"), 
									rset.getDate("rr_date"),
									rset.getString("cafe_name"),
									rset.getString("profile"),
									rset.getString("nickname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * --- 나의 리뷰 이미지 ---
	 * @param conn
	 * @param rno
	 * @return
	 */
	public ArrayList<ReviewImg> selectMyReviewImg(Connection conn, int rno) {
		ArrayList<ReviewImg> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyReviewImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				list.add(new ReviewImg(rset.getInt("ri_no"),
									   rset.getInt("r_no"),
									   rset.getString("img_name"),
									   rset.getString("img_path"),
									   rset.getInt("img_level")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

	/**
	 * --- 나의 좋아요 누른 리뷰 리스트 ---
	 * @param conn
	 * @param mno
	 * @return
	 */
	public ArrayList<Cafe> selectLikeList(Connection conn, int mno) {
		ArrayList<Cafe> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLikeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cafe(rset.getInt("c_no"),
								  rset.getString("cafe_name"),
								  rset.getDouble("sum_avg"),
								  rset.getString("img1"),
								  rset.getString("img2"),
								  rset.getInt("l_no"),
								  rset.getInt("r_no"),
								  rset.getString("nickname"),
								  rset.getString("r_content"),
								  rset.getDate("r_date"),
								  rset.getInt("r_like"),
								  rset.getInt("r_declare"),
								  rset.getString("img3"),
								  rset.getString("img4")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		return list;
		
	}

	/**
	 * --- 카페 insert ---
	 * @param conn
	 * @param c
	 * @return
	 */
	public int insertCafe(Connection conn, Cafe c) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCafe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, c.getM_no());
			pstmt.setString(2, c.getCafe_name());
			pstmt.setString(3, c.getAddress());
			pstmt.setString(4, c.getAddress_detail());
			pstmt.setString(5, c.getPhone());
			pstmt.setString(6, c.getContent());
			pstmt.setString(7, c.getBr_name());
			pstmt.setString(8, c.getBr_up_name());
			pstmt.setString(9, c.getBr_path());
	
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	/**
	 * --- 카페 이미지 insert ---
	 * @param conn
	 * @param list
	 * @return
	 */
	public int insertCafeImg(Connection conn, ArrayList<CafeImg> list) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCafeImg");
		
		try {
			for(int i=0; i<list.size(); i++) {
				CafeImg ci = list.get(i);
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, ci.getImg_name());
				pstmt.setString(2, ci.getImg_path());
				pstmt.setInt(3, ci.getImg_level());
				
				result += pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * --- 회원 정보 수정 ---
	 * @param conn
	 * @param m
	 * @return
	 */
	public int updateMember(Connection conn, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getNickName());
			pstmt.setString(2, m.getProfile());
			pstmt.setString(3, m.getProfile_path());
			pstmt.setString(4, m.getEmail());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/**
	 * --- 프로필 사진을 제외하고 닉네임만 수정 ---
	 * @param conn
	 * @param m
	 * @return
	 */
	public int updateMemberNick(Connection conn, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMemberNick");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getNickName());
			pstmt.setString(2, m.getEmail());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	

	/**
	 * --- 나의 리뷰 삭제 ---
	 * @param conn
	 * @param rno
	 * @return
	 */
	public int deleteReview(Connection conn, int rno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	/**
	 * --- 회원가입 이메일 중복체크 ---
	 * @param conn
	 * @param email
	 * @return
	 */
	public int joinCheckEmail(Connection conn, String email) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("joinCheckEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * --- 회원가입 닉네임 중복체크 ---
	 * @param conn
	 * @param nickName
	 * @return
	 */
	public int joinCheckNickName(Connection conn, String nickName) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("joinCheckNickName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, nickName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
	}
	
	/**
	 * --- owner 카페의 리뷰 리스트 count ---
	 * @param conn
	 * @param mno
	 * @return
	 */
	public int ownerReviewCount(Connection conn, int mno) {
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("ownerReviewCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
		
	}
	
	/**
	 * --- owner 내 파워링크 리스트 count ---
	 * @param conn
	 * @param mno
	 * @return
	 */
	public int ownerPowerCount(Connection conn, int mno) {
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("ownerPowerCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
		
	}
	

	/**
	 * --- owner cafe list ---
	 * @param conn
	 * @param mno
	 * @return
	 */
	public ArrayList<Cafe> ownerCafeList(Connection conn, int mno) {
		ArrayList<Cafe> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("ownerCafeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cafe(rset.getInt("c_no"),
								  rset.getInt("m_no"),
								  rset.getString("cafe_name"),
								  rset.getString("address"),
								  rset.getString("address_detail"),
								  rset.getString("phone"),
								  rset.getString("content"),
								  rset.getString("isupload"),
								  rset.getString("ispower"),
								  rset.getDate("reg_date"),
								  rset.getInt("favorite"),
								  rset.getInt("count"),
								  rset.getInt("review_count"),
								  rset.getDouble("sum_avg"),
								  rset.getString("img_path"),
								  rset.getString("img_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

	public ArrayList<PowerLink> ownerPowerList(Connection conn, PageInfo pi, int mno) {
		ArrayList<PowerLink> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("ownerPowerList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, mno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new PowerLink(rset.getInt("p_no"),
									   rset.getInt("m_no"),
									   rset.getInt("c_no"),
									   rset.getDate("reg_date"),
									   rset.getDate("upload_date"),
									   rset.getInt("status"),
									   rset.getString("cafe_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public ArrayList<Review> ownerReviewList(Connection conn, PageInfo pi, int mno) {
		ArrayList<Review> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("ownerReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, mno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("r_no"),
									   rset.getInt("m_no"),
									   rset.getInt("c_no"),
									   rset.getInt("flavor"),
									   rset.getInt("price"),
									   rset.getInt("service"),
									   rset.getInt("sum_avg"),
									   rset.getString("r_content"),
									   rset.getDate("r_date"),
									   rset.getString("isdelete"),
									   rset.getInt("r_like"),
									   rset.getInt("r_declare"),
									   rset.getString("rr_content"),
									   rset.getDate("rr_date"),
									   rset.getString("cafe_name"),
									   rset.getString("img_name"),
									   rset.getString("img_path")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	
	public Cafe selectBrImgSelect(Connection conn, int cno) {
		Cafe file = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBrImgSelect");
		System.out.println(cno);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				file = new Cafe(rset.getString("br_name"),
								rset.getString("br_up_name"),
								rset.getString("br_path"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return file;
		
	}
	
	public ArrayList<Review> ownerReviewSelectCn(Connection conn, PageInfo pi, int mno, String search) {
		ArrayList<Review> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("ownerReviewSelectCn");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, mno);
			pstmt.setString(2, "%" + search + "%");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("r_no"),
						   rset.getInt("m_no"),
						   rset.getInt("c_no"),
						   rset.getInt("flavor"),
						   rset.getInt("price"),
						   rset.getInt("service"),
						   rset.getInt("sum_avg"),
						   rset.getString("r_content"),
						   rset.getDate("r_date"),
						   rset.getString("isdelete"),
						   rset.getInt("r_like"),
						   rset.getInt("r_declare"),
						   rset.getString("rr_content"),
						   rset.getDate("rr_date"),
						   rset.getString("cafe_name"),
						   rset.getString("img_name"),
						   rset.getString("img_path")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

	public ArrayList<Review> ownerReviewSelectCt(Connection conn, PageInfo pi, int mno, String search) {
		ArrayList<Review> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("ownerReviewSelectCt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, mno);
			pstmt.setString(2, "%" + search + "%");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("r_no"),
						   rset.getInt("m_no"),
						   rset.getInt("c_no"),
						   rset.getInt("flavor"),
						   rset.getInt("price"),
						   rset.getInt("service"),
						   rset.getInt("sum_avg"),
						   rset.getString("r_content"),
						   rset.getDate("r_date"),
						   rset.getString("isdelete"),
						   rset.getInt("r_like"),
						   rset.getInt("r_declare"),
						   rset.getString("rr_content"),
						   rset.getDate("rr_date"),
						   rset.getString("cafe_name"),
						   rset.getString("img_name"),
						   rset.getString("img_path")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

	public int insertPower(Connection conn, int mno, int cno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPower");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			pstmt.setInt(2, cno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

	public int insertPay(Connection conn, int mno, int price) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPay");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			pstmt.setInt(2, price);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

	

	
	
}//class end


