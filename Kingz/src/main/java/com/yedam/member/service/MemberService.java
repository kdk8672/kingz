package com.yedam.member.service;

import com.yedam.member.vo.MemberVO;

public interface MemberService {
	boolean addMember(MemberVO member);
	boolean getMember(String memberId);
	
	// 로그인
	MemberVO loginCheck(String id, String password);
}
