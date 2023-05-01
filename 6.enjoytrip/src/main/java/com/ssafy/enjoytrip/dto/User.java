package com.ssafy.enjoytrip.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class User {
	private String email;
	private String password;
	private String img;
	private char gender;
	
	/**
	 * 0 : Admin,
	 * 1 : Bronze,
	 * 2 : Silver,
	 * 3 : Gold,
	 * 4 : Platinum,
	 * 5 : Diamond,
	 * 6 : Ruby
	 */
	private int grade_id;
	
	private String nickname;
	private int age;
	private String join_at;
	private String last_login;
	
	public User(String email, String password, char gender, String nickname, int age) {
		super();
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.nickname = nickname;
		this.age = age;
		
		this.img = null;
		this.grade_id = 1;	
	}
}
