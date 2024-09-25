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

}
