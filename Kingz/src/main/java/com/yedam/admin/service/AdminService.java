package com.yedam.admin.service;

import java.util.List;

import com.yedam.admin.vo.AdBoardVO;
import com.yedam.admin.vo.AdminVO;

public interface AdminService {
	List<AdminVO> userList();
	boolean deleteUser(String memberId);
	List<AdminVO> balanceList(int year);
	List<AdminVO> balanceYearList();
	List<AdminVO> gradeCounts();
	List<AdminVO> roomReserveCounts();
	boolean addBoard(AdBoardVO board);
	boolean removeBoard(int boardId);
	boolean removeReview(int reviewId);
}
