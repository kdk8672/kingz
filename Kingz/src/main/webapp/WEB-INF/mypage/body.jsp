<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kingz - My Page</title>
    <link rel="stylesheet" href="css/mypage.css">
</head>
<div class="bradcam_area breadcam_bg_2"></div>
<body>
    <div class="container">
        <div class="welcome-section">
            <div>
                <h3 class="text-sm text-gray-500">일반회원</h3>
                <h2 class="text-2xl font-bold">${logName } 님 환영합니다!</h2>
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
	                            <h3 class="font-bold">${reserve.roomType }</h3>
	                            <p>${reserve.roomName }</p>
	                            <p>옵션: ${reserve.breakfast }</p>
	                            <p>인원수: ${reserve.headCount }명</p>
	                        </div>
	                    </div>
	                    <div class="text-right">
	                        <p>1박 2일</p>
	                        <p class="font-bold">${reserve.paymentAmount }원</p>
	                        <div class="accordion">
	                            <button class="accordion-trigger">상세 내역</button>
	                            <div class="accordion-content">
	                                <p>체크인: ${reserve.checkIn }</p>
	                                <p>체크아웃: ${reserve.checkOut }</p>
	                                <p>인원: ${reserve.headCount }명</p>
	                                <p>객실금액: ${reserve.roomPrice }</p>
	                                <p>조식: ${reserve.headCount } </p>
	                                <p class="font-bold">총 결제금액: ${reserve.paymentAmount }원</p>
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
                <h3 class="card-title">나의 문의 내역</h3>
            </div>
            <div class="card-content">
                <table class="table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성일</th>
                            <th>답변상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>${roomType }</td>
                            <td>2023-09-01</td>
                            <td>답변완료</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>조식 메뉴 문의</td>
                            <td>2023-08-15</td>
                            <td>답변대기</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </template>

    <template id="sns-content">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">SNS 로그인 연동</h3>
            </div>
            <div class="card-content">
                <div class="space-y-4">
                    <div class="flex items-center justify-between">
                        <span>카카오톡</span>
                        <button class="button button-outline">연동하기</button>
                    </div>
                    <div class="flex items-center justify-between">
                        <span>네이버</span>
                        <button class="button button-outline">연동하기</button>
                    </div>
                    <div class="flex items-center justify-between">
                        <span>페이스북</span>
                        <button class="button button-outline">연동하기</button>
                    </div>
                </div>
            </div>
        </div>
    </template>
	    <template id="member-info-content">
	        <div class="card">
	            <div class="card-header">
	                <h3 class="card-title">나의 정보관리</h3>
	            </div>
	            <div class="card-content">
	                <form class="space-y-4" action="modifymypage.do" method="get">
	                	<input type="hidden" name="id" value=${id }>
	                    <div class="form-group">
	                        <label class="form-label" for="id">아이디</label>
	                        <p>${id }</p>
	                    </div>
	                    <div class="form-group">
	                        <label class="form-label" for="password">비밀번호</label>
	                        <input id="password" class="form-input" type="password" name="pass"/>
	                    </div>
	                    <div class="form-group">
	                        <label class="form-label" for="name">이름</label>
	                        <p>${logName }</p>
	                    </div>
	                    <div class="form-group">
	                        <label class="form-label" for="email">이메일</label>
	                        <input id="email" class="form-input" type="email" name="email" />
	                    </div>
	                    <div class="form-group">
	                        <label class="form-label" for="phone">전화번호</label>
	                        <input id="phone" class="form-input" name="phone" />
	                    </div>
	                    <button class="summit" onclick="/mypage.do">저장</button>
	                </form>
	            </div>
	        </div>
	    </template>
    <template id="membership-content">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">유료 멤버십</h3>
            </div>
            <div class="card-content">
                <div class="space-y-4">
                    <p>현재 가입된 유료 멤버십이 없습니다.</p>
                    <div class="grid gap-4">
                        <div class="border p-4 rounded-lg">
                            <h3 class="font-bold mb-2">실버 멤버십</h3>
                            <p>월 10,000원</p>
                            <ul class="list-disc list-inside mt-2">
                                <li>객실 10% 할인</li>
                                <li>조식 무료</li>
                            </ul>
                            <button class="button mt-4">가입하기</button>
                        </div>
                        <div class="border p-4 rounded-lg">
                            <h3 class="font-bold mb-2">골드 멤버십</h3>
                            <p>월 20,000원</p>
                            <ul class="list-disc list-inside mt-2">
                                <li>객실 20% 할인</li>
                                <li>조식 무료</li>
                                <li>스파 이용권 1회</li>
                            </ul>
                            <button class="button mt-4">가입하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </template>

    <script src="js/mypage.js"></script>
</body>
</html>