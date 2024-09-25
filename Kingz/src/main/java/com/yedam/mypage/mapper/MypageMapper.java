package com.yedam.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mypage.vo.MypageVO;

public interface MypageMapper {
	List<MypageVO> memberList();
	MypageVO selectmember(String memberId);
	
	MypageVO loginMember(@Param("id") String id, @Param("pw") String pw);
}
=======
package com.yedam.mypage.mapper;

import java.util.List;

import com.yedam.mypage.vo.MypageVO;
import com.yedam.mypage.vo.ReservVO;
import com.yedam.mypage.vo.ReviewVO;

public interface MypageMapper {
	//내 정보 조회
	List<MypageVO> memberList();
	MypageVO selectmember(String id);
	
	//예약 내역 조회
	List<ReservVO> reservList();
	ReservVO selectreserv(String reserv);
	
	//리뷰 내역 조회
	List<ReviewVO> reviewList();
	ReviewVO selectreview(String review);
	
	//내 정보 업데이트
	int modifymypage(MypageVO update);
}
