package com.yedam.review;

import java.util.List;

public interface ReviewService {
	List<ReviewVO> getReviewList(int roomId);
	boolean addReview(ReviewVO rvo);
}
