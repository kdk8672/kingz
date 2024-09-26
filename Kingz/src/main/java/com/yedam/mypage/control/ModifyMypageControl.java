package com.yedam.mypage.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.mypage.service.MypageService;
import com.yedam.mypage.service.MypageServiceImpl;
import com.yedam.mypage.vo.MypageVO;

public class ModifyMypageControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pass");
		String name = request.getParameter("name");
		String mail = request.getParameter("email");
		String phone = request.getParameter("phone");

		MypageVO mvo = new MypageVO();
		mvo.setId(id);
		mvo.setPwd(pw);
		mvo.setName(name);
		mvo.setEmail(mail);
		mvo.setPhone(phone);

		MypageService svc = new MypageServiceImpl();
		
		
		if(svc.modifyMypage(mvo)) {
			response.getWriter().print("{\"retCode\": \"OK\"}");
		}
		else {
			response.getWriter().print("{\"retCode\": \"NG\"}");
		}
		
	}
	
}


