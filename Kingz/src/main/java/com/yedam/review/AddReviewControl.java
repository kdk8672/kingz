package com.yedam.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.hotel.HotelVO;

public class AddReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		String roomId = request.getParameter("roomId");
		String memberId = request.getParameter("memberId");
		String content = request.getParameter("content");
		String rating = request.getParameter("rating");

		ReviewVO rvo = new ReviewVO();
		rvo.setRoomId(Integer.parseInt(roomId));
		rvo.setMemberId(memberId);
		rvo.setReviewContent(content);
		rvo.setRating(Integer.parseInt(rating));
		
		HotelVO hvo = new HotelVO();
		hvo.setRoomId(roomId);

		ReviewService svc = new ReviewServiceImpl();

		if (svc.addReview(rvo)) {
			response.sendRedirect("roomDetail.do?roomId=" + roomId);
		} else {
			response.sendRedirect("roomDetail.do?roomId=" + roomId);
		}
	}

}
