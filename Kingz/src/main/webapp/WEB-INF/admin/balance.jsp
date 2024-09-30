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

	<script src="adminassets/js/plugin/webfont/webfont.min.js"></script>
	<script>
		WebFont.load({
			google: { families: ["Public Sans:300,400,500,600,700"] },
			custom: {
				families: [
					"Font Awesome 5 Solid",
					"Font Awesome 5 Regular",
					"Font Awesome 5 Brands",
					"simple-line-icons",
				],
				urls: ["../assets/css/fonts.min.css"],
			},
			active: function () {
				sessionStorage.fonts = true;
			},
		});
	</script>

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
<div class="list-group list-group-horizontal-sm mb-1 text-center"
     role="tablist">
     <a class="list-group-item list-group-item-action"
         id="list-sunday-list" href="userList.do"
         role="tab">회원 관리</a>
     <a class="list-group-item list-group-item-action active" id="list-monday-list"
         href="balance.do" role="tab">호텔 통계</a>
 </div>
<section class="section">
	<div class="row">
		<div class="col-md">
			<div class="card">
				<div class="card-header">
					<h4>호텔 매출</h4>
					<select class="form-select"></select>
				</div>
				<div class="card-body">
					<div id="area"></div>
				</div>
			</div>
		</div>
	</div>
</section>
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<div class="card-header">
				<div class="card-title">등급 별 회원</div>
			</div>
			<div class="card-body">
				<div class="chart-container">
					<canvas
						id="doughnutChart"
						style="width: 800px; height: 400px"
					></canvas>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="card">
			<div class="card-header">
				<div class="card-title">객실 예약</div>
			</div>
			<div class="card-body">
				<div class="chart-container">
					<canvas
						id="barChart"
						style="width: 800px; height: 400px"
					></canvas>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="adminassets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="adminassets/js/bootstrap.bundle.min.js"></script>

<script src="adminassets/vendors/dayjs/dayjs.min.js"></script>
<script src="adminassets/js/selectYear.js"></script>
<script src="adminassets/vendors/apexcharts/apexcharts.js"></script>
<!-- DB 매출 차트 생성 -->
<script src="adminassets/js/pages/ui-apexchart.js"></script>

<script src="adminassets/js/main.js"></script>

<script src="adminassets/js/core/jquery-3.7.1.min.js"></script>
<script src="adminassets/js/core/popper.min.js"></script>
<script src="adminassets/js/core/bootstrap.min.js"></script>
<!-- Chart JS -->
<script src="adminassets/js/plugin/chart.js/chart.min.js"></script>
<!-- jQuery Scrollbar -->
<script src="adminassets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<!-- Kaiadmin JS -->
<script src="adminassets/js/kaiadmin.min.js"></script>
<!-- Kaiadmin DEMO methods, don't include it in your project! -->
<script src="adminassets/js/setting-demo2.js"></script>
<!-- DB 등급, 객실 차트 생성 -->
<script src="adminassets/js/makeChart.js"></script> 