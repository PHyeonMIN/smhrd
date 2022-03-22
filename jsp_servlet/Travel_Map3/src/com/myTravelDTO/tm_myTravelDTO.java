package com.myTravelDTO;

import java.sql.Date;

public class tm_myTravelDTO {

	private int travel_seq;
	private int map_seq;
	private String travel_memo;
	private String travel_character;
	private String travel_fileO;
	private String travel_fileT;
	private String reg_date;
	private String mb_id;
	private int travel_order;

	public int getTravel_seq() {
		return travel_seq;
	}

	public void setTravel_seq(int travel_seq) {
		this.travel_seq = travel_seq;
	}

	public int getMap_seq() {
		return map_seq;
	}

	public void setMap_seq(int map_seq) {
		this.map_seq = map_seq;
	}

	public String getTravel_memo() {
		return travel_memo;
	}

	public void setTravel_memo(String travel_memo) {
		this.travel_memo = travel_memo;
	}

	public String getTravel_character() {
		return travel_character;
	}

	public void setTravel_character(String travel_character) {
		this.travel_character = travel_character;
	}

	public String getTravel_fileO() {
		return travel_fileO;
	}

	public void setTravel_fileO(String travel_fileO) {
		this.travel_fileO = travel_fileO;
	}

	public String getTravel_fileT() {
		return travel_fileT;
	}

	public void setTravel_fileT(String travel_fileT) {
		this.travel_fileT = travel_fileT;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public int getTravel_order() {
		return travel_order;
	}

	public void setTravel_order(int travel_order) {
		this.travel_order = travel_order;
	}

	public tm_myTravelDTO(int travel_seq, int map_seq, String travel_memo, String travel_character, String travel_fileO,
			String travel_fileT, String reg_date, String mb_id, int travel_order) {
		this.travel_seq = travel_seq;
		this.map_seq = map_seq;
		this.travel_memo = travel_memo;
		this.travel_character = travel_character;
		this.travel_fileO = travel_fileO;
		this.travel_fileT = travel_fileT;
		this.reg_date = reg_date;
		this.mb_id = mb_id;
		this.travel_order = travel_order;
	}

	public tm_myTravelDTO() {

	}

	public tm_myTravelDTO(String travel_memo, String travel_character, String travel_fileO, String travel_fileT,
			String mb_id, int travel_order) {
		this.travel_memo = travel_memo;
		this.travel_character = travel_character;
		this.travel_fileO = travel_fileO;
		this.travel_fileT = travel_fileT;
		this.mb_id = mb_id;
		this.travel_order = travel_order;
	}

	public tm_myTravelDTO(String travel_memo, String travel_character, String mb_id, int travel_order) {
		this.travel_memo = travel_memo;
		this.travel_character = travel_character;
		this.mb_id = mb_id;
		this.travel_order = travel_order;
	}
	

	public tm_myTravelDTO(int map_seq, String travel_memo, String travel_character, String travel_fileO,
			String travel_fileT, String mb_id, int travel_order) {
		this.map_seq = map_seq;
		this.travel_memo = travel_memo;
		this.travel_character = travel_character;
		this.travel_fileO = travel_fileO;
		this.travel_fileT = travel_fileT;
		this.mb_id = mb_id;
		this.travel_order = travel_order;
	}

	public tm_myTravelDTO(int map_seq, String travel_memo, String travel_character, String mb_id, int travel_order) {
		this.map_seq = map_seq;
		this.travel_memo = travel_memo;
		this.travel_character = travel_character;
		this.mb_id = mb_id;
		this.travel_order = travel_order;
	}

}
