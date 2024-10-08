package com.yedam.mypage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mypage.mapper.MypageMapper;
import com.yedam.mypage.vo.MypageVO;
import com.yedam.mypage.vo.ReservVO;
import com.yedam.mypage.vo.ReviewVO;

public class MypageServiceImpl implements MypageService{
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	MypageMapper mapper = sqlSession.getMapper(MypageMapper.class);
	
	@Override
	public List<MypageVO> getMembers() {
		return mapper.memberList();
	}


	@Override
	public boolean modifyMypage(MypageVO memberId) {
		return mapper.modifymypage(memberId) == 1;
	}


	@Override
	public List<ReservVO> getId(String memberId) {
		return mapper.selectreserv(memberId);
	}


	@Override
	public int myPoint(String memberId) {
		return mapper.myPoint(memberId);
	}


	@Override
	public List<ReviewVO> getMemberId(String review) {
		return mapper.reviewList(review);
	}


	@Override
	public boolean reserveDelete(int reserveId) {
		mapper.reserveUpdate(reserveId);
		mapper.reserveDelete(reserveId);
		return mapper.reserveDeleteP(reserveId) == 1;
	}


}
