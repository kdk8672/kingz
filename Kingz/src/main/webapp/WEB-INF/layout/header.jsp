<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid p-0">
                    <div class="row align-items-center no-gutters">
                        <div class="col-xl-5 col-lg-6">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                    	<li><a class="active" href="#">HOME</a></li>
                                      	<li><a href="#">호텔<i class="ti-angle-down"></i></a>
	                                        		<ul class="submenu">
	                                                	<li><a href="#">호텔1</a></li>
	                                            	</ul>
                                      	</li>
                                        <li><a href="#">리조트<i class="ti-angle-down"></i></a></li>
                                        <li><a href="#">시설</a></li>  
                                        <li><a href="about.html">오시는길</a></li>
                                        <li><a href="blog.html">등급소개</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-2">
                            <div class="logo-img">
                                <a href="main.do">
                                    <img src="img/kingz_logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-5 col-lg-4 d-none d-lg-block">
                            
                            <div class="book_room">
                                
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a href="login.do">로그인</a></li>
                                            <li><a href="memberAddForm.do">회원가입</a></li>
                                            <li><a href="mypage.do?memberId=${id }">마이페이지</a></li>
                                            <li><a href="#">고객센터<i class="ti-angle-down"></i></a>
                                        	<ul class="submenu">
                                                <li><a href="#">FAQ</a></li>
												<li><a href="#">공지사항</a></li>
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