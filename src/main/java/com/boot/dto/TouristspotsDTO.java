package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class TouristspotsDTO {

	private int spotid;
	private String spotname;
	private String address;
	private String description;
	private String latitude;
	private String longitude;
	private String imgName;
}
