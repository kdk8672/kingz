package com.yedam.hotel;

import java.util.List;

public interface HotelService {
	List<HotelVO> getHotelList();
	HotelVO getHotel(int roomId);
	List<HotelVO> getHotelRoomTypeList();	// [박진석 | 24.09.25]
}
