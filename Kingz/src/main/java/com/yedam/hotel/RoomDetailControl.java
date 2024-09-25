package com.yedam.hotel;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.review.ReviewService;
import com.yedam.review.ReviewServiceImpl;
import com.yedam.review.ReviewVO;

public class RoomDetailControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		
		HotelService svc = new HotelServiceImpl();
		HotelVO room = new HotelVO();
		String roomId = request.getParameter("roomId");
		room = svc.getHotel(Integer.parseInt(roomId));
		request.setAttribute("room", room);
		
		ReviewService rvc = new ReviewServiceImpl();
		ReviewVO rvo = new ReviewVO();
		System.out.println(rvo);
		List<ReviewVO> list = rvc.getReviewList(Integer.parseInt(roomId));
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("layout/roomDetail.tiles").forward(request, response);
	}

}
