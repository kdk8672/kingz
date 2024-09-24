package com.yedam.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.review.mapper.ReviewMapper;

public class ReviewServiceImpl implements ReviewService {
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);

	@Override
	public List<ReviewVO> getReviewList(int roomId) {
		return mapper.reviewList(roomId);
	}

	@Override
	public boolean addReview(ReviewVO rvo) {
		return mapper.insertReview(rvo) == 1;
	}
	
}
