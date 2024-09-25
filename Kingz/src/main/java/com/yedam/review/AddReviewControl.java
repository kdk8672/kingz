package com.yedam.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.hotel.HotelVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class AddReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		String roomId = request.getParameter("roomId");
//		HttpSession session = request.getSession(false);
//		if(session != null) {
//			session.invalidate();
//		}
		HttpSession session = request.getSession();
		Object getMemberId = session.getAttribute("id");
		String memberId = (String)getMemberId;
		String content = request.getParameter("reviewContent");
		String ratingStr = request.getParameter("rating");
		int rating = 0;

		try {
			rating = Integer.parseInt(ratingStr);
		} catch (NumberFormatException e) {
			response.sendRedirect("roomDetail.do?roomId=" + roomId);
			return;
		}
		
		ReviewVO rvo = new ReviewVO();
		rvo.setRoomId(Integer.parseInt(roomId));
		rvo.setMemberId(memberId);
		rvo.setReviewContent(content);
		rvo.setRating(rating);
		System.out.println(rvo);

		request.setAttribute("rvo", rvo);

		HotelVO hvo = new HotelVO();
		hvo.setRoomId(roomId);

		ReviewService svc = new ReviewServiceImpl();
		
		if (memberId == null) {
			System.out.println("멤버 아이디 무");
			response.sendRedirect("roomDetail.do?roomId=" + roomId);
		} else {
			if (svc.addReview(rvo)) {
				response.sendRedirect("roomDetail.do?roomId=" + roomId);
			}
		}

//		if (svc.addReview(rvo)) {
//			response.sendRedirect("roomDetail.do?roomId=" + roomId);
//		} else if(memberId == null) {
//			response.sendRedirect("roomDetail.do?roomId=" + roomId);
//		} else {
//			response.sendRedirect("roomDetail.do?roomId=" + roomId);
//		}
		
	}

}
