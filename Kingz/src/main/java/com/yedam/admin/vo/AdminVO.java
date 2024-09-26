package com.yedam.admin.vo;

import lombok.Data;

@Data
public class AdminVO {
	private String memberId; // 아이디
	private String password; // 비밀번호
	private String name; // 이름
	private String email; // 이메일
	private String phone; // 전화번호
	private String grade; // 등급
	private String paymentAmount; // 결제금액
	private int pyear; // 결제년도
	private String paymentMonth; // 결제월
	private int totalAmount; // 월별 총 결제 금액
	private int count; // 각 조건별 갯수
	private String roomName; // 방 이름
	private String roomType; // 호텔, 리조트 구분
}
