package com.ssafy.enjoytrip.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Board {
	int id;
	String userEmail;
	String title;
	String content;
	String createTime;
	String updateTime;
	int boardCategoryId;
	int viewCount;
}
