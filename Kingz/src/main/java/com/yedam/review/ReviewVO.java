package com.yedam.review;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewId;
	private String memberId;
	private int roomId;
	private String reviewContent;
	private double rating;
	private Date reviewDate;
	private String imageUrl;
	private int reserveId;
	private int reserveCnt;
	private int reviewCnt;
}
