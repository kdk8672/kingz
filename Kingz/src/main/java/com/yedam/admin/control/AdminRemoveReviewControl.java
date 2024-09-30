package com.yedam.admin.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.admin.service.AdminService;
import com.yedam.admin.service.AdminServiceImpl;
import com.yedam.common.Control;

public class AdminRemoveReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<>();
		
		String reviewId = request.getParameter("reviewId");
		
		AdminService svc= new AdminServiceImpl();
		
		if(svc.removeReview(Integer.parseInt(reviewId))){
			// 지운 상세 페이지로 이동 rd 추가
			map.put("result", "OK");
		} else {
			// 오류 메시지 전달
			map.put("result", "ER");
		}
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(map);
		response.getWriter().print(json);
	}

}
