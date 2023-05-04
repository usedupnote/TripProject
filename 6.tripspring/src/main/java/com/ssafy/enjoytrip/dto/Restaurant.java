package com.ssafy.enjoytrip.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Restaurant {
	int id;
	String name;
	String description;
	String address;
	Integer phoneNumber1;
	Integer phoneNumber2;
	Integer phoneNumber3;
	String email;
}
