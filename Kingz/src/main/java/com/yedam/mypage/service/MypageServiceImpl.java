package com.yedam.mypage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mypage.mapper.MypageMapper;
import com.yedam.mypage.vo.MypageVO;

public class MypageServiceImpl implements MypageService{
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	MypageMapper mapper = sqlSession.getMapper(MypageMapper.class);
	
	@Override
	public List<MypageVO> getMembers() {
		return mapper.memberList();
	}
	

}
