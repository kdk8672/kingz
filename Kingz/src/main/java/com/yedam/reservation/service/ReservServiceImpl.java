package com.yedam.reservation.service;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.reservation.mapper.ReservMapper;

public class ReservServiceImpl implements ReservService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ReservMapper mapper = sqlSession.getMapper(ReservMapper.class);
	
	
	
}
