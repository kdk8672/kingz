package com.yedam.point.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PointVO {
	private String memberId;
	private int paymentId;
	private int pointUse;
	private Date pointAdddate;
	private Date pointExpiredate;
}
