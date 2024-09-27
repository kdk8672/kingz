package com.yedam.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.board.vo.BoardVO;
import com.yedam.common.DataSource;
import com.yedam.board.mapper.BoardMapper;

public class BoardServiceImpl implements BoardService {

	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
	
	@Override
	public List<BoardVO> boardList(String boardType) {
		return mapper.selectList(boardType);
	}
	
	
}
