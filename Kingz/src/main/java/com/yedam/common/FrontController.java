package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.example.control.testControl;
import com.yedam.facilities.FacilitiesControl;
import com.yedam.hotel.HotelListControl;
import com.yedam.hotel.RoomDetailControl;

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
		
		// [조민성] 부대시설 페이지
		map.put("/facilities.do", new FacilitiesControl());
		
		// [조민성] 호텔리스트 페이지
		map.put("/hotelList.do", new HotelListControl());
		
		// [조민성] 호텔 상세페이지
		map.put("/roomDetail.do", new RoomDetailControl());
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
