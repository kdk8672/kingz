package com.yedam.admin.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.admin.service.AdminService;
import com.yedam.admin.service.AdminServiceImpl;
import com.yedam.admin.vo.AdminVO;
import com.yedam.common.Control;

public class AdminBalanceListControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<>();
		
		String pyear = request.getParameter("pyear");
		
		AdminService svc = new AdminServiceImpl();
		List<AdminVO> list = svc.balanceList(Integer.parseInt(pyear));
		
		map.put("balances", list);
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(map);
		response.getWriter().print(json);

	}

}