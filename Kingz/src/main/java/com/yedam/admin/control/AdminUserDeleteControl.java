package com.yedam.admin.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.admin.service.AdminService;
import com.yedam.admin.service.AdminServiceImpl;
import com.yedam.common.Control;

public class AdminUserDeleteControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid"); // 회원 아이디
		
		AdminService svc = new AdminServiceImpl();
		
		if(svc.deleteUser(mid)) {
			response.sendRedirect("userList.do");
		} else {
			request.getRequestDispatcher("admin/userList.tiles").forward(request, response);
			System.out.println("삭제 중 오류 발생");
		}
	}

}
