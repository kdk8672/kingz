package com.yedam.mypage.vo;

import lombok.Data;

@Data
public class MypageVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String phone;
	private String grade;
}
=======
package com.yedam.mypage.vo;

import lombok.Data;

@Data
public class MypageVO {
	private String memberId;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String grade;
}
