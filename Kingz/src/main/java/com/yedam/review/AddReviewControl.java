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

public class AddReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		MultipartRequest mr;
		String saveDir = request.getServletContext().getRealPath("img/reviews");
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
//
//		try {
//			rating = Integer.parseInt(ratingStr);
//		} catch (NumberFormatException e) {
//			response.sendRedirect("roomDetail.do?roomId=" + roomId);
//			return;
//		}
		
		ReviewVO rvo = new ReviewVO();
		rvo.setReviewId(reviewId);
		rvo.setMemberId(memberId);
		rvo.setRoomId(Integer.parseInt(roomId));
		rvo.setReviewContent(content);
		rvo.setRating(Integer.parseInt(rating));
		System.out.println(rvo);

		request.setAttribute("rvo", rvo);
		
		String imageUrl = mr.getFilesystemName("imageUrl");
		
		ImageVO ivo = new ImageVO();
		ivo.setReviewId(reviewId);
		ivo.setImageUrl(imageUrl);

		HotelVO hvo = new HotelVO();
		hvo.setRoomId(roomId);
		System.out.println(ivo);
		
		if (memberId == null) {
			System.out.println("리뷰를 등록하기 위해 로그인해 주십시오.");
			response.sendRedirect("roomDetail.do?roomId=" + roomId);
		} else {
			if (svc.addReview(rvo)) {
					svc.addImage(ivo);
				System.out.println("리뷰가 등록되었습니다.");
					response.sendRedirect("roomDetail.do?roomId=" + roomId);
			}
		}

//		if (svc.addReview(rvo)) {
//			roomId = request.getParameter("roomId");
//			String uploadedFileName = mr.getFilesystemName("chooseFile");
//			if (uploadedFileName != null) {
//				ImageVO ivo = new ImageVO();
//				ivo.setReviewId(rvo.getReviewId());
//				ivo.setImageUrl(uploadedFileName);
//				svc.addImage(ivo);
//			}
//			response.sendRedirect("roomDetail.do?roomId=" + roomId);
//		} else {
//			response.sendRedirect("roomDetail.do?roomId=" + roomId);
//		}

//		if (svc.addReview(rvo)) {
//			response.sendRedirect("roomDetail.do?roomId=" + roomId);
//		} else if(memberId == null) {
//			response.sendRedirect("roomDetail.do?roomId=" + roomId);
//		} else {
//			response.sendRedirect("roomDetail.do?roomId=" + roomId);
//		}

	}

}
