package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class AddMemberControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
	
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String emailDomain = request.getParameter("emailDomain");
		
		String fullEmail = email + emailDomain;
		
		String phone = request.getParameter("phone");
		
		MemberVO mvo = new MemberVO();
		mvo.setMemberId(id);
		mvo.setPassword(password);
		mvo.setName(name);
		mvo.setEmail(fullEmail);
		mvo.setPhone(phone);
		
		MemberService svc = new MemberServiceImpl();
		
		if(svc.addMember(mvo)) {
			response.sendRedirect("main.do");
		} else {
			request.setAttribute("addError", "아이디가 중복 되었습니다.");
			request.getRequestDispatcher("/memberAddForm.do").forward(request, response);
		}
		
	}

}
