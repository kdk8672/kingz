package com.yedam.admin.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.admin.service.AdminService;
import com.yedam.admin.service.AdminServiceImpl;
import com.yedam.admin.vo.AdBoardVO;
import com.yedam.common.Control;

public class AdminAddBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		AdminService svc = new AdminServiceImpl();
		AdBoardVO board = new AdBoardVO();
		board.setBoardTitle(title);
		board.setBoardContent(content);
		
		if(svc.addBoard(board)) {
			response.sendRedirect("boardNotice.do?boardType=NOTICE");
		} else {
			System.out.println("등록 오류");
		}
	}

}
