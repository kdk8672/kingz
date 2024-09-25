package com.yedam.hotel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.hotel.mapper.HotelMapper;

public class HotelServiceImpl implements HotelService {
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	HotelMapper mapper = sqlSession.getMapper(HotelMapper.class);

	@Override
	public List<HotelVO> getHotelList() {
		return mapper.hotelList();
	}

	@Override
	public HotelVO getHotel(int roomId) {
		return mapper.selectHotel(roomId);
	}

	// [박진석 | 24.09.25] 예약 페이지에 사용할 객실 종류 조회
	@Override
	public List<HotelVO> getHotelRoomTypeList() {
		return mapper.selectRoomType();
	}
}
