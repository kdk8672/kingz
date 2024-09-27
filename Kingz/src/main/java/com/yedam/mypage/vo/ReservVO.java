package com.yedam.mypage.vo;

import lombok.Data;

@Data
public class ReservVO {
	private int reserveId;
	private String memberId;
	private int roomId;
	private String roomName;
	private String checkIn;
	private String checkOut;
	private int headCount;
	private int breakfast;
	private String request;
	private String roomType;
	private int roomPrice;
	private String imageUrl;
	private int paymentAmount;
	private int paymentPoint;
	private int night;
	private int pointUse;
}
