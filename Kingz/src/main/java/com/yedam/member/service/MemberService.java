package com.yedam.member.service;

import com.yedam.member.vo.MemberVO;

public interface MemberService {
	boolean addMember(MemberVO member);
	boolean getMember(String memberId);
}
