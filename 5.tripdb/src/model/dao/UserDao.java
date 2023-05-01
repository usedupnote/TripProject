package model.dao;

import java.sql.SQLException;

import model.dto.User;

public interface UserDao {
	User select(String id) throws SQLException; // 로그인, 비밀번호 찾기 할때 검색
	int insert(User user) throws SQLException; // 회원가입
	int update(User user) throws SQLException; // 회원정보수정
	int delete(String id) throws SQLException; // 회원탈퇴
} 
