package com.yedam.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Control;
import com.yedam.hotel.HotelVO;
import com.yedam.reservation.vo.ReservVO;

public class AddReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		MultipartRequest mr;
		String saveDir = request.getServletContext().getRealPath("img");
		int maxSize = 5 * 1024 * 1024;
		mr = new MultipartRequest(request, saveDir, maxSize, "utf-8", new DefaultFileRenamePolicy());

		ReviewService svc = new ReviewServiceImpl();

		int reviewId = svc.getReviewId();
		String roomId = mr.getParameter("roomId");

//		HttpSession session = request.getSession(false);
//		if(session != null) {
//			session.invalidate();
//		} 세션 초기화 (로그아웃 경우 체크용)

		HttpSession session = request.getSession();
		Object getMemberId = session.getAttribute("id");
		String memberId = (String) getMemberId;
		String content = mr.getParameter("reviewContent");
		String rating = mr.getParameter("rating");

		ReviewVO rvo = new ReviewVO();
		rvo.setReviewId(reviewId);
		rvo.setMemberId(memberId);
		rvo.setRoomId(Integer.parseInt(roomId));
		rvo.setReviewContent(content);
		rvo.setRating(Double.parseDouble(rating));
		System.out.println(rvo);

		String imageUrl = mr.getFilesystemName("imageUrl");

		ImageVO ivo = new ImageVO();
		ivo.setReviewId(reviewId);
		ivo.setImageUrl(imageUrl);

		HotelVO hvo = new HotelVO();
		hvo.setRoomId(roomId);
		System.out.println(ivo);

		ReservVO rvvo = new ReservVO();
		rvvo.setRoomId(Integer.parseInt(roomId));
		rvvo.setMemberId(memberId);
		
		if (memberId == null) {
			session.setAttribute("msg", "리뷰를 등록하기 위해 로그인해 주십시오."); // 로그인 여부 확인 (작동 성공)
			System.out.println("리뷰를 등록하기 위해 로그인해 주십시오.");
			response.sendRedirect("roomDetail.do?roomId=" + roomId);
		} else if (svc.getReserveCnt(rvo.getMemberId(), rvo.getRoomId()) == 0) {
			session.setAttribute("msg", "예약 경력이 없습니다."); // 로그인 시, 특정 방을 예약한 경력이 있는지 확인 (작동 성공)
			System.out.println("예약 경력이 없습니다.");
			response.sendRedirect("roomDetail.do?roomId=" + roomId);
		} else if (svc.reviewCheck(rvvo.getRoomId(), rvvo.getMemberId()) != 0) {
			session.setAttribute("msg", "체크아웃 후 리뷰를 등록할 수 있습니다."); // 예약 경력 중, 체크아웃을 완료한 경력이 있는지 확인 (작동 성공)
			System.out.println("체크아웃 후 리뷰를 등록할 수 있습니다.");
			response.sendRedirect("roomDetail.do?roomId=" + roomId);
		} else if (svc.getReserveCnt(rvo.getMemberId(), rvo.getRoomId()) == svc.getReviewCnt(rvo.getMemberId(), rvo.getRoomId())){ // 예약 횟수와 리뷰 개수를 비교하여 같을 시 리뷰 등록 불가 확인 (작동 성공)
			session.setAttribute("msg", "리뷰는 체크아웃 당 한번 등록할 수 있습니다.");
			System.out.println("리뷰는 체크아웃 당 한번 등록할 수 있습니다.");
			response.sendRedirect("roomDetail.do?roomId=" + roomId);	
		} else {
			if (svc.addReview(rvo)) { // 리뷰 등록 기능 (작동 성공)
				svc.addImage(ivo); // 이미지 추가 기능 (작동 성공)
				session.setAttribute("msg", "리뷰가 등록되었습니다.");
				System.out.println("리뷰가 등록되었습니다.");
				response.sendRedirect("roomDetail.do?roomId=" + roomId);
			}
		}
	}
}
