package com.yedam.reservation.control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.common.RoomSearchDTO;
import com.yedam.hotel.HotelService;
import com.yedam.hotel.HotelServiceImpl;
import com.yedam.hotel.HotelVO;

public class ReservControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		System.out.println("[ReservControl.java] 호출 완료!");
		
		String roomType;
		Date checkin = new Date();
		Date checkout = new Date();
		int headcount;
		
		// 첫 페이지 호출일 경우, 검색 초기값을 설정 설정. 아니면 form에서 가져온 값을 검색값으로 설정
		if (request.getParameter("inHeadcount") == null && request.getParameter("roomType") == null) {
			roomType = "리조트";
			headcount = 1;
		} else if (request.getParameter("roomType") == null) {
			roomType = "리조트";
			headcount = Integer.parseInt(request.getParameter("inHeadcount"));
		} else if (request.getParameter("inHeadcount") == null) {
			roomType = request.getParameter("roomType");
			headcount = 1;
		} else {
			roomType = request.getParameter("roomType");
			headcount = Integer.parseInt(request.getParameter("inHeadcount"));			
		}
		
		try {
			checkin = sdf.parse(request.getParameter("inDate"));	// "01/01/24" String 형식을
			checkout = sdf.parse(request.getParameter("outDate"));	// Date가 알아먹을 수 있게 변환(SimpleDateFormat)
		} catch (ParseException e) {
			System.out.println("[ReservControl.java] Date객체 parse 과정에서 오류 발생: 날짜를 안 넣은 것 같음");
		} catch (NullPointerException e) {
			System.out.println("[ReservControl.java] 첫 페이지 호출입니다.");
		}
		
		
		System.out.println("[ReservControl.java] roomType: " + roomType + " | checkin: " + checkin + " | checkout:" + checkout + " | headcount: " + headcount);
		// roomType: 호텔 | checkin: 09/03/2024 | checkout:09/26/2024 | headcount: 6
		
		RoomSearchDTO search = new RoomSearchDTO();
		search.setRoomType(roomType);
		search.setCheckin(checkin);
		search.setCheckout(checkout);
		search.setHeadcount(headcount);
		System.out.println("[ReservControl.java] search: " + search);
		
		
//		[박진석 | 24.09.25] 객실 종류 검색을 위해 Hotel(room 테이블)과 관련된 패키지 접근
		HotelService svc = new HotelServiceImpl();
		List<HotelVO> list = svc.getHotelRoomTypeList();
		
		List<HotelVO> roomList = svc.getFilteredRoomList(search);
		
		System.out.println("[ReservControl.java] roomList: " + roomList);
		
		request.setAttribute("roomTypelist", list);
		request.setAttribute("roomList", roomList);		
//		request.getRequestDispatcher("reservation/reserv.tiles").forward(request, response);
		request.getRequestDispatcher("reservation/body.tiles").forward(request, response);
	}
}
