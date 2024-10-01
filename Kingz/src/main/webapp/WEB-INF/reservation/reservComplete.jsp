<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<style>
.h4, p {
color: white;
}
</style>

<c:choose>
	<c:when test="${status eq 'reservSuccess' }">
		<div class="slider_area">
			<div class="slider_active owl-carousel">
				<div
					class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
					<div class="container">
						<div class="row">
							<div class="col-xl-12">
								<div class="slider_text text-center">
									<h3>결제 완료</h3>
									<br>
									<h4>${roomName }</h4>
									<p>Checkin: ${checkin }</p>
									<p>Checkout: ${checkout }</p>
									<p>${sleepDay }박${sleepDay + 1 }일</p>
									<p>인원: ${headcount }</p>
									<br>
									<h4>TOTAL</h4>
									<p>객실금액 ${roomPrice }</p>
									<p>조식 ${breakfastPrice }</p>
									<p>포인트 ${pointPrice }</p>
									<p>총 결제금액 ${totalPrice }</p>
									<p>${memberId }</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="slider_area">
			<div class="slider_active owl-carousel">
				<div
					class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
					<div class="container">
						<div class="row">
							<div class="col-xl-12">
								<div class="slider_text text-center">
									<h3>결제 실패</h3>
									<br>
									<p style="color: white;">${message }</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</c:otherwise>

</c:choose>
<!-- slider_area_end -->
