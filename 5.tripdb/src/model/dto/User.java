package model.dto;

import lombok.*;


public class User {
	private String name;
	private String id;
	private String password;
	private String email;
	private int age;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public User(String name, String id, String password, String email, int age) {
		super();
		this.name = name;
		this.id = id;
		this.password = password;
		this.email = email;
		this.age = age;
	}
	@Override
	public String toString() {
		return "User [name=" + name + ", id=" + id + ", password=" + password + ", email=" + email + ", age=" + age
				+ "]";
	}
	
}
