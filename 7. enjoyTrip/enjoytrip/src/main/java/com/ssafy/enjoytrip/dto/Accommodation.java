package com.ssafy.enjoytrip.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Accommodation {
	int id;
	String name;
	String description;
	String address;
	int phoneNumber1;
	int phoneNumber2;
	int phoneNumber3;
	String email;
}
