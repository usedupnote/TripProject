package com.ssafy.enjoytrip.dto;

import lombok.*;

/**
 * grade_id 의 값
 * 0 : admin,
 * 1 : bronze,
 * 2 : silver,
 * 3 : gold,
 * 4 : platinum,
 * 5 : diamond,
 * 6 : ruby
 */
@Getter
@Builder
@ToString
public class User {
	private final String email;
	private final String password;
	private final String name;
	private final String img;
	private final char gender;
	private final int grade_id;
	private final String nickname;
	private final int age;
	private final String join_at;
	private final String last_login;

	private final String grade;
}
