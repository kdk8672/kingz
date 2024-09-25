<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Apexcharts - Mazer Admin Dashboard</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="adminassets/css/bootstrap.css">

<link rel="stylesheet" href="adminassets/vendors/apexcharts/apexcharts.css">

<link rel="stylesheet"
	href="adminassets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="adminassets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="adminassets/css/app.css">
<link rel="shortcut icon" href="adminassets/images/favicon.svg"
	type="image/x-icon">
<style>
	.card-header{
		display: flex;
		padding-bottom: 170px;
	}
	.form-select {
		display: block;
		width: 6%;
		float: right;
		margin-left: auto;
	}
	.form-select ul{
		width: 100%;
	}
	.nice-select.form-select {
		background-image: none;
	}
</style>

<div class="bradcam_area breadcam_bg_1">
	<h3>호텔 통계</h3>
</div>
<section class="section">
	<div class="row">
		<div class="col-md">
			<div class="card">
				<div class="card-header">
					<h4>월별 매출</h4>
					<select class="form-select"></select>
				</div>
				<div class="card-body">
					<div id="area"></div>
				</div>
			</div>
		</div>
	</div>
</section>

<script src="adminassets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="adminassets/js/bootstrap.bundle.min.js"></script>

<script src="adminassets/vendors/dayjs/dayjs.min.js"></script>
<script src="adminassets/js/selectYear.js"></script>
<script src="adminassets/vendors/apexcharts/apexcharts.js"></script>
<script src="adminassets/js/pages/ui-apexchart.js"></script>

<script src="adminassets/js/main.js"></script>