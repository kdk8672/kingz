<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg_1">
	<h3>Rooms</h3>
</div>
<!-- bradcam_area_end -->

<!-- features_room_startt -->
<div class="features_room">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="section_title text-center mb-100">
					<span>객실 소개</span>
					<h3>Hotel</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="rooms_here">
		<c:forEach var="hotel" items="${list}">
			<div class="single_rooms">
				<div class="room_thumb">
					<img src="img/rooms/${hotel.imageUrl}" alt="">
					<div
						class="room_heading d-flex justify-content-between align-items-center">
						<div class="room_heading_inner">
							<span>1박/${hotel.roomPrice}₩</span>
							<h3>${hotel.roomName}</h3>
							<a class="card-hover-text">${hotel.roomContent}</a>
						</div>
						<a href="roomDetail.do?roomId=${hotel.roomId}" class="line-button">상세보기</a>
					</div>
				</div>
			</div>
			<c:if test="${not empty message}">
				<div class="alert alert-danger" role="alert">${message}</div>
			</c:if>
		</c:forEach>
	</div>
</div>
<!-- features_room_end -->