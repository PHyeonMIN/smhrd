package com.memberDTO;

public class tm_memberDTO {

	private String mb_id;
	private String mb_pw;
	private String mb_name;
	private int mb_age;
	private String mb_gender;
	private String mb_email;
	private String mb_addr;
	private String mb_img;
	private String mb_nickname;
	private int mb_follow;
	private int mb_follower;
	private String mb_joindate;
	private String admin_yn;

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_pw() {
		return mb_pw;
	}

	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public int getMb_age() {
		return mb_age;
	}

	public void setMb_age(int mb_age) {
		this.mb_age = mb_age;
	}

	public String getMb_gender() {
		return mb_gender;
	}

	public void setMb_gender(String mb_gender) {
		this.mb_gender = mb_gender;
	}

	public String getMb_email() {
		return mb_email;
	}

	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}

	public String getMb_addr() {
		return mb_addr;
	}

	public void setMb_addr(String mb_addr) {
		this.mb_addr = mb_addr;
	}

	public String getMb_img() {
		return mb_img;
	}

	public void setMb_img(String mb_img) {
		this.mb_img = mb_img;
	}

	public String getMb_nickname() {
		return mb_nickname;
	}

	public void setMb_nickname(String mb_nickname) {
		this.mb_nickname = mb_nickname;
	}

	public int getMb_follow() {
		return mb_follow;
	}

	public void setMb_follow(int mb_follow) {
		this.mb_follow = mb_follow;
	}

	public int getMb_follower() {
		return mb_follower;
	}

	public void setMb_follower(int mb_follower) {
		this.mb_follower = mb_follower;
	}

	public String getMb_joindate() {
		return mb_joindate;
	}

	public void setMb_joindate(String mb_joindate) {
		this.mb_joindate = mb_joindate;
	}

	public String getAdmin_yn() {
		return admin_yn;
	}

	public void setAdmin_yn(String admin_yn) {
		this.admin_yn = admin_yn;
	}

	public tm_memberDTO(String mb_id, String mb_pw, String mb_name, int mb_age, String mb_gender, String mb_email,
			String mb_addr, String mb_img, String mb_nickname, int mb_follow, int mb_follower, String mb_joindate,
			String admin_yn) {
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_name = mb_name;
		this.mb_age = mb_age;
		this.mb_gender = mb_gender;
		this.mb_email = mb_email;
		this.mb_addr = mb_addr;
		this.mb_img = mb_img;
		this.mb_nickname = mb_nickname;
		this.mb_follow = mb_follow;
		this.mb_follower = mb_follower;
		this.mb_joindate = mb_joindate;
		this.admin_yn = admin_yn;
	}

	public tm_memberDTO(String mb_id, String mb_pw, String mb_name, int mb_age, String mb_gender, String mb_email,
			String mb_addr, String mb_img, String mb_nickname, int mb_follow, int mb_follower, String admin_yn) {
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_name = mb_name;
		this.mb_age = mb_age;
		this.mb_gender = mb_gender;
		this.mb_email = mb_email;
		this.mb_addr = mb_addr;
		this.mb_img = mb_img;
		this.mb_nickname = mb_nickname;
		this.mb_follow = mb_follow;
		this.mb_follower = mb_follower;
		this.admin_yn = admin_yn;
	}

	public tm_memberDTO(String mb_id, String mb_pw) {
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
	}

	public tm_memberDTO(String mb_id, int mb_follow, int mb_follower) {
		this.mb_id = mb_id;
		this.mb_follow = mb_follow;
		this.mb_follower = mb_follower;
	}

	
}