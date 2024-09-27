package com.yedam.mypage.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private String reviewId;
	private String memberId;
	private String roomId;
	private String reviewContent;
	private int rating;
	private String reviewDate;
}
