package com.yedam.reservation.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.mypage.service.MypageService;
import com.yedam.mypage.service.MypageServiceImpl;

public class GetPointOneMemberControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MypageService svc = new MypageServiceImpl();
		
		String memberId = request.getParameter("memberId");
		System.out.println(memberId);
		
		int myPoint = svc.myPoint(memberId);
		
		String json = "{\"point\":" + myPoint + "}";
		System.out.println(json);

		response.getWriter().print(json);
		
	}

}
