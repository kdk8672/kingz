package com.yedam.member.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String grade;
}
