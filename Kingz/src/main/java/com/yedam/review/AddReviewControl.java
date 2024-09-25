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
		
//		ReservVO vvo = new ReservVO();
		
		HotelVO hvo = new HotelVO();
		hvo.setRoomId(roomId);

		ReviewService svc = new ReviewServiceImpl();

		if (svc.addReview(rvo)) {
			response.sendRedirect("roomDetail.do?roomId=" + roomId);
		} else {
			request.setAttribute("message", "체크아웃 이후에만 리뷰를 등록할 수 있습니다.");
			response.sendRedirect("roomDetail.do?roomId=" + roomId);
		}
		
		// memberId 연결
//		// 회원 아이디 파라미터 : id
//		String memberId = request.getParameter("memberId");
//						
//		// 조회한 정보를 jsp 페이지에 전달
//		MemberService svc = new MemberServiceImpl();
//		MemberVO mvo = svc.getMember(memberId);
//						
//		request.setAttribute("member", mvo);
//						
//		request.getRequestDispatcher("layout/roomDetail.tiles").forward(request, response);
//		response.sendRedirect("roomDetail.do?roomId=" + roomId);
		
	}

}
