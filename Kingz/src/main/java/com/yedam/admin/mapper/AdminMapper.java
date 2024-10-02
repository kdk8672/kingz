package com.yedam.admin.mapper;

import java.util.List;

import com.yedam.admin.vo.AdBoardVO;
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
	
	// 등급별 통계
	List<AdminVO> selectGradeCount();
	
	// 방별 예약 통계
	List<AdminVO> selectRoomReserveCount();
	
	// 게시판 등록, 삭제
	int insertBoard(AdBoardVO board);
	int deleteBoard(int boardId);
	
	// 리뷰 삭제
	int deleteReviewOne(int reviewId);
	int deleteReviewImageOne(int reviewId);
	
	// 탈퇴시 내역 검증
	int selectPointHistory(String memberId);
	int selectReview(String memberId);
	
}
