package com.tripback.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	// 싸피 DB 기본 정보 저장
	private final String url = "jdbc:mysql://localhost:3306/tripdb?serverTimezone=UTC";
	private final String username = "ssafy";
	private final String password = "ssafy";
	private final String drivername = "com.mysql.cj.jdbc.Driver";

	private static DBUtil instance = new DBUtil();
	private DBUtil() {
		try {
			Class.forName(drivername);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static DBUtil getInstance() {
		return instance;
	}
	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, username, password);
	}	
	public void close(AutoCloseable... closeables){
		for(AutoCloseable closeable:closeables){
			try {
				if(closeable!=null) closeable.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}