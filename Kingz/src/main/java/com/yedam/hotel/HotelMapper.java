package com.yedam.hotel;

import java.util.List;

public interface HotelMapper {
	List<HotelVO> hotelList();
	HotelVO selectHotel(int roomId);
}
