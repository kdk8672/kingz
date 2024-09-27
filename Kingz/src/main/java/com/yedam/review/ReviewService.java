package com.yedam.review;

import java.util.List;

public interface ReviewService {
	List<ReviewVO> getReviewList(int roomId);
	int getReviewId();
	boolean addReview(ReviewVO rvo);
	boolean addImage(ImageVO ivo);
}
