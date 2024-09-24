package com.yedam.hotel.mapper;

import java.util.List;

import com.yedam.hotel.HotelVO;

public interface HotelMapper {
	List<HotelVO> hotelList();
	HotelVO selectHotel(int roomId);
}
