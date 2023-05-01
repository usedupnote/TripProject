package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DBUtil.DBUtil;
import model.dto.User;

public class UserDaoImpl implements UserDao{
	private static UserDao instance = new UserDaoImpl();
	private UserDaoImpl() {}
	public static UserDao getInstance() {
		return instance;
	}
	
	private DBUtil util = DBUtil.getInstance();
	@Override
	public User select(String id) throws SQLException {
		User result = null;
		
		String sql = "select * from user where id=?";
		try(Connection conn = util.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);) {
			
			ps.setString(1, id);
			try(ResultSet rs = ps.executeQuery();) {
				if(rs.next()) {
					result = new User(rs.getString("name"), rs.getString("id"), rs.getString("password"), rs.getString("email"), rs.getInt("age"));
				}
			}
		}
		return result;
	}

	@Override
	public int insert(User user) throws SQLException {
		String sql = "insert into user values (?, ?, ?, ?, ?)";
		try(Connection conn = util.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);) {
				ps.setString(1, user.getName());
				ps.setString(2, user.getId());
				ps.setString(3, user.getPassword());
				ps.setString(4, user.getEmail());
				ps.setInt(5, user.getAge());
				return ps.executeUpdate();
			}
	}

	@Override
	public int update(User user) throws SQLException {
		String sql = "update user set name = ?, password = ?, email = ?, age = ? where id = ?";
		String id = user.getId();
		String name = user.getName();
		String password = user.getPassword();
		String email = user.getEmail();
		int age = user.getAge();
		try(Connection conn = util.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);) {			
				ps.setString(1, name);
				ps.setString(2, password);
				ps.setString(3, email);
				ps.setInt(4, age);
				ps.setString(5, id);
				return ps.executeUpdate();
			}
	}

	@Override
	public int delete(String id) throws SQLException {
		String sql = "delete from user where id = ?";
		try(Connection conn = util.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);) {			
			ps.setString(1, id);
			return ps.executeUpdate();
		}
		
	}

}
