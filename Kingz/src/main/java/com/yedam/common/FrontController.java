package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.contact.contactControl;
import com.yedam.example.control.testControl;
import com.yedam.facilities.facilitiesControl;
import com.yedam.hotel.hotelListControl;

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
		map.put("/main.do", new testControl());
		
		// 부대시설 페이지 (조민성)
		map.put("/facilities.do", new facilitiesControl());
		
		// 호텔리스트 페이지 (조민성)
		map.put("/hotelList.do", new hotelListControl());
		
		// 오시는 길 페이지 (조민성)
		map.put("/contact.do", new contactControl());
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
