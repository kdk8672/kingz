package com.yedam.reservation.control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.yedam.common.Control;
import com.yedam.common.DataSource;
import com.yedam.reservation.mapper.ReservMapper;
import com.yedam.reservation.vo.ReservVO;

public class AddReservControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
		System.out.println("[AddReservControl.java 호출 완료!");
		
		String memberId = request.getParameter("memberid");
		int roomId = Integer.parseInt(request.getParameter("roomId"));
		Date checkin = new Date();
		Date checkout = new Date();
		
		try {
			checkin = sdf.parse(request.getParameter("checkin"));		// "01-01-24" String 형식을
			checkout = sdf.parse(request.getParameter("checkout"));		// Date가 알아먹을 수 있게 변환(SimpleDateFormat)
		} catch (ParseException e) {
			System.out.println("[AddReservControl.java] Date객체 parse 과정에서 오류 발생");
			e.printStackTrace();
		}
		
		int headcount = Integer.parseInt(request.getParameter("headcount"));
		int breakfast = 0;
		
		if (request.getParameter("breakfast") == "on") {	// breakfast 체크박스 값이 활성화 되어있으면 "on"을 갖고오므로
			breakfast = 1;									// 해당 경우는 0이 아닌 int 값(1)으로 설정.
		}
		
		String requestStr = request.getParameter("request");
		
		String roomName = request.getParameter("roomName");
		int sleepDay = Integer.parseInt(request.getParameter("sleepDay"));
		int roomPrice = Integer.parseInt(request.getParameter("roomPrice"));
		int breakfastPrice = Integer.parseInt(request.getParameter("breakfastPrice"));
		int pointPrice = Integer.parseInt(request.getParameter("pointPrice"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		System.out.print("[AddReservContol.java] sleepDay: " + sleepDay);
		System.out.print(" | roomPrice: " + roomPrice);
		System.out.print(" | breakfastPrice: " + breakfastPrice);
		System.out.print(" | pointPrice: " + pointPrice);
		System.out.print(" | totalPrice: " + totalPrice);
		System.out.print(" | roomName: " + roomName);
		
		
		ReservVO rvo = new ReservVO();
		rvo.setMemberId(memberId);
		rvo.setRoomId(roomId);
		rvo.setCheckin(checkin);
		rvo.setCheckout(checkout);
		rvo.setHeadcount(headcount);
		rvo.setBearkfast(breakfast);
		rvo.setRequest(requestStr);
		
		System.out.println("[AddReservControl.java] rvo 객체: " + rvo);
		
		SqlSessionFactory factory = DataSource.getInstance();
		SqlSession session = factory.openSession(true);
		ReservMapper mapper = session.getMapper(ReservMapper.class);
		
		if(mapper.updateReserv(rvo) == 1) {
			System.out.println("[AddReservContol.java] updateReserv 작업 완료");
			request.setAttribute("roomName", roomName);
			request.setAttribute("checkin", checkin);
			request.setAttribute("checkout", checkout);
			request.setAttribute("sleepDay", sleepDay);
			request.setAttribute("headcount", headcount);
			request.setAttribute("roomPrice", roomPrice);
			request.setAttribute("breakfastPrice", breakfastPrice);
			request.setAttribute("pointPrice", pointPrice);
			request.setAttribute("totalPrice", totalPrice);
			request.getRequestDispatcher("reservComplete.do").forward(request, response);
		} else {
			System.out.println("[AddReservContol.java] updateReserv 작업 실패");
			request.setAttribute("error", "reservFail");
			request.getRequestDispatcher("reservComplete.do").forward(request, response);
		}
		
		
	}

}
