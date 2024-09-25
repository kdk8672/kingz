package com.yedam.member.mapper;

import org.apache.ibatis.annotations.Param;

import com.yedam.member.vo.MemberVO;

public interface MemberMapper {
	int insertMember(MemberVO member); // 회원등록
	int seleteMember(String memberId); // 중복확인

	MemberVO loginMember(@Param("id")String id, @Param("password") String password);
	
}
