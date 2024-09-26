package com.yedam.member.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class CheckIdControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		
		Map<String, Object> map = new HashMap<>();
		
		String id = request.getParameter("id");
		
		MemberService svc = new MemberServiceImpl();
		
		
		if(svc.getMember(id)) {
			map.put("retCode", "OK"); 

		} else {
			map.put("retCode", "NG"); 

		}
		
		String json = gson.toJson(map);
		response.getWriter().print(json);
		
	}

}
