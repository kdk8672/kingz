<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 
<!-- 결제 정보 입력 시 최소한 아래와 같은 정보가 필요함. -->
<!-- <form name="pgForm">
	<input type="hidden" name="Amt" value="1000">
	<input type="hidden" name="BuyerName" value="홍길동">
	<input type="hidden" name="OrderName" value="결제테스트">
</form> -->




<!-- [박진석 | 24.09.24] JQuery 및 결제 관련 js import 후 결제 API 작성 -->
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="js/reservation/billing.js"></script>
<!-- [박진석 | 24.09.24] 결제 API 끝 -->

<div class="body-main-container">
	 <section class="blog_area section-padding">
        <div class="container">
            <div class="row">
                <!-- [박진석 | 24.09.24] 왼쪽 검색 레이아웃 -->
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="reservSearch.do">
                                <div class="form-group">
                                	<!-- [박진석 | 24.09.24] 호텔 방 셀렉트 폼 -->
	                                <div class="input-group-icon mt-10">
										<div class="icon"><i class="fa fa-plane" aria-hidden="true"></i></div>
										<div class="form-select" id="default-select"">
													<select>
														<option value=" 1">City</option>
											<option value="1">Dhaka</option>
											<option value="1">Dilli</option>
											<option value="1">Newyork</option>
											<option value="1">Islamabad</option>
											<!-- room 테이블에서 room_type와 room_id 값 가져와 위 option 값에 뿌리기 -->
											</select>
										</div>
									</div>
									<!-- [박진석 | 24.09.24] 방 셀렉트 폼 끝 -->
									
                                	<!-- [박진석 | 24.09.24] 날짜 선택 폼 -->
                                	<div class="col-xl-6">
                                        <input id="datepicker" placeholder="Check in date">
                                    </div>
                                    <div class="col-xl-6">
                                        <input id="datepicker2" placeholder="Check out date">
                                    </div>
                                	<!-- [박진석 | 24.09.24] 날짜 선택 폼 끝 -->
                                	<div>
                                		인원: <input id="headcountPicker" type="number" value=1>
                                	</div>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit" hidden>객실 검색</button>
                            </form>
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Category</h4>
                            <ul class="list cat-list">
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Resaurant food</p>
                                        <p>(37)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Travel news</p>
                                        <p>(10)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Modern technology</p>
                                        <p>(03)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Product</p>
                                        <p>(11)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Inspiration</p>
                                        <p>21</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Health Care (21)</p>
                                        <p>09</p>
                                    </a>
                                </li>
                            </ul>
                        </aside>

                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">Recent Post</h3>
                            <div class="media post_item">
                                <img src="img/post/post_1.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>From life was you fish...</h3>
                                    </a>
                                    <p>January 12, 2019</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="img/post/post_2.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>The Amazing Hubble</h3>
                                    </a>
                                    <p>02 Hours ago</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="img/post/post_3.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>Astronomy Or Astrology</h3>
                                    </a>
                                    <p>03 Hours ago</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="img/post/post_4.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>Asteroids telescope</h3>
                                    </a>
                                    <p>01 Hours ago</p>
                                </div>
                            </div>
                        </aside>
                    </div>
                </div>
                <!-- [박진석 | 24.09.24] 왼쪽 검색 레이아웃 끝 -->
                
                
                
                <!-- [박진석 | 24.09.24] 오른쪽 메인 레이아웃 -->
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                    
                    
                     <!-- --------------------------- -->
                    <!-- 하나의 객실 보여주는 폼 묶음 -->
                    	<article class="room-item" style="background-color: lightgrey;" style="width: 90%; margin: 10px auto;">
                    		<form action="addReserv.do" method="post">
                    			<div class="first-col">
                    				<img class="card-img rounded-0" src="img/blog/single_blog_1.png" alt="" style="width: 200px">
                    			</div>
                    			<div class="second-col">
	                    			<input name="roomName" id="roomName" value="슈페리어 방1"> <br>
	                    			조식 선택 가능
	                    			<!-- 사용자에게 보여주지 않고 내부 쿼리 처리를 위한 input -->
	                    			<input name="roomId" id="roomId" value="10">
	                    			<input name="checkin" id="checkin" value="24-01-01">
	                    			<input name="checkout" id="checkout" value="24-01-01">
	                    			<input name="headcount" id="headcount" value="2">
	                    			<input name="memberid" id="memberid" value="giacopo0">
	                    			<!-- 내부 쿼리 처리를 위한 hidden input 끝 -->
                    			</div>
                    			<div class="third-col">
                    				<small>1박 1객실</small><br>
                    				<input name="roomPrice" value="200000">원 ~<br>
                    			</div>
                    			<a class="genric-btn info circle" onclick="setReservInfo()">예약하기</a>
                    			
                    			
                    			<!-- 상세정보 폼 묶음 시작 -->
                    			<div class=" room-detail">
                    				<div class="first-col-detail">
	                    				<h3>옵션사항</h3><br>
	                    				조식여부: <input name="breakfast" type="checkbox"><br>
	                    				포인트 사용: <input name="usePoint" type="checkbox"><br>
	                    				추가 요청사항:<br>
	                    				<textarea name="request"></textarea>
                    				</div>
                    				<div class="second-col-detail">
                    					<h3>가격</h3><br>
                    					객실금액<input name="roomPrice" id="roomPrice" value="200000">원 ~<br>
                    					<div name="sleepDay" id="sleepDay" value="0"></div>박기준<br>
                    					<h4>옵션</h4><br>
                    					조식 <input name="breakfastPrice" id="breakfastPrice" value="0">원<br>
                    					포인트 <input name="pointPrice" id="pointPrice" value="0">원<br>
                    					<h2>총 예약금액</h2><input name="totalPrice" id="totalPrice" value="450000">원
                    					<a class="genric-btn info circle" onclick='KGpay("giacopo0")'>결제하기</a>
                    					<input type="submit" id="reservSubmit" value="예약확정" hidden="hidden">
                    				</div>
                    			</div>
                    			<!-- 상세정보 폼 묶음 끝 -->
                    			
                    		</form>
                        </article>
                    <!-- 하나의 객실 폼 묶음 끝 -->
                    <!-- ----------------------- -->
                    
                    
                    
                    
                    <!-- 
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="img/blog/single_blog_1.png" alt="">
                                <a href="#" class="blog_item_date">
                                    <h3>15</h3>
                                    <p>Jan</p>
                                </a>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="single-blog.html">
                                    <h2>Google inks pact for new 35-storey office</h2>
                                </a>
                                <p>That dominion stars lights dominion divide years for fourth have don't stars is that
                                    he earth it first without heaven in place seed it second morning saying.</p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="fa fa-user"></i> Travel, Lifestyle</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>
                                </ul>
                                
                            </div>
                        </article>

                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="img/blog/single_blog_2.png" alt="">
                                <a href="#" class="blog_item_date">
                                    <h3>15</h3>
                                    <p>Jan</p>
                                </a>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="single-blog.html">
                                    <h2>Google inks pact for new 35-storey office</h2>
                                </a>
                                <p>That dominion stars lights dominion divide years for fourth have don't stars is that
                                    he earth it first without heaven in place seed it second morning saying.</p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="fa fa-user"></i> Travel, Lifestyle</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>
                                </ul>
                            </div>
                        </article>

                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="img/blog/single_blog_3.png" alt="">
                                <a href="#" class="blog_item_date">
                                    <h3>15</h3>
                                    <p>Jan</p>
                                </a>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="single-blog.html">
                                    <h2>Google inks pact for new 35-storey office</h2>
                                </a>
                                <p>That dominion stars lights dominion divide years for fourth have don't stars is that
                                    he earth it first without heaven in place seed it second morning saying.</p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="fa fa-user"></i> Travel, Lifestyle</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>
                                </ul>
                            </div>
                        </article>

                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="img/blog/single_blog_4.png" alt="">
                                <a href="#" class="blog_item_date">
                                    <h3>15</h3>
                                    <p>Jan</p>
                                </a>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="single-blog.html">
                                    <h2>Google inks pact for new 35-storey office</h2>
                                </a>
                                <p>That dominion stars lights dominion divide years for fourth have don't stars is that
                                    he earth it first without heaven in place seed it second morning saying.</p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="fa fa-user"></i> Travel, Lifestyle</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>
                                </ul>
                            </div>
                        </article>

                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="img/blog/single_blog_5.png" alt="">
                                <a href="#" class="blog_item_date">
                                    <h3>15</h3>
                                    <p>Jan</p>
                                </a>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="single-blog.html">
                                    <h2>Google inks pact for new 35-storey office</h2>
                                </a>
                                <p>That dominion stars lights dominion divide years for fourth have don't stars is that
                                    he earth it first without heaven in place seed it second morning saying.</p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="fa fa-user"></i> Travel, Lifestyle</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>
                                </ul>
                            </div>
                        </article>
						-->
						
						
						
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">1</a>
                                </li>
                                <li class="page-item active">
                                    <a href="#" class="page-link">2</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- [박진석 | 24.09.24] 오른쪽 메인 레이아웃 끝 -->
                
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>