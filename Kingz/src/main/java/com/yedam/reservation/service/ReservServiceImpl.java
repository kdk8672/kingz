package com.yedam.reservation.service;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.payment.vo.PaymentVO;
import com.yedam.reservation.mapper.ReservMapper;
import com.yedam.reservation.vo.ReservVO;

public class ReservServiceImpl implements ReservService {
	SqlSession sqlSession = DataSource.getInstance().openSession();
	ReservMapper mapper = sqlSession.getMapper(ReservMapper.class);

	@Override
	public boolean addReserv(ReservVO rvo, PaymentVO pvo) {
//		return mapper.updateReserv(rvo) == 1;
		mapper.updateReserv(rvo);
		System.out.println("[ReservServiceImpl.java] updateReserv 완료!");
		mapper.insertPaymemtInfo(pvo);
		System.out.println("[ReservServiceImpl.java] insertPaymemtInfo 완료!");
//		mapper.insertPointInfo();
		sqlSession.commit(); // 모든 작업이 끝나면 커밋 작업.
		return true;
	}

}
