package com.tripback.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tripback.dto.User;
import com.tripback.util.DBUtil;

public class UserDaoImpl implements UserDao {
	private static UserDao instance = new UserDaoImpl();
	private UserDaoImpl() {};
	public static UserDao getInstance() {
		return instance;
	}

	private DBUtil util=DBUtil.getInstance();
	
	@Override
	public int insert(User user) throws SQLException {

		String sql = "insert into users values(?,?,?,?,?,?)";
		
		try (
			Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
		) {
			ps.setString(1, user.getId());
			ps.setString(2, user.getPass());
			ps.setString(3, user.getName());
			ps.setString(4, user.getEmail());
			ps.setInt(5, user.getAge());
			ps.setString(6, user.getImg());
			
			return ps.executeUpdate();
		}
	}
	
	@Override
	public User select(String id) throws SQLException {
		User user = null;
		String sql = "select * from users where id=?";
		System.out.println(sql);
		try (
			Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
		) {
			ps.setString(1, id);
			try (
				ResultSet rs = ps.executeQuery();	
			) {
				if (rs.next()) {
					user = new User(rs.getString("name"), rs.getString("id"), rs.getString("pass"), rs.getString("email"), rs.getInt("age"), rs.getString("img"));
				}
			}
		}
		return user;
	}
	
	@Override
	public List<User> selectAll() throws SQLException {
		List<User> users = new ArrayList<>();
		String sql = "select * from users";
		try (
				Connection con = util.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
			) {
				try (
					ResultSet rs = ps.executeQuery();
				){
					while (rs.next()) {
						users.add(new User(rs.getString("id"), rs.getString("pass"), rs.getString("name"), rs.getString("email"), rs.getInt("age"), rs.getString("img")));
					}
				}
			}
		return users;
	}
	
	@Override
	public int delete(String id) throws SQLException {
		String sql = "delete from users where id=?;";
		System.out.println("delete from users where id=?;");
		try (
			Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
		){
			ps.setString(1, id);
			System.out.println("id:" + id);
			return ps.executeUpdate();
		}
	}
	
	public static void main(String[] args) throws Exception{
		UserDao dao=UserDaoImpl.getInstance();
		dao.insert(new User("id", "pass", "name", "email", 500, "img"));
		for(User user:dao.selectAll()) System.out.println(user);
		dao.delete("id");
	}
	@Override
	public int update(User user) throws SQLException {
		String sql = "UPDATE tripdb.users SET name = ?, email = ? WHERE id = ?;";
		try (
				Connection con = util.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
			){
				ps.setString(1, user.getName());
				ps.setString(2, user.getEmail());
				ps.setString(3, user.getId());
				return ps.executeUpdate();
			}
	}
}
