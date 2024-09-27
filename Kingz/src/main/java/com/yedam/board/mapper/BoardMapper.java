package com.yedam.board.mapper;

import java.util.List;

import com.yedam.board.vo.BoardVO;

public interface BoardMapper {
	List<BoardVO> selectList(String boardType);
}
