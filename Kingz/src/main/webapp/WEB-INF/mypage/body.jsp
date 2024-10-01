<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<link rel="stylesheet" href="css/mypage.css">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kingz - My Page</title>
</head>
<div class="bradcam_area breadcam_bg_2"></div>
<body>
    <div class="container">
        <div class="welcome-section">
            <div>
                <h3 class="text-sm text-gray-500">일반회원</h3>
                <h2 class="text-2xl font-bold">${logName } 님 환영합니다!</h2>
                <h3>나의 포인트 : ${myPoint }점</h3>
            </div>
        </div>
        
        <div id="tabs-container">
            <div class="tabs-list">
                <button class="tab-trigger active" data-tab="reservations">예약확인</button>
                <button class="tab-trigger" data-tab="inquiries">나의 리뷰 내역</button>
                <button class="tab-trigger" data-tab="member-info">나의 정보관리</button>
            </div>
            <div id="tab-content"></div>
        </div>
        
    </div>
    
    <template id="reservations-content">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">예약 내역</h3>
            </div>
            <div class="card-content">
                <div class="mb-4 text-sm">
                    <p>- 예약번호를 클릭하시면 상세한 정보를 확인하실 수 있습니다.</p>
                    <p>- 예약내역은 홈페이지에서 예약한 내역만 표시됩니다.</p>
                </div>
                <c:forEach var="reserve" items="${reserve }">
	                <div class="mb-4 border rounded-lg p-4 flex justify-between">
	                
	                    <div class="flex">
	                        <p class="w-24 h-24 object-cover rounded mr-4"><img src="img/rooms/${reserve.imageUrl }" style="width:30%; height:30%"></p>
	                        <div>
	                            <h3 style="font-weight:bold">${reserve.roomType }</h3>
	                            <p>${reserve.roomName }</p>
	                            <c:choose>
	                            	<c:when test="${reserve.breakfast eq 1 }">
			                            <p style="font-weight:bolder">조식 포함</p>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<p style="font-weight:bolder">조식 불포함</p>
	                            	</c:otherwise>
	                            </c:choose>
	                            <p style="font-weight:bolder">인원수: ${reserve.headCount }명</p>
	                        </div>
	                    </div>
	                    <div class="text-right">
	                        <p style="font-weight:bolder">숙박 일수: ${reserve.night }박 ${reserve.night + 1 }일</p>
	                        <c:choose>
		                        <c:when test="${reserve.breakfast eq 1 }">
				               		<p  style="font-weight:bold">총 결제금액: ${reserve.roomPrice + (reserve.headCount * 10000) - reserve.paymentPoint }원</p>
			                    </c:when>
			                    <c:otherwise>
			                   		<p  style="font-weight:bold">총 결제금액: ${reserve.roomPrice + reserve.paymentPoint }원</p>
			                    </c:otherwise>
	                        </c:choose>
	                        <div class="accordion">
	                            <button class="accordion-trigger">상세 내역</button>
	                            <div class="accordion-content">
	                                <p>체크인: ${reserve.checkIn }</p>
	                                <p>체크아웃: ${reserve.checkOut }</p>
	                                <p>인원: ${reserve.headCount }명</p>
	                                <p>------------------------------------</p>
	                                <p>객실금액: ${reserve.roomPrice }원</p>
	                                <c:choose>
	                                	<c:when test="${reserve.breakfast eq 1 }">
			                            	<p>조식: ${reserve.headCount * 10000 }원</p>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<p>조식: 0원<p>
		                            	</c:otherwise>
	                                </c:choose>
	                                <c:choose>
	                                	<c:when test="${reserve.paymentPoint eq 0 }">
			                                <p>포인트: 0점</p>
	                                	</c:when>
	                                	<c:otherwise>
	                                		<p>포인트: ${reserve.paymentPoint }점</p>
	                                	</c:otherwise>
	                                </c:choose>
	                                <p>------------------------------------</p>
	                                <c:choose>
	                                	<c:when test="${reserve.breakfast eq 1 }">
			                            	<p  style="font-weight:bold">실제 결제금액: ${reserve.roomPrice + (reserve.headCount * 10000) - reserve.paymentPoint }원</p>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<p  style="font-weight:bold">실제 결제금액: ${reserve.roomPrice + reserve.paymentPoint }원</p>
		                            	</c:otherwise>
	                                </c:choose>
	                                <button onclick="location.href='reserveDelete.do?reserveId=${reserve.reserveId}&memberId=${reserve.memberId }'">예약 취소</button>
	                            </div>
	                        </div>
	                    </div>
                	</div>
            	</c:forEach>
            </div>
        </div>
    </template>

    <template id="inquiries-content">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">나의 리뷰 내역</h3>
            </div>
            <div class="card-content">
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 125px">평점</th>
                            <th></th>
                            <th style="width: 350px">내용</th>
                            <th style="width: 220px">Check In/Out</th>
                            <th style="width: 180px">작성일</th>
                        </tr>
                    </thead>
                    <c:forEach var="review" items="${review }">
	                    <tbody>
	                        <tr>
	                            <td>
	                            	<div class="star-rating"
			                            style="display: inline-block; margin-right: 2.5px">
			                            <c:forEach var="i" begin="1" end="5">
			                                <c:if test="${i <= review.rating}">
			                                    <span class="star filled">&#9733;</span>
			                                    <!-- Filled star -->
			                                </c:if>
			                                <c:if test="${i > review.rating}">
			                                    <c:if test="${review.rating >= (i - 0.5)}">
			                                        <span class="star half-filled">&#9734;</span>
			                                        <!-- Half-filled star -->
			                                    </c:if>
			                                    <c:if test="${review.rating < (i - 0.5)}">
			                                        <span class="star">&#9734;</span>
			                                        <!-- Empty star -->
			                                    </c:if>
			                                </c:if>
			                            </c:forEach>
                   				     </div>
	                            </td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${empty review.imageUrl }">
	                            			<p></p>
	                            		</c:when>
	                            		<c:otherwise>
			                            	<img src="img/review/${review.imageUrl }" style="width:50%; height:50%">
	                            		</c:otherwise>
	                            	</c:choose>
	                            </td>
	                            <td>${review.reviewContent }</td>
	                            <td>${review.checkIn } ~ ${review.checkOut }</td>
	                            <td>${review.reviewDate }</td>
	                        </tr>
	                    </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
    </template>
    <template id="member-info-content">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">나의 정보관리</h3>
            </div>
            <div class="card-content">
                <form class="space-y-4" action="modifymypage.do" method="POST">
                <input type="hidden" value="${id }" name="memberId">
                    <div class="form-group">
                        <label class="form-label" for="id">아이디</label>
                        <p>${id }</p>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="password">비밀번호</label>
                        <input id="password" name="pass" class="form-input" type="password" />
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="name">이름</label>
                        <p>${logName }</p>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="email">이메일</label>
                        <input id="email" name="email" class="form-input" type="email"/>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="phone">전화번호</label>
                        <input id="phone" name="phone" class="form-input" />
                    </div>
                    <button type="submit" class="button">정보 수정</button>
                </form>
            </div>
        </div>
    </template>
    <script src="js/mypage.js"></script>
</body>
</html>
