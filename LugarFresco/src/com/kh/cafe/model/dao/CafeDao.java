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

import com.kh.cafe.model.vo.Cafe;
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
								  rs.getInt("sum_avg")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}//end
	
	
	
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
	
	
	public ArrayList<Cafe> selectList(Connection con, PageInfo pi){

		ArrayList<Cafe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
								  rs.getInt("sum_avg")));
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
