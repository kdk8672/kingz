package com.yedam.mypage.service;

import java.util.List;

import com.yedam.mypage.vo.MypageVO;
import com.yedam.mypage.vo.ReservVO;
import com.yedam.mypage.vo.ReviewVO;

public interface MypageService {
	List<MypageVO> getMembers();
	List<ReservVO> getId();
	List<ReviewVO> getRoomId();
	boolean modifyMypage(MypageVO memberId);
}