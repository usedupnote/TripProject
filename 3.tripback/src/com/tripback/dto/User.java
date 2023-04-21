package com.tripback.dto;

public class User {
	private String id;
	private String pass;
	private String name;
	private String email;
	private int age;
	private String img;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public User(String name, String id, String pass, String email, int age, String img) {
		this.name = name;
		this.id = id;
		this.pass = pass;
		this.email = email;
		this.age = age;
		this.img = img;
	}
}
