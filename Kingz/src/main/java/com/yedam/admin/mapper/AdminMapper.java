package com.yedam.admin.mapper;

import java.util.List;

import com.yedam.admin.vo.AdminVO;

public interface AdminMapper {
	List<AdminVO> selectUsers(); // 회원 목록 조회
	
	// 회원 탈퇴
	int deleteUser(String memberId);
	int deleteReviewImage(String memberId);
	int deleteReview(String memberId);
	int deleteReservation(String memberId);
	int deletePointHistory(String memberId);
	int deletePayment(String memberId);
	
	// 매출 조회
	List<AdminVO> selectBalance(int pyear);
	List<AdminVO> selectBalanceYear();
}
