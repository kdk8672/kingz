package com.yedam.member.service;

import com.yedam.member.vo.MemberVO;

public interface MemberService {
	// 회원가입
	boolean addMember(MemberVO member);
	// 회원가입(아이디 중복 검증)
	boolean getMember(String memberId);
	
	// 로그인 및 로그인 검증에 사용
	MemberVO loginCheck(String id, String password);

}
