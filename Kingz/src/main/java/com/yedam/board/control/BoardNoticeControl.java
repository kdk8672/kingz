package com.yedam.board.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.common.Control;

public class BoardNoticeControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardType = request.getParameter("boardType");
		
		BoardService svc = new BoardServiceImpl();
		
		
		
	}

}
