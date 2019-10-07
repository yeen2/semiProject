package com.kh.common;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	// 싱글톤 패턴 적용한 모든 메소드들을 static으로 작업
	
	public static Connection getConnection() {
		
		Connection conn = null;
		
		Properties prop = new Properties();
		
		// 실제로 구동되는 driver.properties는 WEB-INF\classes 안에 있는 파일이다.
		// 그 경로를 잡아주는 과정 
		String fileName = JDBCTemplate.class.getResource("/com/kh/sql/driver.properties").getPath();
		// 나중에 이거 제거
		//fileName=fileName.replace("WEB-INF/classes/", "");
		
		try {
			prop.load(new FileReader(fileName));
			
			String driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String user = prop.getProperty("user");
			String password = prop.getProperty("password");
			
			// 1. Driver 등록
			Class.forName(driver); 
			
			// 2. DBMS와 연결
			conn = DriverManager.getConnection(url, user, password);
			
			conn.setAutoCommit(false); 
				
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
		
		
	}
	
	// 전달받은 자원들 반납 시켜주는 메소드들
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 트랜잭션 처리해주는 메소드들 
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
