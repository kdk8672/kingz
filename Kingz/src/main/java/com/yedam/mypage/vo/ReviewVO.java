package com.yedam.mypage.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private String checkIn;
	private String checkOut;
	private String reviewContent;
	private int rating;
	private String reviewDate;
	private String memberId;
	private String roomType;
	private String roomName;
	private String imageUrl;
}
