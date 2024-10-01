package com.yedam.payment.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	private int paymentId;
	private int paymentAmount;
	private String paymentMethod;
	private Date paymentDate;
	private int paymentPoint;
}
