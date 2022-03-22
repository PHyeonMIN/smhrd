package com.snsDTO;

public class tm_snsDTO {

	private int tb_seq;
	private String tb_title;
	private String tb_content;
	private String tb_file;
	private int tb_cnt;
	private int tb_likes;
	private int tb_total;
	private String tb_open;
	private String mb_id;
	private int travel_seq;

	public int getTb_seq() {
		return tb_seq;
	}

	public void setTb_seq(int tb_seq) {
		this.tb_seq = tb_seq;
	}

	public String getTb_title() {
		return tb_title;
	}

	public void setTb_title(String tb_title) {
		this.tb_title = tb_title;
	}

	public String getTb_content() {
		return tb_content;
	}

	public void setTb_content(String tb_content) {
		this.tb_content = tb_content;
	}

	public String getTb_file() {
		return tb_file;
	}

	public void setTb_file(String tb_file) {
		this.tb_file = tb_file;
	}

	public int getTb_cnt() {
		return tb_cnt;
	}

	public void setTb_cnt(int tb_cnt) {
		this.tb_cnt = tb_cnt;
	}

	public int getTb_likes() {
		return tb_likes;
	}

	public void setTb_likes(int tb_likes) {
		this.tb_likes = tb_likes;
	}

	public int getTb_total() {
		return tb_total;
	}

	public void setTb_total(int tb_total) {
		this.tb_total = tb_total;
	}

	public String getTb_open() {
		return tb_open;
	}

	public void setTb_open(String tb_open) {
		this.tb_open = tb_open;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public int getTravel_seq() {
		return travel_seq;
	}

	public void setTravel_seq(int travel_seq) {
		this.travel_seq = travel_seq;
	}

	public tm_snsDTO(int tb_seq, String tb_title, String tb_content, String tb_file, int tb_cnt, int tb_likes,
			int tb_total, String tb_open, String mb_id, int travel_seq) {
		this.tb_seq = tb_seq;
		this.tb_title = tb_title;
		this.tb_content = tb_content;
		this.tb_file = tb_file;
		this.tb_cnt = tb_cnt;
		this.tb_likes = tb_likes;
		this.tb_total = tb_total;
		this.tb_open = tb_open;
		this.mb_id = mb_id;
		this.travel_seq = travel_seq;
	}

	public tm_snsDTO(String mb_id) {
		this.mb_id = mb_id;
	}

	public tm_snsDTO(int tb_seq) {
		this.tb_seq = tb_seq;
	}

	public tm_snsDTO() {
	}

	public tm_snsDTO(String tb_title, String tb_content, String tb_file, String mb_id) {
		this.tb_title = tb_title;
		this.tb_content = tb_content;
		this.tb_file = tb_file;
		this.mb_id = mb_id;
	}

}
