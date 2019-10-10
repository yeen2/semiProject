package com.kh.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.PowerLink.model.vo.PowerLink;
import com.kh.admin.model.vo.PageInfo;
import com.kh.cafe.model.vo.Cafe;
import com.kh.common.JDBCTemplate;
import com.kh.member.model.vo.Member;
import com.kh.question.model.vo.QnAList;
import com.kh.review.model.vo.Declare;


public class AdminPageDao {
	
	private Properties prop = new Properties();

	public AdminPageDao() {

		String fileName = AdminPageDao.class.getResource("/com/kh/sql/admin/admin-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/**燁삳똾�읂占쎌읈筌ｏ옙 野껊슣�뻻疫뀐옙 揶쏉옙占쎈땾
	 * @param conn
	 * @return
	 */
	public ArrayList<Cafe> selectCafeList(Connection conn, PageInfo pi) {
		
		ArrayList<Cafe> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCafeList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
	
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cafe(rset.getInt("c_no"),
						 rset.getInt("m_no"),
						 rset.getString("cafe_name"),
						 rset.getString("address"),
						 rset.getString("address_detail"),
						 rset.getString("phone"),
						 rset.getString("content"),
						 rset.getString("br_name"),
						 rset.getString("br_up_name"),
						 rset.getString("isupload"),
						 rset.getString("ispower"),
						 rset.getDate("reg_date"),
						 rset.getDate("upload_date"),
						 rset.getString("isdelete"),
						 rset.getInt("review_count"),
						 rset.getString("profile_path"),
						 rset.getString("nickname")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
		
	}

	/** 占쎈읂占쎌뵠筌욑옙 筌ｌ꼶�봺�몴占� 占쎌맄占쎈립 cafeList 野껊슣�뻻疫뀐옙 揶쏉옙占쎈땾
	 * @param conn
	 * @return
	 */
	public int getListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
	
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		
		try {
		
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt(1);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return listCount;
	}

	public int updateIsupload(Connection conn, String arr) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE CAFE SET ISUPLOAD = 'Y' WHERE C_NO IN ("+arr+")";
		System.out.println(sql);
		
//		for(int i = 0; i < arr.length; i++ ) {
//			
//			if(i == arr.length-1) {
//			
//				sql += arr[i] + ")";
//				
//			}else {
//				
//				sql += arr[i] + ",";
//				
//			}
//		}
		
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Cafe> selectCafeNameSearch(Connection conn, String search) {

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ArrayList<Cafe> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectCafeNameSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cafe(rset.getInt("c_no"),
						 rset.getInt("m_no"),
						 rset.getString("cafe_name"),
						 rset.getString("address"),
						 rset.getString("address_detail"),
						 rset.getString("phone"),
						 rset.getString("content"),
						 rset.getString("br_name"),
						 rset.getString("br_up_name"),
						 rset.getString("isupload"),
						 rset.getString("ispower"),
						 rset.getDate("reg_date"),
						 rset.getDate("upload_date"),
						 rset.getString("isdelete"),
						 rset.getString("nickname")));
				
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(rset);
			
			JDBCTemplate.close(pstmt);
		}
				
		return list;
		
	
	}

	public ArrayList<Cafe> selectApplicantNameSearch(Connection conn, String search) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ArrayList<Cafe> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectApplicantNameSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
		   
			while(rset.next()) {
				list.add(new Cafe(rset.getInt("c_no"),
						 rset.getInt("m_no"),
						 rset.getString("cafe_name"),
						 rset.getString("address"),
						 rset.getString("address_detail"),
						 rset.getString("phone"),
						 rset.getString("content"),
						 rset.getString("br_name"),
						 rset.getString("br_up_name"),
						 rset.getString("isupload"),
						 rset.getString("ispower"),
						 rset.getDate("reg_date"),
						 rset.getDate("upload_date"),
						 rset.getString("isdelete"),
						 rset.getString("nickname")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(rset);
			
			JDBCTemplate.close(pstmt);
		}
		
		
		
		return list;
		
	
	}

	public int updateIsdelete(Connection conn, String arr) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE CAFE SET ISDELETE = 'Y' WHERE C_NO IN ("+arr+")";
		
		System.out.println(sql);
		
		try {

			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	
public ArrayList<Member> selectMemberList(Connection conn, PageInfo pi) {
		
		ArrayList<Member> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberList");
		
		System.out.println("selectMember�떎�뻾");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
	
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("m_no"),
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
						 rset.getDate("out_date")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		System.out.println(list);
		return list;
		
	}
	
	
	public ArrayList<Member> selectMemberEmailSearch(Connection conn, String search) {

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectMemberEmailSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
				list.add(new Member(rset.getInt("m_no"),
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
						 rset.getDate("out_date")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return list;
		
	}

	public ArrayList<Member> selectMemberNickNameSearch(Connection conn, String search) {

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectMemberNickNameSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Member(rset.getInt("m_no"),
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
						 rset.getDate("out_date")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		System.out.println(list);

		return list;
		
	}

	public int getMemberListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
	
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMemberListCount");
		
		try {
		
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt(1);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return listCount;
	}

	public int updateMemberDelete(Connection conn, String arr) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE Member SET ISOUT = 'Y', OUT_DATE = SYSDATE WHERE M_NO IN ("+arr+")";
		
		System.out.println(sql);
		
		try {

			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Member> WriteCount(Connection conn) {
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<>();
		
		String sql = "SELECT PROFILE, PROFILE_PATH, nickname, (SELECT COUNT(*) FROM REVIEW R WHERE R.M_NO=M.M_NO)REVIEW_COUNT FROM MEMBER M";
		
		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Member(
						 rset.getString(1),
						 rset.getString(2),
						 rset.getString(3),
						 rset.getInt(4)));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		System.out.println("ddd");
		System.out.println(list);	

		return list;
		
	}

	public ArrayList<Cafe> CafeImgWriteCount(Connection conn) {
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ArrayList<Cafe> list = new ArrayList<>();
		
		String sql = "SELECT C_NO, IMG_PATH,CAFE_NAME,(SELECT COUNT(*) FROM REVIEW R WHERE R.M_NO=C.M_NO)REVIEW_COUNT FROM CAFE C JOIN CAFEIMG USING (C_NO)";
		
		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cafe(
						rset.getInt(1),
						rset.getString(2),
						rset.getString(3),
						rset.getInt(4)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		System.out.println("ddd");
		System.out.println(list);	

		return list;
		
	}

	public ArrayList<Declare> selectDeclareList(Connection conn, PageInfo pi) {
		
		ArrayList<Declare> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDeclareList");
		

		try {
			
			pstmt = conn.prepareStatement(sql);
	
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Declare(rset.getInt("D_NO"),
									rset.getInt("R_NO"),
									rset.getInt("M_NO"),
									rset.getString("NICKNAME"),
									rset.getString("CATEGORY"),
									rset.getString("CONTENT"),
									rset.getDate("REG_DATE"),
									rset.getString("REVIEW"),
									rset.getInt("REVIEW_COUNT"),
									rset.getString("PROFILE"),
									rset.getString("PROFILE_PATH")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		for(Declare d : list) {
			System.out.println(d);
		}
		
		return list;
		
	}

	public int getDeclareList(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
	
		ResultSet rset = null;
		
		String sql = prop.getProperty("getDeclareList");
		
		try {
		
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt(1);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Declare> selectDeclareContentSearch(Connection conn, String search) {
	
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ArrayList<Declare> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectDeclareContentSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
		   
			while(rset.next()) {
				list.add(new Declare(rset.getInt("D_NO"),
						 rset.getString("R_CONTENT"),
						 rset.getString("CONTENT"),
						 rset.getString("NICKNAME"),
						 rset.getDate("REG_DATE")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(rset);
			
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	
	}
	public ArrayList<Declare> selectDeclareNameSearch(Connection conn, String search) {
	
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ArrayList<Declare> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectDeclareNameSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
		   
			while(rset.next()) {
				list.add(new Declare(rset.getInt("D_NO"),
						 rset.getString("R_CONTENT"),
						 rset.getString("CONTENT"),
						 rset.getString("NICKNAME"),
						 rset.getDate("REG_DATE")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(rset);
			
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int getPowerLinkCount(Connection conn) {
		// TODO Auto-generated method stub
		int listCount = 0;
		
		PreparedStatement pstmt = null;
	
		ResultSet rset = null;
		
		String sql = prop.getProperty("getPowerLinkCount");
		
		try {
		
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt(1);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<PowerLink> selectPowerLinkList(Connection conn, PageInfo pi){
		
		ArrayList<PowerLink> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPowerLinkList");
		
		try {
		
			pstmt = conn.prepareStatement(sql);
		
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			System.out.println(startRow);
			System.out.println(endRow);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new PowerLink(rset.getInt("p_no"),
									   rset.getString("cafe_name"),
									   rset.getString("nickname"),
									   rset.getDate("reg_date"),
									   rset.getDate("upload_date"),
									   rset.getInt("status")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public ArrayList<PowerLink> selectPowrLinkApplicantNameSearch(Connection conn, String search) {
		// TODO Auto-generated method stub
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		ArrayList<PowerLink> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectPowrLinkApplicantNameSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
		   
			while(rset.next()) {
				
				list.add(new PowerLink(rset.getInt("p_no"),
						 rset.getString("cafe_name"),
						 rset.getString("nickname"),
						 rset.getDate("reg_date"),
						 rset.getDate("upload_date"),
						 rset.getInt("status")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(rset);
			
			JDBCTemplate.close(pstmt);
		}
		return list;
	}


	public ArrayList<PowerLink> selectPowerLinkCafeNameSearch(Connection conn, String search) {
		// TODO Auto-generated method stub
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ArrayList<PowerLink> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectPowerLinkCafeNameSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
		   
			while(rset.next()) {
				list.add(new PowerLink(rset.getInt("p_no"),
						 rset.getString("cafe_name"),
						 rset.getString("nickname"),
						 rset.getDate("reg_date"),
						 rset.getDate("upload_date"),
						 rset.getInt("status")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int getPowerCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
	
		ResultSet rset = null;
		
		String sql = prop.getProperty("getPowerCount");
		
		try {
		
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt(1);
				System.out.println(listCount);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return listCount;
	}

	public int updatePowerLink(Connection conn, String arr) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE POWERLINK SET STATUS = STATUS + 1 WHERE P_NO IN ("+arr+")";
		
		try {
		
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
			
			System.out.println("=================================================");
			System.out.println(result);
			System.out.println("=================================================");
		} catch (SQLException e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
	
		} finally {
		
			JDBCTemplate.close(pstmt);
		
		}
		
		
		return result;
	}

	public int powerCancel(Connection conn, String arr) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE POWERLINK SET STATUS = STATUS - 1 WHERE P_NO IN ("+arr+")";
		
		try {
		
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
			
			System.out.println("=================================================");
			System.out.println(result);
			System.out.println("=================================================");
		} catch (SQLException e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
	
		} finally {
		
			JDBCTemplate.close(pstmt);
		
		}
		
		
		return result;
	}

	public int PowerLinkCount(Connection conn) {
		
		ResultSet rset = null;
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("getPowerCount");
		
		try {
		
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				result = rset.getInt(1);
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("================================3=============");
		System.out.println(result);
		System.out.println("------------------3--------------3---------");
		
		return result;
	}

	public ArrayList<Cafe> selectCafeApplyList(Connection conn, PageInfo pi) {
		
		ArrayList<Cafe> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCafeApplyList");
		
		try {
		
			pstmt = conn.prepareStatement(sql);
		
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			System.out.println(startRow);
			System.out.println(endRow);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cafe(rset.getInt("c_no"),
									   rset.getString("cafe_name"),
									   rset.getString("nickname"),
									   rset.getDate("reg_date"),
									   rset.getDate("upload_date"),
									   rset.getString("isupload")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		System.out.println("=========================================");

		System.out.println("=========================================");
		System.out.println(list);
		System.out.println("=========================================");
		return list;
	}

	public ArrayList<Cafe> selectCafeApplyApplicantNameSearch(Connection conn, String search) {
		
		ResultSet rset = null;
		
		PreparedStatement pstmt = null;
		
		ArrayList<Cafe> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectCafeApplyApplicantNameSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cafe(rset.getInt("c_no"),
								  rset.getString("cafe_name"),
								  rset.getString("nickname"),
								  rset.getDate("reg_date"),
								  rset.getDate("upload_date"),
								  rset.getString("isupload")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
		
	}

	public ArrayList<Cafe> selectCafeApplyCafeNameSearch(Connection conn, String search) {
		
		ResultSet rset = null;
		
		PreparedStatement pstmt = null;
		
		ArrayList<Cafe> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectCafeApplyCafeNameSearch");
		
		try {
		
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cafe(rset.getInt("c_no"),
								rset.getString("cafe_name"),
								rset.getString("nickname"),
								rset.getDate("reg_date"),
								rset.getDate("upload_date"),
								rset.getString("isupload")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
		
	}

	public int getCafeApplyCount(Connection conn) {
		
		ResultSet rset = null;
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("getCafeApplyCount");
		
		try {
		
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				result = rset.getInt(1);
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("================================3=============");
		System.out.println(result);
		System.out.println("------------------3--------------3---------");
		
		return result;
	
	}

	public int cafeRegistraion(Connection conn, String arr) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE CAFE SET ISUPLOAD = 'Y' WHERE C_NO IN ("+arr+")";
		
		try {
		
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
			
			System.out.println("=================================================");
			System.out.println(result);
			System.out.println("=================================================");
		} catch (SQLException e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
	
		} finally {
		
			JDBCTemplate.close(pstmt);
		
		}
		
		
		return result;
	

	}

	public ArrayList<QnAList> selectQnAList(Connection conn, PageInfo pi) {
		
		ArrayList<QnAList> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList");

		try {
	
			pstmt = conn.prepareStatement(sql);
	
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QnAList(rset.getInt("q_no"),
								rset.getString("q_title"),
								rset.getString("q_content"),
								rset.getString("nickname"),
								rset.getDate("q_date"),
								rset.getDate("a_date"),
								rset.getString("isanswer")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
		
	
	}

	public ArrayList<QnAList> selectQnaApplicantNameSearch(Connection conn, String search) {
		
		ResultSet rset = null;
		
		PreparedStatement pstmt = null;
		
		ArrayList<QnAList> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectQnaApplicantNameSearch");
		
		try {
		
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QnAList(rset.getInt("q_no"),
								rset.getString("q_title"),
								rset.getString("q_content"),
								rset.getString("nickname"),
								rset.getDate("q_date"),
								rset.getDate("a_date"),
								rset.getString("isanswer")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
		
	
	}

	public ArrayList<QnAList> selectQnaTitleSearch(Connection conn, String search) {
		
		ResultSet rset = null;
		
		PreparedStatement pstmt = null;
		
		ArrayList<QnAList> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectQnaTitleSearch");
		
		try {
		
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QnAList(rset.getInt("q_no"),
								rset.getString("q_title"),
								rset.getString("q_content"),
								rset.getString("nickname"),
								rset.getDate("q_date"),
								rset.getDate("a_date"),
								rset.getString("isanswer")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
		
	
	}

	public int powerLinkStatusChange(Connection conn, int ck, int no) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("powerLinkStatusChange");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ck);
			
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
		}
		
		return result;

	}
        
}