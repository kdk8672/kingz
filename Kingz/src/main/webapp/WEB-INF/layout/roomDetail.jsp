<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<style>
.comment-form .form-group {
	margin-bottom: 20px;
}

.star.filled {
	color: #ff7009;
}

.star.half-filled {
	color: #ff7009;
	position: relative;
}

.star.half-filled:before {
	content: '\2605';
	color:# ff7009;
	position: absolute;
	left: 0;
	width: 50%;
	overflow: hidden;
}

.room_thumb img {
	width: 100%;
	height: auto;
	object-fit: cover;
}
</style>

<script type="text/javascript">
	var msg = "${msg}";
	if (msg) {
		alert(msg);
	}
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div class="bradcam_area breadcam_bg">
	<h3>Rooms</h3>
</div>

<div class="features_room">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="section_title text-center mb-100">
					<span>${room.roomType} 객실</span>
					<h3>${room.roomName}</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="whole-wrap">
		<div class="container box_1170">
			<div class="room_thumb">
				<img src="img/rooms/${room.imageUrl}" alt="" class="img-fluid">
			</div>
			<section class="blog_area single-post-area section-padding">
				<div class="section-top-border">
					<h2 class="mb-30">객실 정보</h2>
					<div class="row">
						<div class="col-md-4">
							<div class="single-defination">
								<h4 class="mb-20">
									<b class="text-dark">기본정보</b>
								</h4>
								<br>
								<p>객실크기</p>
								<p>· ${room.roomSize}</p>
								<p>위치</p>
								<p>· ${room.roomLoc}</p>
								<p>전망</p>
								<p>· ${room.roomView}</p>
								<p>구성</p>
								<p>· ${room.roomDetail}</p>
								<p>타입</p>
								<p>· ${room.roomBed}</p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="single-defination">
								<h4 class="mb-20">
									<b class="text-dark">이용안내</b>
								</h4>
								<br>
								<p>
									시설 이용안내<br> 실내외 수영장, 피트니스 클럽 무료 이용<br> <br>
									체크인/체크아웃<br> · 체크인 15시, 체크아웃 12시<br> <br> Extra
									Bed 및 인원 추가<br> · 침대 및 인원 추가: 48,400원/1EA•1인
								</p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="single-defination">
								<h4 class="mb-20">
									<b class="text-dark">이용규정</b>
								</h4>
								<br>
								<p>
									예약 취소 안내<br> · 숙박 2일 전: 객실 요금의 30% 부과<br> · 숙박 1일 전:
									객실 요금의 50% 부과<br> · 숙박 당일 또는 No Show: 객실 요금의 100% 부과<br>
									<br> 성수기 예약 취소 안내<br> · 숙박 6~7일 전: 객실 요금의 30% 부과<br>
									· 숙박 4~5일 전: 객실 요금의 50% 부과<br> · 숙박 당일(No Show) 또는 3일 전:
									객실 요금의 100% 부과<br> · 단체 행사의 경우는 별도의 취소 정책이 적용됩니다.<br>
									<br> · 예약하신 일자에 체크인 되지 않거나, 위의 지정 시간 이후에 예약을 취소했을 경우에는 노-쇼
									(No Show) 처리되며, 이에 따른 위약금으로 예약 첫날에 해당하는 객실 요금이 청구되오니 유의하시기
									바랍니다.
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div style="text-align: center">
						<a href="reserv.do"
							class="button button-contactForm btn_1 boxed-btn"
							style="font-size: 17px">예약하기</a>
					</div>
				</div>
			</section>
		</div>

		<div class="whole-wrap">
			<div class="container box_1170" id="roomDetailM">
				<h2 class="mb-30">객실 리뷰</h2>
				<c:forEach var="review" items="${list}" varStatus="status" >
				 <c:if test="${status.first || review.reviewId != list[status.index - 1].reviewId}">
					<div class="section-top-border">
						<div class="d-flex justify-content-between"
							data-rid="${review.reviewId}">
							<h3 class="mb-30">${review.memberId}</h3>
							<c:if test="${logGrade eq '관리자'}">
								<svg class="delReview" xmlns="http://www.w3.org/2000/svg"
									x="0px" y="0px" width="25" height="25" viewBox="0 0 24 24">
									<path
										d="M 10 2 L 9 3 L 4 3 L 4 5 L 5 5 L 5 20 C 5 20.522222 5.1913289 21.05461 5.5683594 21.431641 C 5.9453899 21.808671 6.4777778 22 7 22 L 17 22 C 17.522222 22 18.05461 21.808671 18.431641 21.431641 C 18.808671 21.05461 19 20.522222 19 20 L 19 5 L 20 5 L 20 3 L 15 3 L 14 2 L 10 2 z M 7 5 L 17 5 L 17 20 L 7 20 L 7 5 z M 9 7 L 9 18 L 11 18 L 11 7 L 9 7 z M 13 7 L 13 18 L 15 18 L 15 7 L 13 7 z"></path>
								</svg>
							</c:if>
						</div>
						<div class="star-rating"
							style="display: inline-block; margin-right: 10px">
							<c:forEach var="i" begin="1" end="5">
								<c:if test="${i <= review.rating}">
									<span class="star filled" style="font-size: 25px;">&#9733;</span>
								</c:if>
								<c:if test="${i > review.rating}">
									<c:if test="${review.rating >= (i - 0.5)}">
										<span class="star half-filled" style="font-size: 25px;">&#9734;</span>
									</c:if>
									<c:if test="${review.rating < (i - 0.5)}">
										<span class="star" style="font-size: 25px;">&#9734;</span>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
						<h3 class="mb-30" style="display: inline-block;">${review.rating}</h3>
						<div class="row">
							<c:if test="${not empty review.imageUrl}">
									<div class="col-md-3">
										<img src="img/review/${review.imageUrl}" alt=""
											class="img-fluid">
									</div>
							</c:if>
							<div class="col-md-9 mt-sm-20">
								<p style="font-size: 20px">${review.reviewContent}</p>
							</div>
						</div>
						<br>
						<p class="date" style="text-align: right; font-size: 19px;"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${review.reviewDate}"/></p>
					</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="comment-form" style="margin-bottom: 100px;">
		<div class="container box_1170">
			<h2>리뷰 남기기</h2>
			<br>
			<form class="form-contact comment_form" action="addReview.do"
				id="commentForm" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-12">
						<div class="form-group" style="display: none">
							<input class="form-control" name="roomId" id="roomId" type="text"
								value="${room.roomId}" readonly>
						</div>
					</div>
					<div class="col-12">
						<div class="from-group">
							<div class="rating">
								<label class="rating__label rating__label--half" for="starhalf">
									<input type="radio" id="starhalf" class="rating__input"
									name="rating" value="0.5"> <span class="star-icon"></span>
								</label> <label class="rating__label rating__label--full" for="star1">
									<input type="radio" id="star1" class="rating__input"
									name="rating" value="1"> <span class="star-icon"></span>
								</label> <label class="rating__label rating__label--half"
									for="star1half"> <input type="radio" id="star1half"
									class="rating__input" name="rating" value="1.5"> <span
									class="star-icon"></span>
								</label> <label class="rating__label rating__label--full" for="star2">
									<input type="radio" id="star2" class="rating__input"
									name="rating" value="2"> <span class="star-icon"></span>
								</label> <label class="rating__label rating__label--half"
									for="star2half"> <input type="radio" id="star2half"
									class="rating__input" name="rating" value="2.5"> <span
									class="star-icon"></span>
								</label> <label class="rating__label rating__label--full" for="star3">
									<input type="radio" id="star3" class="rating__input"
									name="rating" value="3"> <span class="star-icon"></span>
								</label> <label class="rating__label rating__label--half"
									for="star3half"> <input type="radio" id="star3half"
									class="rating__input" name="rating" value="3.5"> <span
									class="star-icon"></span>
								</label> <label class="rating__label rating__label--full" for="star4">
									<input type="radio" id="star4" class="rating__input"
									name="rating" value="4"> <span class="star-icon"></span>
								</label> <label class="rating__label rating__label--half"
									for="star4half"> <input type="radio" id="star4half"
									class="rating__input" name="rating" value="4.5"> <span
									class="star-icon"></span>
								</label> <label class="rating__label rating__label--full" for="star5">
									<input type="radio" id="star5" class="rating__input"
									name="rating" value="5" checked> <span
									class="star-icon"></span>
								</label>
							</div>
						</div>
						<div>
							<p></p>
						</div>
					</div>
					<div class="col-12">
						<div class="form-group">
							<input class="form-control" name="roomName" id="roomName"
								type="text" value="${room.roomName}" readonly>
						</div>
					</div>
					<div class="col-12">
						<div class="form-group">
							<input class="form-control w-100" name="reviewContent"
								id="reviewContent" placeholder="리뷰를 작성해주세요">
						</div>
					</div>
					<div class="col-12">
						<div class="form-group">
							<input type="file" id="imageUrl" name="imageUrl"
								accept="image/*" class="form-control">
						</div>
					</div>
				</div>
				<div class="form-group">
					<button type="submit" value="submit"
						class="button button-contactForm btn_1 boxed-btn">등록하기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="js/admin/delReview.js"></script>