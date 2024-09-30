package com.yedam.reservation.mapper;

import com.yedam.payment.vo.PaymentVO;
import com.yedam.reservation.vo.ReservVO;

public interface ReservMapper {

	int updateReserv(ReservVO rvo);
	// 예약을 완료.
	int updateReservAndPayment(ReservVO rvo);	// 예약과 결제 동시에 함 -> 위 예약만 update하는건 안 씀
	// 결재정보.
	int insertPaymemtInfo(PaymentVO pvo);
	// 포인트 생성.
	int insertPointInfo();
	
	int selectRecentReservId();
}
