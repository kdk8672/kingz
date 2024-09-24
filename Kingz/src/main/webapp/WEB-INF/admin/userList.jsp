<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="bradcam_area breadcam_bg_1">
	<h3>회원 정보</h3>
</div>
<div id="users">

	<div class="progress-table">
		<div class="table-head">
			<div class="country">아이디</div>
			<div class="visit">비밀번호</div>
			<div class="percentage">이메일</div>
			<div class="visit">전화번호</div>
			<div class="visit">등급</div>
		</div>
		<c:forEach var="user" items="${users}">
			<div class="table-row">
				<div class="serial">${user.memberId}</div>
				<div class="country">${user.password}</div>
				<div class="visit">${user.email}</div>
				<div class="percentage">${user.phone}</div>
				<div class="percentage">${user.grade}</div>
			</div>
		</c:forEach>
	</div>
</div>

