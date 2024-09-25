package com.yedam.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.review.mapper.ReviewMapper;

public class ReviewServiceImpl implements ReviewService {
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
//	ReservMapper map = sqlSession.getMapper(ReservMapper.class);

	@Override
	public List<ReviewVO> getReviewList(int roomId) {
		return mapper.reviewList(roomId);
	}

	@Override
	public boolean addReview(ReviewVO rvo) {
		
//		ReservVO reservation = map.reviewCheck(rvo.getRoomId(), rvo.getMemberId());
//		if(reservation != false) {
//			return mapper.insertReview(rvo) == 1;
//		} else {
//			return false;
//		}
			
		return mapper.insertReview(rvo) == 1;
	}
	
}
