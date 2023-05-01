package DBUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
	// DB와 연결하기위해 필요한 DB의 URL
	private final String url = "jdbc:mysql://localhost:3306/tripdb?serverTimezone=UTC";
	// DB의 USER 이름
	private final String username = "ssafy";
	// 위 USER의 PASSWORD
	private final String password = "ssafy";
	// Mysql 드라이버 클래스 이름
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
	
	// 자원 해제
	public void close(Connection conn, PreparedStatement pstmt) {

		try {
			if (pstmt != null)
				pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void close(AutoCloseable...closeables) {
		for(AutoCloseable closeable : closeables) {
			try {
				if(closeable!=null) closeable.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(conn, pstmt);
	}
}