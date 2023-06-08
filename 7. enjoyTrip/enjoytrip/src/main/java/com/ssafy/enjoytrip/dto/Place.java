package com.ssafy.enjoytrip.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Place {
	int id;
	String name;
	String description;
	String address;
	String businessHours;
	String phoneNumber1;
	String phoneNumber2;
	String phoneNumber3;
	int placeTypeId;
	String location;
	float lat;
	float lng;
	String imgSrc;
}
