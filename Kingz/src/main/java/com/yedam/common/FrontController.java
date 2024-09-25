package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.admin.control.AdminBalanceControl;
import com.yedam.admin.control.AdminBalanceListControl;
import com.yedam.admin.control.AdminBalanceYearControl;
import com.yedam.admin.control.AdminUserDeleteControl;
import com.yedam.admin.control.AdminUserListControl;
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
		
		// [박진석] 예약 관련 URI 매핑
		map.put("/reserv.do", new ReservControl());
		
		// [김건휘] 관리자 기능 관련
		map.put("/userList.do", new AdminUserListControl()); // 회원 관리 페이지 이동
		map.put("/deleteUser.do", new AdminUserDeleteControl()); // 회원 탈퇴
		map.put("/balance.do", new AdminBalanceControl()); // 매출 페이지 이동
		map.put("/balanceList.do", new AdminBalanceListControl()); // 매출액 조회
		map.put("/balanceYear.do", new AdminBalanceYearControl()); // 매출이 있는 년도
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 요청방식이 POST 일 경우에 body 포함된 문자열 인코딩
		
		String uri = req.getRequestURI();
		String context = req.getContextPath(); 
		String page = uri.substring(context.length());
		System.out.println(page);
		
		Control control = map.get(page);
		control.exec(req, resp);
	}
	
}
