package model.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Review {
	private int articleNo; // 글 번호
	private String id; // 작성자 아이디
	private String title; // 제목
	private String desc; // 본문
	private String img; // 이미지
	private int like; // 좋아요 수
	private String registerTime; // 등록 시간
}
