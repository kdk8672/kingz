package com.yedam.hotel;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class HotelListControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HotelService svc = new HotelServiceImpl();
		List<HotelVO> list = svc.getHotelList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("layout/hotelList.tiles").forward(request, response);
	}

}
