package com.yedam.admin.vo;

import lombok.Data;

@Data
public class AdminVO {
	private String memberId;
	private String password;
	private String email;
	private String phone;
	private String grade;
	private String paymentAmount;
}
