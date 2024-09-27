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
//		if(reservation != null) {
//		// 예약 번호로 이미 리뷰가 등록되었는지 확인
//      	ReviewVO existingReview = reviewMapper.getReviewByReserveId(reservation.getReserveId());
//        
//        	if (existingReview == null) {
//            	// 리뷰가 아직 등록되지 않은 경우에만 리뷰 등록
//            	rvo.setReserveId(reservation.getReserveId());
//            	return reviewMapper.insertReview(rvo) == 1;
//        	} else {
//            	// 이미 리뷰가 등록된 경우
//            	return false;
//        	}
//    	} else {
//        	// 체크아웃이 지나지 않았거나 예약 정보가 없는 경우
//        	return false;
//   	}
			
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

}
