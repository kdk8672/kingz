package com.yedam.hotel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;

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

}
