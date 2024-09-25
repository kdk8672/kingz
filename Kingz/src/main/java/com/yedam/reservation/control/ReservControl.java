package com.yedam.reservation.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class ReservControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[ReservControl.java] 호출 완료!");
		request.getRequestDispatcher("reservation/reserv.tiles").forward(request, response);
	}
	
	

}
