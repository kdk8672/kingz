package com.yedam.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.review.ImageVO;
import com.yedam.review.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> reviewList(int roomId);
	int selectReviewId();
	int insertReview(ReviewVO rvo);
	int insertImage(ImageVO ivo);
	
	int reviewCheck(@Param("roomId") int roomId, @Param("memberId") String memberId);
	int countReserve(@Param("memberId") String memberId, @Param("roomId") int roomId);
	int countReview(@Param("memberId") String memberId, @Param("roomId") int roomId);
}
