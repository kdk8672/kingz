<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<style>
.h4, p {
color: white;
}

table{
	margin : auto;
    width : 80%;
</style>

<c:choose>
	<c:when test="${status eq 'reservSuccess' }">
		<%-- <jsp:forward page="mypage.do?memberId=${memberId }" /> --%>
		<div class="slider_area">
			<div class="slider_active owl-carousel">
				<div
					class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
					<div class="container">
						<div class="row">
							<div class="col-xl-12">
								<div class="slider_text text-center" style="text-align: center;">
									<table>
										<tr>
											<td colspan="2"><h3>결제 완료</h3></td>
										</tr>
										<tr>
											<td colspan="2"><p>${roomName }</p></td>
										</tr>
										<tr>
											<td><p>Checkin : </p></td><td><p>${checkin }</p></td>
										</tr>
										<tr>
											<td><p>Checkout : </p></td><td><p>${checkout }</p></td>
										</tr>
										<tr>
											<td></td><td><p>${sleepDay }박${sleepDay + 1 }일</p></td>
										</tr>
										<tr>
											<td><p>인원 : </p></td><td><p>${headcount }</p></td>
										</tr>
										<tr>
										</tr>
										<tr>
											<td><p>객실금액 : </p></td><td><p>${roomPrice }</p></td>
										</tr>
										<tr>
											<td><p>조식금액 : </p></td><td><p>${breakfastPrice }</p></td>
										</tr>
										<tr>
											<td><p>포인트 : </p></td><td><p>${pointPrice }</p></td>
										</tr>
										<tr>
											<td><p>총 결제금액 : </p></td><td><p>${totalPrice }</p></td>
										</tr>
									</table>
									
									
									<%-- 
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
									
									 --%>
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
