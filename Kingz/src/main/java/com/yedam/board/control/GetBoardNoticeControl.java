package com.yedam.board.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.board.vo.BoardVO;
import com.yedam.common.Control;

public class GetBoardNoticeControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		BoardService svc = new BoardServiceImpl();
		
		BoardVO board = svc.getBoard(Integer.parseInt(id));

		request.setAttribute("board", board);
		
		request.getRequestDispatcher("board/noticeDetail.tiles").forward(request, response);

	}

}
