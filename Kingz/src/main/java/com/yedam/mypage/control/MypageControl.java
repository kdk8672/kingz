package com.yedam.mypage.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.mypage.service.MypageService;
import com.yedam.mypage.service.MypageServiceImpl;
import com.yedam.mypage.vo.MypageVO;

public class MypageControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MypageService svc = new MypageServiceImpl();
		List<MypageVO> list = svc.getMembers();
		
		request.setAttribute("MypageList", list);
		
		request.getRequestDispatcher("mypage/body.tiles").forward(request, response);
	}

}