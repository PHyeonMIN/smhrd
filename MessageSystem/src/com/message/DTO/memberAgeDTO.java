package com.message.DTO;

public class memberAgeDTO {
	String name;
	int age;
	String addr;
	String email;
	public memberAgeDTO(String name, int age, String addr, String email) {
		super();
		this.name = name;
		this.age = age;
		this.addr = addr;
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
