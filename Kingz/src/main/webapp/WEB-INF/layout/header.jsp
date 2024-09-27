<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<% String currentPage  = request.getRequestURI();  %>
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
                                        
                                        	<c:choose>
                                        		<c:when test="${empty id }">
                                        			<li><a href="login.do">로그인</a></li>
		                                            <li><a href="memberAddForm.do">회원가입</a></li>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<li><a href="#">로그아웃</a></li>
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