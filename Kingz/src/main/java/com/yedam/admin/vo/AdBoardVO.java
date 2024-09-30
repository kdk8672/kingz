package com.yedam.admin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdBoardVO {
	private int boardId;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private String boardType;
}
