package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class moduleVO {
	String hel_number;
	String gps_lat;
	String gps_long;
	int motor;
	int shock;
	
	
	public moduleVO(String hel_number,String gps_lat, String gps_long) {
		super();
		this.hel_number = hel_number;
		this.gps_lat = gps_lat;
		this.gps_long = gps_long;
	}
	
	public moduleVO(int motor) {
		super();
		this.motor = motor;
	}
	
 
}
