package com.yedam.mypage.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.mypage.service.MypageService;
import com.yedam.mypage.service.MypageServiceImpl;

public class reserveDeleteControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reserveId = Integer.parseInt(request.getParameter("reserveId"));
		String id = request.getParameter("memberId");
		
		MypageService svc = new MypageServiceImpl();
		if(svc.reserveDelete(reserveId)) {
			response.sendRedirect("mypage.do?memberId=" + id);
		}
		else {
			response.getWriter().print("{\"retCode\": \"NG\"}");
		}
	}

}
