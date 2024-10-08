package com.yedam.mypage.mapper;

import java.util.List;

import com.yedam.mypage.vo.MypageVO;
import com.yedam.mypage.vo.ReservVO;
import com.yedam.mypage.vo.ReviewVO;

public interface MypageMapper {
	//내 정보 조회
	List<MypageVO> memberList();
	MypageVO selectmember(String memberId);
	
	//예약 내역 조회
	ReservVO reservList();
	List<ReservVO> selectreserv(String reserv);
	int myPoint(String memberId);
	
	//리뷰 내역 조회
	List<ReviewVO> reviewList(String review);
	ReviewVO selectreview(String review);
	
	//내 정보 업데이트
	int modifymypage(MypageVO update);
	
	//예약 취소
	int reserveUpdate(int reserveId);
	int reserveDelete(int reserveId);
	int reserveDeleteP(int reserveId);
}

