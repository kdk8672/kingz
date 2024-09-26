package com.yedam.review.mapper;

import java.util.List;

import com.yedam.review.ImageVO;
import com.yedam.review.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> reviewList(int roomId);
	int selectReviewId();
	int insertReview(ReviewVO rvo);
	int insertImage(ImageVO ivo);
//	ReviewVO getReviewByReserveId(int reservId);
}
