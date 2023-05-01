package service;

import java.sql.SQLException;

import model.dao.UserDao;
import model.dao.UserDaoImpl;
import model.dto.User;

public class UserServiceImpl implements UserService{
	
	private static UserService instance = new UserServiceImpl();
	private UserServiceImpl() {}
	public static UserService getInstance() {
		return instance;
	}
	
	UserDao dao = UserDaoImpl.getInstance();
	
	@Override
	public User select(String id) throws SQLException {
		return dao.select(id);
	}

	@Override
	public int insert(User user) throws SQLException {
		return dao.insert(user);
	}

	@Override
	public int update(User user) throws SQLException {
		return dao.update(user);
		
	}

	@Override
	public int delete(String id) throws SQLException {
		return dao.delete(id);
	}

}
