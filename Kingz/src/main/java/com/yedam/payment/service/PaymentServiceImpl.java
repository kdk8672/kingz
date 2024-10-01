package com.yedam.payment.service;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.payment.mapper.PaymentMapper;
import com.yedam.payment.vo.PaymentVO;

public class PaymentServiceImpl implements PaymentService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	PaymentMapper mapper = sqlSession.getMapper(PaymentMapper.class);
	
	@Override
	public boolean addPayment(PaymentVO pvo) {
		return mapper.insertPayment(pvo) == 1;
	}
}
