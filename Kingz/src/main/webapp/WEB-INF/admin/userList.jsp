<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.nice-select.dataTable-selector {
		display: none;
	}
	select.dataTable-selector.form-select {
		display: block!important;
	}
	.nice-select.form-select {
		background-image: none;
	}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="adminassets/css/bootstrap.css">

<link rel="stylesheet" href="adminassets/vendors/simple-datatables/style.css">

<link rel="stylesheet"
	href="adminassets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="adminassets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="adminassets/css/app.css">
<link rel="shortcut icon" href="adminassets/images/favicon.svg"
	type="image/x-icon">



<div class="bradcam_area breadcam_bg_1">
	<h3>회원 관리</h3>
</div>

<section class="section">
	<div class="card">
		<div class="card-body">
			<table class="table table-striped" id="table1">
				<thead>
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>등급</th>
						<th>탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${users}">
						<tr>
							<td>${user.memberId}</td>
							<td>${user.password}</td>
							<td>${user.name}</td>
							<td>${user.email}</td>
							<td>${user.phone}</td>
							<c:choose>
								<c:when test="${user.grade eq '일반'}">
									<td><span class="badge bg-dark">${user.grade}</span></td>
								</c:when>
								<c:when test="${user.grade eq 'VIP'}">
									<td><span class="badge bg-warning">${user.grade}</span></td>
								</c:when>
								<c:when test="${user.grade eq 'VVIP'}">
									<td><span class="badge bg-primary">${user.grade}</span></td>
								</c:when>
								<c:otherwise>
									<td><span class="badge bg-info">${user.grade}</span></td>
								</c:otherwise>
							</c:choose>
							<td><a href="deleteUser.do?mid=${user.memberId}" class="btn btn-sm btn-outline-danger">탈퇴</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>


<script src="adminassets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="adminassets/js/bootstrap.bundle.min.js"></script>

<script src="adminassets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
	// Simple Datatable
	let table1 = document.querySelector('#table1');
	let dataTable = new simpleDatatables.DataTable(table1);
	console.log(table1);
</script>