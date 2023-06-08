package com.ssafy.enjoytrip.model.service;

import java.util.Map;

public interface JwtService {
	<T> String create(String key, T data, String subject, long expire);
	<T> String createAccessToken(String key, T data);
	<T> String createRefreshToken(String key, T data);
	Map<String, Object> get(String key);
	String getUserId();
	boolean checkToken(String jwt);
}
