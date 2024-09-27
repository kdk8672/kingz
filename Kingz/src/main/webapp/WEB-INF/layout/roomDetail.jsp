<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<div class="bradcam_area breadcam_bg">
	<h3>Rooms</h3>
</div>

<!-- features_room_startt -->
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
				<img src="img/rooms/${room.imageUrl}" alt="">
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
								<p>
									이용안내<br> 실내외 수영장, 피트니스 클럽 무료 이용<br> <br>
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
						<a href="reserv.do" class="genric-btn info e-large"
							style="font-size: 17px">예약하기</a>
					</div>
				</div>
			</section>
		</div>


		<div class="whole-wrap">
			<div class="container box_1170">
				<h2 class="mb-30">객실 리뷰</h2>
				<c:forEach var="review" items="${list}">
					<div class="section-top-border">
						<h3 class="mb-30">${review.memberId}</h3>
						<h3 class="mb-30">${review.rating}.0</h3>
						<div class="row">
							<c:if test="${not empty review.imageUrl}">
								<div class="col-md-3">
									<img src="img/reviews/${review.imageUrl}" alt=""
										class="img-fluid">
								</div>
							</c:if>
							<!-- <div class="col-md-3">
								<img src="img/elements/${review.imageUrl}" alt=""
									class="img-fluid">
							</div> -->
							<div class="col-md-9 mt-sm-20">
								<p>${review.reviewContent}</p>
							</div>
						</div>
						<br>
						<p class="date" style="text-align: right">${review.reviewDate}</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="comment-form">
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
						<div class="form-group">
							<input class="form-control" name="roomName" id="roomName"
								type="text" value="${room.roomName}" readonly>
						</div>
					</div>
					<!--<div class="col-6">
						<div class="form-group">
							<input class="form-control" name="memberId" id="memberId"
								type="text" value="${rvo.memberId}" readonly>
						</div>
					</div>-->
					<div class="col-12">
						<!-- <div class="nice-select form-select wide form-group" tabindex="0">
							<span class="current">별점</span>
							<ul class="list">
								<li data-value="1" data-display="1" class="option"><input class="form-control" name="rating" id="rating"
								type="number" value="1"></li>
								<li data-value="2" data-display="2" class="option"><input class="form-control" name="rating" id="rating"
								type="number" value="2"></li>
								<li data-value="3" data-display="3" class="option"><input class="form-control" name="rating" id="rating"
								type="number" value="3"></li>
								<li data-value="4" data-display="4" class="option"><input class="form-control" name="rating" id="rating"
								type="number" value="4"></li>
								<li data-value="5" data-display="5" class="option"><input class="form-control" name="rating" id="rating"
								type="number" value="5"></li>
							</ul>
						</div> -->
						<div class="form-group">
							<input class="form-control" name="rating" id="rating"
								type="number" placeholder="별점을 매겨주세요">
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
							<input type="file" id="imageUrl" name="imageUrl">
						</div>
					</div>
				</div>
				<div class="form-group">
					<button type="submit"
						class="button button-contactForm btn_1 boxed-btn">등록하기</button>
				</div>
			</form>
		</div>
	</div>

</div>

<!-- features_room_end -->