package com.yedam.reservation.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.mypage.service.MypageService;
import com.yedam.mypage.service.MypageServiceImpl;
import com.yedam.mypage.vo.MypageVO;

public class ReservCompleteControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[ReservCompleteControl.java] 호출 완료!");
		request.getRequestDispatcher("reservation/reservComplete.tiles").forward(request, response);
	}

}
