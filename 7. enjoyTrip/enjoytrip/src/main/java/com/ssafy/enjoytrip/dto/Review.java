package com.ssafy.enjoytrip.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Review {
	int id;
	String review;
	int placeId;
	String userEmail;
	String userNickName;
	String createdAt;
}
