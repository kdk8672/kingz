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

	@Override
	public boolean addImage(ImageVO ivo) {
		return mapper.insertImage(ivo) == 1;
	}

	@Override
	public int getReviewId() {
		return mapper.selectReviewId();
	}

	@Override
	public int reviewCheck(int roomId, String memberId) {
		return mapper.reviewCheck(roomId, memberId);
	}

	@Override
	public int getReserveCnt(String memberId, int roomId) {
		return mapper.countReserve(memberId, roomId);
	}

	@Override
	public int getReviewCnt(String memberId, int roomId) {
		return mapper.countReview(memberId, roomId);
	}

}
