package com.yedam.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mypage.vo.MypageVO;

public interface MypageMapper {
	List<MypageVO> memberList();
	MypageVO selectmember(String memberId);
	
	MypageVO loginMember(@Param("id") String id, @Param("pw") String pw);
}
