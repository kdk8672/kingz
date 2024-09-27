package com.yedam.reservation.mapper;

import com.yedam.reservation.vo.ReservVO;

public interface ReservMapper {

	int updateReserv(ReservVO rvo);
	int updateReservAndPayment(ReservVO rvo);	// 예약과 결제 동시에 함 -> 위 예약만 update하는건 안 씀
}
