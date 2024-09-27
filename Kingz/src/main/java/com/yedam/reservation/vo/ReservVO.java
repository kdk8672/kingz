package com.yedam.reservation.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReservVO {
	private int reserveId;
	private String memberId;
	private int roomId;
	private Date checkin;
	private Date checkout;
	private int headcount;
	private int bearkfast;
	private String request;
	
	// 결제랑 예약 동시에 INSERT 할 때 필요한 임?시 필드
	private int paymentId;
	private int paymentAmount;
	private String paymentMethod;
	private Date paymentDate;
	private int paymentPoint;
}
