package com.yedam.hotel;

import java.util.List;

import com.yedam.common.RoomSearchDTO;

public interface HotelService {
	List<HotelVO> getHotelList();
	HotelVO getHotel(int roomId);
	List<HotelVO> getHotelRoomTypeList();	// [박진석 | 24.09.25]
	List<HotelVO> getFilteredRoomList(RoomSearchDTO search);
}
