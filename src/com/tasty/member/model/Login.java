package com.tasty.member.model;

public class Login {
	public String id;
	public String pw;
	public String name;
	public int grade;

	public Login() {}
	
	public Login(String id, String name, int grade) {
		this.id = id;
		this.name = name;
		this.grade = grade;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Login [id=" + id + ", pw=" + pw + ", name=" + name + ", grade=" + grade + "]";
	}

}