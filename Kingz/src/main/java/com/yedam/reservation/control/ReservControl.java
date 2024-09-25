package com.yedam.reservation.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.yedam.common.Control;
import com.yedam.common.DataSource;
import com.yedam.hotel.HotelService;
import com.yedam.hotel.HotelServiceImpl;
import com.yedam.hotel.HotelVO;
import com.yedam.hotel.mapper.HotelMapper;
import com.yedam.reservation.mapper.ReservMapper;

public class ReservControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[ReservControl.java] 호출 완료!");
		
		// [박진석 | 24.09.25] 객실 종류 검색을 위해 Hotel(room 테이블)과 관련된 패키지 접근 
		HotelService svc = new HotelServiceImpl();
		List<HotelVO> list = svc.getHotelRoomTypeList();
		
		System.out.println(list);
		
		request.setAttribute("roomTypelist", list);
		request.getRequestDispatcher("reservation/reserv.tiles").forward(request, response);
	}
}
