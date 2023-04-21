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
public class AttDetail {
	private int contentId;
	private int contentTypeId;
	private String title;
	private String firstImage2;
	private double latitude;
	private double longitude;
	private String overview;
}
