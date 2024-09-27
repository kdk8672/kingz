package com.yedam.admin.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.admin.service.AdminService;
import com.yedam.admin.service.AdminServiceImpl;
import com.yedam.common.Control;

public class AdminRemoveReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reviewId = request.getParameter("reviewId");
		
		AdminService svc= new AdminServiceImpl();
		
		if(svc.removeReview(Integer.parseInt(reviewId))){
			// 지운 상세 페이지로 이동 rd 추가
			System.out.println("리뷰 삭제");
		} else {
			// 오류 메시지 전달
			System.out.println("삭제중 오류");
		}
	}

}
