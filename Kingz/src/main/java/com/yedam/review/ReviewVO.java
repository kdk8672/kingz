package com.yedam.review;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewId;
	private String memberId;
	private int roomId;
	private String reviewContent;
	private int rating;
	private Date reviewDate;
	private String image;
}
