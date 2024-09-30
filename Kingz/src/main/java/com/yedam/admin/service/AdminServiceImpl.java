package com.yedam.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.admin.mapper.AdminMapper;
import com.yedam.admin.vo.AdBoardVO;
import com.yedam.admin.vo.AdminVO;
import com.yedam.common.DataSource;

public class AdminServiceImpl implements AdminService{
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
	
	// 전체 유저 조회
	@Override
	public List<AdminVO> userList() {
		return mapper.selectUsers();
	}
	
	// 회원 탈퇴
	@Override
	public boolean deleteUser(String memberId) {
		mapper.deletePointHistory(memberId);
		mapper.deletePayment(memberId);
		mapper.deletePointHistory(memberId);
		mapper.deleteReviewImage(memberId);
		mapper.deleteReview(memberId);
		return mapper.deleteUser(memberId) == 1;
	}
	
	// 매출 통계
	@Override
	public List<AdminVO> balanceList(int year) {
		return mapper.selectBalance(year);
	}
	
	// 매출이 있는 년도
	@Override
	public List<AdminVO> balanceYearList() {
		return mapper.selectBalanceYear();
	}
	
	// 등급 통계
	@Override
	public List<AdminVO> gradeCounts() {
		return mapper.selectGradeCount();
	}
	
	// 객실 예약 통계
	@Override
	public List<AdminVO> roomReserveCounts() {
		return mapper.selectRoomReserveCount();
	}
	
	// 게시판 등록
	@Override
	public boolean addBoard(AdBoardVO board) {
		return mapper.insertBoard(board) == 1;
	}
	
	// 게시판 삭제
	@Override
	public boolean removeBoard(int boardId) {
		return mapper.deleteBoard(boardId) == 1;
	}
	
	// 리뷰 삭제
	@Override
	public boolean removeReview(int reviewId) {
		mapper.deleteReviewImageOne(reviewId);
		return mapper.deleteReviewOne(reviewId) == 1;
	}

}
