package com.yedam.reservation.service;

import com.yedam.payment.vo.PaymentVO;
import com.yedam.reservation.vo.ReservVO;

public interface ReservService {
	boolean addReserv(ReservVO rvo, PaymentVO pvo);
}
