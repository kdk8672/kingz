package com.yedam.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.admin.mapper.AdminMapper;
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

	@Override
	public List<AdminVO> balanceList(int year) {
		return mapper.selectBalance(year);
	}

	@Override
	public List<AdminVO> balanceYearList() {
		return mapper.selectBalanceYear();
	}

}
