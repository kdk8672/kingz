package com.yedam.admin.mapper;

import java.util.List;

import com.yedam.admin.vo.AdminVO;

public interface AdminMapper {
	List<AdminVO> selectUsers();
}
