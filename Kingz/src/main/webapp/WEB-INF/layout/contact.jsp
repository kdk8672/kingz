<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg_2">
	<h3>Contact</h3>
</div>
<!-- bradcam_area_end -->

<!-- ================ contact section start ================= -->
<section class="contact-section">
	<div class="container">
		<div class="d-none d-sm-block mb-5 pb-4">
			<div id="map"
				style="height: 480px; position: relative; overflow: hidden;">

			</div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0cb2debbe68a2c4d5b77ebf8b73aeda9"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(35.86911876218126,
							128.5935472654651), // 지도의 중심좌표
					level : 1
				// 지도의 확대 레벨
				};

				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 마커가 표시될 위치입니다 
				var markerPosition = new kakao.maps.LatLng(35.86911876218126,
						128.5935472654651);

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					position : markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

				var iwContent = '<div style="padding:5px;">Kingz Hotel<br><a href="https://map.kakao.com/link/map/Hello World!,35.86911876218126,128.5935472654651" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,35.86911876218126,128.5935472654651" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				iwPosition = new kakao.maps.LatLng(35.86911876218126,
						128.5935472654651); //인포윈도우 표시 위치입니다

				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					position : iwPosition,
					content : iwContent
				});

				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker);
			</script>
		</div>


		<div class="row">
			<div class="col-lg-8">
				<h2 class="contact-title">교통 정보</h2>
			</div>
			<div class="col-lg-8">
				<div class="media contact-info">
					<div class="media-body">
						<h3>버스</h3>
						<p>206 270 280</p>
						<h3>지하철</h3>
						<p>중앙로역 14번 출구 반월당역 2번 출구</p>
						<h3>도보</h3>
						<p>태왕아너스 건물 5층</p>
					</div>
				</div>
			</div>
			<!-- <div class="col-lg-8">
				<h2 class="contact-title">주변 정보</h2>
			</div> 
			<div class="col-lg-8">
				<div class="media contact-info">
					<div class="media-body">
						<h3>Buttonwood, California.</h3>
						<p>Rosemead, CA 91770</p>
					</div>
				</div>
			</div>-->
			<div class="col-lg-3 offset-lg-1">
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-home"></i></span>
					<div class="media-body">
						<h3>Buttonwood, California.</h3>
						<p>Rosemead, CA 91770</p>
					</div>
				</div>
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-tablet"></i></span>
					<div class="media-body">
						<h3>+1 253 565 2365</h3>
						<p>Mon to Fri 9am to 6pm</p>
					</div>
				</div>
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-email"></i></span>
					<div class="media-body">
						<h3>support@colorlib.com</h3>
						<p>Send us your query anytime!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- ================ contact section end ================= -->