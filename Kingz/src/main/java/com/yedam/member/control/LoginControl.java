package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		MemberService svc = new MemberServiceImpl();
		MemberVO member = svc.loginCheck(id, password);

		if (member == null) {
			System.out.println("로그인 실패");
			request.setAttribute("message", "아이디와 비밀번호를 확인해주세요.");
			request.getRequestDispatcher("member/login.tiles").forward(request, response);
			return;
		}

		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		session.setAttribute("logName", member.getName());
		session.setAttribute("logEmail", member.getEmail());
		session.setAttribute("logPhone", member.getPhone());
		session.setAttribute("logGrade", member.getGrade());
<<<<<<< HEAD
		
		
		if(member.getGrade().equals("일반") || member.getGrade().equals("VIP") || member.getGrade().equals("VVIP")) {
			request.getRequestDispatcher("layout/body.tiles")
			.forward(request, response);
		}
=======

		request.getRequestDispatcher("layout/body.tiles").forward(request, response);
>>>>>>> refs/remotes/origin/main

	}

}
