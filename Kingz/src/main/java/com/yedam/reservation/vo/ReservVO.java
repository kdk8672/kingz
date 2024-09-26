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
}
