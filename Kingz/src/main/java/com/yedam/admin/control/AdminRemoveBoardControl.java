package com.yedam.admin.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.admin.service.AdminService;
import com.yedam.admin.service.AdminServiceImpl;
import com.yedam.common.Control;

public class AdminRemoveBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardId = request.getParameter("boardId");
		
		AdminService svc = new AdminServiceImpl();
		
		if(svc.removeBoard(Integer.parseInt(boardId))){
			// 게시판 목록으로 이동 rd 추가
			System.out.println("게시판 삭제");
		} else{
			// 오류 메시지 전달
			System.out.println("삭제 오류");
		}

	}

}
