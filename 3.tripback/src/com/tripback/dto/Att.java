package com.tripback.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Att {
	private int contentId;
	private int contentTypeId;
	private String title;
	private String addr1;
	private String firstImage;
	private int sidoCode;
	private int gugunCode;
}
