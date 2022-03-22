package com.followDTO;

public class tm_followDTO {

	private int f_seq;
	private String f_id;
	private String f_date;
	private String mb_id;

	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public String getF_id() {
		return f_id;
	}

	public void setF_id(String f_id) {
		this.f_id = f_id;
	}

	public String getF_date() {
		return f_date;
	}

	public void setF_date(String f_date) {
		this.f_date = f_date;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public tm_followDTO(int f_seq, String f_id, String f_date, String mb_id) {
		this.f_seq = f_seq;
		this.f_id = f_id;
		this.f_date = f_date;
		this.mb_id = mb_id;
	}

	public tm_followDTO() {
	}

	public tm_followDTO(String f_id, String mb_id) {
		this.f_id = f_id;
		this.mb_id = mb_id;
	}
	

}
