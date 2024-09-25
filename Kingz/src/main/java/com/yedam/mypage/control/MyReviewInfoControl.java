package com.yedam.mypage.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.mypage.service.MypageService;
import com.yedam.mypage.service.MypageServiceImpl;
import com.yedam.mypage.vo.ReviewVO;

public class MyReviewInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MypageService svc = new MypageServiceImpl();
		List<ReviewVO> list = svc.getRoomId();
	
		request.setAttribute("ReviewList", list);

		request.getRequestDispatcher("mypage/body.tiles").forward(request, response);
	}

}
