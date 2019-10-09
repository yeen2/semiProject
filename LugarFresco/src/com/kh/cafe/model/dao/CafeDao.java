package com.kh.cafe.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.naming.spi.DirStateFactory.Result;

import com.kh.cafe.model.vo.Cafe;
import com.kh.cafe.model.vo.CafeImg;
import com.kh.cafe.model.vo.PageInfo;

public class CafeDao {

	private Properties prop = new Properties();
	
	public CafeDao() {
		
		String fileName = CafeDao.class.getResource("/com/kh/sql/cafe/cafe-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	public ArrayList<Cafe> selectCafeList(Connection con){
		
		ArrayList<Cafe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCafeList");
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Cafe(rs.getInt("c_no"), 
								  rs.getInt("m_no"), 
								  rs.getString("cafe_name"), 
								  rs.getString("address"), 
								  rs.getString("address_detail"), 
								  rs.getString("phone"), 
								  rs.getString("content"), 
								  rs.getString("isupload"), 
								  rs.getString("ispower"), 
								  rs.getInt("favorite"),
								  rs.getInt("sum_avg"),
								  rs.getString("titleimg"),
								  rs.getInt("")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}//end
	*/
	
	/*
	public Cafe selectOneCafe(Connection con, int c_no) {
		Cafe c = new Cafe();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectOneCafe");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				c = new Cafe(rs.getInt("c_no"),
							 rs.getInt("m_no"),
							 rs.getString("cafe_name"), 
							 rs.getString("address"), 
							 rs.getString("address_detail"), 
							 rs.getString("phone"), 
							 rs.getString("content"), 
							 rs.getString("isupload"), 
							 rs.getString("ispower"), 
							 rs.getInt("favorite"),
							 rs.getInt("count"),
							 rs.getInt("review_count"),
							 rs.getInt("sum_avg"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return c;
	}//end
	*/
	public Cafe selectOneCafe(Connection con, int c_no) {
		Cafe c = new Cafe();
		ArrayList<CafeImg> imgList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectOneCafe");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				imgList.add(new CafeImg(rs.getInt("c_no"),
										rs.getInt("ci_no"),
										rs.getString("img_name"),
										rs.getString("img_path"),
										rs.getInt("img_level")
							));
				
				c = new Cafe(rs.getInt("c_no"),
							 rs.getInt("m_no"),
							 rs.getString("cafe_name"), 
							 rs.getString("address"), 
							 rs.getString("address_detail"), 
							 rs.getString("phone"), 
							 rs.getString("content"), 
							 rs.getString("isupload"), 
							 rs.getString("ispower"), 
							 rs.getInt("favorite"),
							 rs.getInt("count"),
							 rs.getInt("review_count"),
							 rs.getInt("sum_avg"),
							 imgList
							);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return c;
	}//end
	
	
	
	
	
	public ArrayList<Cafe> selectNavSearch(Connection con, String keyword){
		
		ArrayList<Cafe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectNavSearch");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			
			// 구현해야 함
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	public int checkFavorite(Connection con, int m_no, int c_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("checkFavorite");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			pstmt.setInt(2, m_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
	
	public int insertFavorite(Connection con, int m_no, int c_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFavorite");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			pstmt.setInt(2, m_no);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int increaseCafeFavorite(Connection con, int c_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCafeFavorite");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	public int deleteFavorite(Connection con, int m_no, int c_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFavorite");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			pstmt.setInt(2, m_no);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int decreaseCafeFavorite(Connection con, int c_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("decreaseCafeFavorite");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int getListCount(Connection con) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("getListCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
	/**
	 * 페이징 처리 한 카페리스트 불러오기
	 * @param con
	 * @param pi
	 * @return
	 */
	public ArrayList<Cafe> selectList(Connection con, PageInfo pi, int m_no){

		ArrayList<Cafe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, m_no);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Cafe(rs.getInt("c_no"), 
								  rs.getInt("m_no"), 
								  rs.getString("cafe_name"), 
								  rs.getString("address"), 
								  rs.getString("address_detail"), 
								  rs.getString("phone"), 
								  rs.getString("content"), 
								  rs.getString("isupload"), 
								  rs.getString("ispower"), 
								  rs.getInt("favorite"),
								  rs.getInt("sum_avg"),
								  rs.getString("titleimg"),
								  rs.getInt("myfavorite")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int increaseCount(Connection con, int c_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	/**
	 * 메인에서 불러오는 카페리스트
	 * @param con
	 * @param m_no
	 * @param str
	 * @return
	 */
	public ArrayList<Cafe> mainCafeList(Connection con, int m_no, String str){
		ArrayList<Cafe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty(str);
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, m_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				double avg= Math.round((rs.getDouble("sum_avg")*100)/100);
				
				list.add(new Cafe(rs.getInt("c_no"), 
								  rs.getInt("m_no"), 
								  rs.getString("cafe_name"), 
								  rs.getString("address"), 
								  rs.getString("address_detail"), 
								  rs.getString("phone"), 
								  rs.getString("content"), 
								  rs.getString("isUpload"), 
								  rs.getString("isPower"), 
								  rs.getInt("favorite"), 
								  rs.getInt("count"), 
								  avg, 
								  rs.getString("titleImg"), 
								  rs.getInt("myFavorite"), 
								  rs.getInt("review_count")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;		
	}
	
	
	
	
	
}//class end
