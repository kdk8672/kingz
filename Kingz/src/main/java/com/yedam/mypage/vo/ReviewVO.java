package com.yedam.mypage.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private String checkIn;
	private String checkOut;
	private String roomId;
	private Number rating;
	private String breakfast;
	private String reviewDate;
}
