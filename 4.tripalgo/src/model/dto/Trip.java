package model.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Trip {
	private String contentId;
	private String title;
	private String addr1;
	private String addr2;
	private String firstImage;
	private double latitude;
	private double longitude;
	private String overview;
}
