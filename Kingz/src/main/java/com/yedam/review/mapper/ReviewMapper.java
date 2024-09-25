package com.yedam.review.mapper;

import java.util.List;

import com.yedam.review.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> reviewList(int roomId);
	int insertReview(ReviewVO rvo);
}
