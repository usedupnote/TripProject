package com.ssafy.enjoytrip.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Attraction {
	int id;
	String name;
	String description;
	int phoneNumber1;
	int phoneNumber2;
	int phoneNumber3;
	String buissnessHours;
}
