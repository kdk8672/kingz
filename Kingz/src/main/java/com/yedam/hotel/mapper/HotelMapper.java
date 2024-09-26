package com.yedam.hotel.mapper;

import java.util.List;

import com.yedam.common.RoomSearchDTO;
import com.yedam.hotel.HotelVO;

public interface HotelMapper {
	List<HotelVO> hotelList();
	HotelVO selectHotel(int roomId);
	
	List<HotelVO> selectRoomType();	// [박진석 | 240925] 예약 페이지에 필요한 객실 종류 출력하는 매퍼
	List<HotelVO> selectFilteredRoomList(RoomSearchDTO search);
}
