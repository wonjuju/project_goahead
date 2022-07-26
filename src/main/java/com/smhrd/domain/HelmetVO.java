package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class HelmetVO {

   private String hel_number;
   private String hel_lost;

   private String hel_damage;
   private String hel_check;
   private String hel_loc_lat;
   private String hel_loc_long;

   public HelmetVO(String hel_number, String hel_loc_lat, String hel_loc_long) {
		this.hel_number = hel_number;
		this.hel_loc_lat = hel_loc_lat;
		this.hel_loc_long = hel_loc_long;
   }
   
   
}