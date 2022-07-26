package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccVO {
	
	private String mem_name;
	private String mem_id;
	private String mem_phone;
	private String mem_subphone;
	private String mem_blood;
	private int use_number;
	private String acc_loc_lat;
	private String acc_loc_long;
	
	public AccVO(int use_number, String acc_loc_lat, String acc_loc_long) {
		this.use_number = use_number;
		this.acc_loc_lat = acc_loc_lat;
		this.acc_loc_long = acc_loc_long;
	}
}
