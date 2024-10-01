<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Kingz</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/gijgo.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/slicknav.css">
<link rel="stylesheet" href="css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header>
		<div class="header-area ">
			<div id="sticky-header" class="main-header-area">
				<div class="container-fluid p-0">
					<div class="row align-items-center no-gutters">
						<div class="col-xl-5 col-lg-6">
							<div class="main-menu  d-none d-lg-block">
								<nav>
									<ul id="navigation">

										<li><a href="main.do">HOME</a></li>
										<li><a href="hotelList.do">Hotel & Resort</a></li>
                                        <li><a href="facilities.do">시설</a></li>  
										<li><a href="contact.do">오시는 길</a></li>

									</ul>
								</nav>
							</div>
						</div>
						<div class="col-xl-2 col-lg-2">
							<div class="logo-img">
								<a href="index.jsp"> <img
									src="img/kingz_logo.png" alt="">
								</a>
							</div>
						</div>
						<div class="col-xl-5 col-lg-4 d-none d-lg-block">
							<div class="book_room">
								<div class="main-menu  d-none d-lg-block">
									<nav>

										<ul id="navigation">
                                        	<c:choose>
                                        		<c:when test="${empty id }">
                                        			<li><a href="login.do">로그인</a></li>
		                                            <li><a href="memberAddForm.do">회원가입</a></li>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<li><a href="logout.do">로그아웃</a></li>
                                        		</c:otherwise>
                                        	</c:choose>
                                            <c:choose>
                                            	<c:when test="${logGrade eq '관리자' }">
                                            		<li><a href="userList.do">관리페이지</a></li>
                                            	</c:when>
                                            	<c:when test="${empty id }">
                                            		<li><a href="login.do">마이페이지</a></li>
                                            	</c:when>
                                            	<c:otherwise> 
                                            		<li><a href="mypage.do?memberId=${id }">마이페이지</a></li>
                                            	</c:otherwise>
                                            </c:choose>

                                            <li><a href="#">고객센터<i class="ti-angle-down"></i></a>
                                        	<ul class="submenu">
                                                <li><a href="boardFaq.do?boardType=FAQ">FAQ</a></li>
												<li><a href="boardNotice.do?boardType=NOTICE">공지사항</a></li>
                                            </ul>
                                        </li>
                                        </ul>

									</nav>

								</div>
								<div class="book_btn d-none d-lg-block">
									<a class="popup-with-form" href="#test-form">예약하기</a>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- header-end -->

	<!-- bradcam_area_start -->
	<div class="bradcam_area breadcam_bg_1">
		<h3>Facilities</h3>
	</div>
	<!-- bradcam_area_end -->

	<!-- features_room_startt -->
	<div class="features_room">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title text-center mb-100">
						<span>몸과 마음이 건강한 여행을 즐겨보세요</span>
						<h3>Fitness</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="rooms_here">
			<div class="single_rooms">
				<div class="room_thumb">
					<img src="img/rooms/1.png" alt="">
					<div
						class="room_heading d-flex justify-content-between align-items-center">
						<div class="room_heading_inner">
							<span>문의 : 010-1234-5678</span> <span>위치 : 호텔 1층</span> <span>운영시간
								: 06:30-22:00</span>
							<h3>호텔 실내 수영장</h3>
							<a class="card-hover-text">유아용 풀과 자쿠지, 실내외 수영장이 연결된 수문으로 더욱 편리하고
								여유로운 스위밍을 즐겨보세요.</a>
						</div>
					</div>
				</div>
			</div>
			<div class="single_rooms">
				<div class="room_thumb">
					<img src="img/rooms/2.png" alt="">
					<div
						class="room_heading d-flex justify-content-between align-items-center">
						<div class="room_heading_inner">
							<span>문의 : 010-1234-5678</span> <span>위치 : 호텔 야외</span> <span>운영시간
								: 09:00-22:00</span>
							<h3>호텔 야외 수영장</h3>
							<a class="card-hover-text">히팅펌프 시스템으로 사계절 내내 따뜻한 풀에서 제주도 파도 소리를
								들으며 로맨틱한 여행의 추억을 만드세요.</a>
						</div>
					</div>
				</div>
			</div>
			<div class="single_rooms">
				<div class="room_thumb">
					<img src="img/rooms/3.png" alt="">
					<div
						class="room_heading d-flex justify-content-between align-items-center">
						<div class="room_heading_inner">
							<span>위치 : 리조트 야외</span> <span>운영시간 : 13:00-22:00</span>
							<h3>리조트 야외 수영장</h3>
							<a class="card-hover-text">사계절 온수풀로 새 단장한 야외 수영장에서 파도 소리와 함께 여유로운
								휴식을 완성하세요.</a>
						</div>
					</div>
				</div>
			</div>
			<div class="single_rooms">
				<div class="room_thumb">
					<img src="img/rooms/4.png" alt="">
					<div
						class="room_heading d-flex justify-content-between align-items-center">
						<div class="room_heading_inner">
							<span>문의 : 010-1234-5678</span> <span>위치 : 남자 사우나 1층, 여자
								사우나 2층</span> <span>운영시간 : 06:30-22:00</span>
							<h3>사우나</h3>
							<a class="card-hover-text">물 좋은 제주도의 따뜻한 천연 암반수에 몸을 담그며 여행의 피로를
								말끔히 풀어보세요.</a>
						</div>
					</div>
				</div>
			</div>
			<div class="single_rooms">
				<div class="room_thumb">
					<img src="img/rooms/1.png" alt="">
					<div
						class="room_heading d-flex justify-content-between align-items-center">
						<div class="room_heading_inner">
							<span>문의 : 010-1234-5678</span> <span>위치 : 호텔 2층</span> <span>운영시간
								: 06:30-22:00</span>
							<h3>피트니스센터</h3>
							<a class="card-hover-text">최신 트레이닝 기구와 요가 운동 프로그램으로 몸과 마음에 활기를
								되찾아 보세요.</a>
						</div>
					</div>
				</div>
			</div>
			<div class="single_rooms">
				<div class="room_thumb">
					<img src="img/rooms/2.png" alt="">
					<div
						class="room_heading d-flex justify-content-between align-items-center">
						<div class="room_heading_inner">
							<span>문의 : 010-1234-5678</span> <span>위치 : 호텔 2층</span> <span>운영시간
								: 13:00~22:00 (사전예약 필수)</span>
							<h3>스파 아라</h3>
							<a class="card-hover-text">맞춤 에센스를 블렌딩하여 만든 단 하나뿐인 케어로 청명한 제주 자연
								속 나만의 힐링을 누려보세요.</a>
						</div>
					</div>
				</div>
			</div>
			<div class="single_rooms">
				<div class="room_thumb">
					<img src="img/rooms/3.png" alt="">
					<div
						class="room_heading d-flex justify-content-between align-items-center">
						<div class="room_heading_inner">
							<span>문의 : 010-1234-5678</span> <span>위치 : 호텔 왼쪽 정문</span> <span>운영시간
								: 09:00~21:00 사전문의 요망</span>
							<h3>테니스코트</h3>
							<a class="card-hover-text">제주의 신선한 공기를 마시며 테니스를 즐겨보세요.</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- features_room_end -->

	<div class="features_room">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title text-center mb-100">
						<span>체험과 놀이, 학습까지 가능한 해비치 키즈 시설에서 우리 가족 모두 행복한 여행을 만들어 보세요.</span>
						<h3>Kids</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="rooms_here">
			<div class="single_rooms">
				<div class="room_thumb">
					<img src="img/rooms/4.png" alt="">
					<div
						class="room_heading d-flex justify-content-between align-items-center">
						<div class="room_heading_inner">
							<span>문의 : 010-1234-5678</span> <span>위치 : 리조트 지하 1층</span> <span>운영시간
								: 10:00 -22:00</span>
							<h3>놀이터</h3>
							<a class="card-hover-text">어린이용 클라이밍과 에어포켓이 마련된 키즈 놀이터에서 미취학 어린이들도 즐겁게 뛰어놀 수 있습니다.</a>
						</div>
					</div>
				</div>
			</div>
			<div class="single_rooms">
				<div class="room_thumb">
					<img src="img/rooms/1.png" alt="">
					<div
						class="room_heading d-flex justify-content-between align-items-center">
						<div class="room_heading_inner">
							<span>문의 : 010-1234-5678</span> <span>위치 : 리조트 지하 1층</span> <span>운영시간
								: 10:00-22:00</span>
							<h3>엔터테인먼트 존</h3>
							<a class="card-hover-text">추억을 자극하는 게임기로 모두 함께 즐겨보세요.</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="features_room">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title text-center mb-100">
						<span>내부에 마련된 다양한 편의시설로 안락하고 편안한 시간을 제공합니다.</span>
						<h3>Convenience</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="rooms_here">
			<div class="single_rooms">
				<div class="room_thumb">
					<img src="img/rooms/2.png" alt="">
					<div
						class="room_heading d-flex justify-content-between align-items-center">
						<div class="room_heading_inner">
							<span>문의 : 010-1234-5678</span> <span>위치 : 호텔 1층</span> <span>운영시간
								: 24시간 운영</span>
							<h3>비즈니스센터</h3>
							<a class="card-hover-text">비즈니스 고객분들을 위한 사무 장비가 완벽하게 갖춰진 다기능
								사무공간을 24시간 이용하세요.</a>
						</div>
					</div>
				</div>
			</div>
			<div class="single_rooms">
				<div class="room_thumb">
					<img src="img/rooms/3.png" alt="">
					<div
						class="room_heading d-flex justify-content-between align-items-center">
						<div class="room_heading_inner">
							<span>문의 : 010-1234-5678</span> <span>위치 : 리조트 지하 1층</span> <span>운영시간
								: 24시간운영</span>
							<h3>편의점</h3>
							<a class="card-hover-text">식료품, 생활용품 등 여행에 필요한 다양한 제품을 판매합니다.</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<footer class="footer">
		<div class="footer_top">
			<div class="container">
				<div class="row">
					<div class="col-xl-3 col-md-6 col-lg-3">
						<div class="footer_widget">
							<h3 class="footer_title">address</h3>
							<p class="footer_text">
								Joongang Daero 403, Yedam <br> Joong Gu, Daegu City, Korea
							</p>
							<a href="#" class="line-button">Get Direction</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copy-right_text">
			<div class="container">
				<div class="footer_border"></div>
				<div class="row">
					<div class="col-xl-8 col-md-7 col-lg-9">
						<p class="copy_right">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
					<div class="col-xl-4 col-md-5 col-lg-3">
						<div class="socail_links">
							<ul>
								<li><a href="#"> <i class="fa fa-facebook-square"></i>
								</a></li>
								<li><a href="#"> <i class="fa fa-twitter"></i>
								</a></li>
								<li><a href="#"> <i class="fa fa-instagram"></i>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- form itself end-->
	<form id="test-form" class="white-popup-block mfp-hide">
		<div class="popup_box ">
			<div class="popup_inner">
				<h3>예약하기</h3>
				<form action="#">
					<div class="row">
						<div class="col-xl-6">
							<input id="datepicker" placeholder="체크인">
						</div>
						<div class="col-xl-6">
							<input id="datepicker2" placeholder="체크아웃">
						</div>
						<div class="col-xl-12">
							<select class="form-select wide" id="default-select" class="">
								<option data-display="인원">1</option>
								<option value="1">2</option>
								<option value="2">3</option>
								<option value="3">4</option>
								<option value="4">5</option>
							</select>
						</div>
						<div class="col-xl-12">
							<select class="form-select wide" id="default-select" class="">
								<option data-display="룸 선택">룸 선택</option>
								<option value="1">Laxaries Rooms</option>
								<option value="2">Deluxe Room</option>
								<option value="3">Signature Room</option>
								<option value="4">Couple Room</option>
							</select>
						</div>
						<div class="col-xl-12">
							<button type="submit" class="boxed-btn3">예약하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</form>
	<!-- form itself end -->


	<!-- JS here -->
	<script src="js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/ajax-form.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/imagesloaded.pkgd.min.js"></script>
	<script src="js/scrollIt.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/nice-select.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/gijgo.min.js"></script>

	<!--contact js-->
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>

	<script src="js/main.js"></script>
	<script>
		$('#datepicker').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}
		});
		$('#datepicker2').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}

		});
	</script>



</body>

</html>