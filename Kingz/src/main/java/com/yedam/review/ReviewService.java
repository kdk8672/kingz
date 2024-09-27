package com.yedam.review;

import java.util.List;

public interface ReviewService {
	List<ReviewVO> getReviewList(int roomId);
	int getReviewId();
	boolean addReview(ReviewVO rvo);
	boolean addImage(ImageVO ivo);
	
	int reviewCheck(int roomId, String memberId);
	int getReserveCnt(String memberId, int roomId);
	int getReviewCnt(String memberId, int roomId);
}
