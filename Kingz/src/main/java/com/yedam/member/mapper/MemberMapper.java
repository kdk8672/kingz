package com.yedam.member.mapper;

import com.yedam.member.vo.MemberVO;

public interface MemberMapper {
	int insertMember(MemberVO member); // 회원등록
	int seleteMember(String memberId); // 중복확인
}
