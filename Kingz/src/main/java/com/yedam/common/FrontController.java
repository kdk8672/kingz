package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.member.control.AddMemberControl;
import com.yedam.member.control.CheckIdControl;
import com.yedam.member.control.LoginControl;
import com.yedam.member.control.LoginFormControl;
import com.yedam.member.control.MemberAddFormControl;

import com.yedam.mypage.control.MypageControl;


import com.yedam.example.control.TestControl;
import com.yedam.reservation.control.ReservControl;

//@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	Map<String, Control> map;
	
	public FrontController() {
		System.out.println("FrontController 생성자");
		map = new HashMap<>();
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// control 추가
		
		// 마이페이지 연결
		map.put("/mypage.do", new MypageControl());
		
		map.put("/main.do", new TestControl());
		
		// [권혁태] 회원가입
		map.put("/memberAddForm.do", new MemberAddFormControl()); // 회원가입 창 열기
		map.put("/addMember.do", new AddMemberControl()); // 회원가입 기능 
		map.put("/checkId.do", new CheckIdControl()); // 아이디 중복 값 확인
		map.put("/LoginForm.do", new LoginFormControl()); // 로그인 창 열기
		map.put("/login.do", new LoginControl()); // 로그인 기능
		
		// [박진석] 예약 관련 URI 매핑
		map.put("/reserv.do", new ReservControl());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 요청방식이 POST 일 경우에 body 포함된 문자열 인코딩
		
		String uri = req.getRequestURI(); // /BoardWeb/main.do
		String context = req.getContextPath(); // /BoardWeb
		String page = uri.substring(context.length()); // /main.do
		System.out.println(page);
		
		Control control = map.get(page);
		control.exec(req, resp);
	}
	
}
