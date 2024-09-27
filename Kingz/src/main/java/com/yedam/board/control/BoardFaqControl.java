package com.yedam.board.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.board.vo.BoardVO;
import com.yedam.common.Control;

public class BoardFaqControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardType = request.getParameter("boardType");
		
		BoardService svc = new BoardServiceImpl();
		
		List<BoardVO> list = svc.boardList(boardType);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("board/boardFaq.tiles").forward(request, response);
	}

}
