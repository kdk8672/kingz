package com.yedam.admin.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.admin.service.AdminService;
import com.yedam.admin.service.AdminServiceImpl;
import com.yedam.admin.vo.AdminVO;
import com.yedam.common.Control;

public class AdminUserListControl implements Control{

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminService svc = new AdminServiceImpl();
		List<AdminVO> list = svc.userList();
		
		request.setAttribute("users", list);
		
		request.getRequestDispatcher("admin/userList.tiles").forward(request, response);
		
	}
	
}
