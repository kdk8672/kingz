package com.yedam.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int boardId;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private String boardType;
}
