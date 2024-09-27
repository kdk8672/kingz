package com.yedam.common;

import java.util.Date;
import lombok.Data;

@Data
public class RoomSearchDTO {
	private String roomType;
	private Date checkin;
	private Date checkout;
	private int headcount;
}
