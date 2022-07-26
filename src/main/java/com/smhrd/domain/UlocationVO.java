package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UlocationVO {
	
	private String mem_id;
	private int kick_using;
	private String hel_number;
	private String hel_loc_lat;
	private String hel_loc_long;


}
