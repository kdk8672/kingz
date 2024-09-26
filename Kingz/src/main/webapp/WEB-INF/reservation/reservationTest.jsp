<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>



<style>
    /* 메인 컨테이너: 전체 페이지를 감싸는 요소 */
    .main-container {
        display: flex;
        margin-top: 200px;
        width: 100%;
        height: 100vh; /* 세로로 전체 화면 채우기 */
    }

    /* 왼쪽 nav 레이아웃 */
    nav {
        width: 30%;
        background-color: #fff;
        padding: 20px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 카드 느낌의 그림자 */
        border-radius: 8px; /* 모서리 둥글게 */
        margin-left: 20px; /* 왼쪽에서 살짝 떨어짐 */
        height: auto; /* 높이 자동 조절 */
    }

    /* 카드 내부의 항목들 */
    nav h2 {
        font-size: 1.5rem;
        margin-bottom: 20px;
    }

    /* 오른쪽 section 레이아웃 */
    section {
        width: 70%;
        padding: 20px;
        overflow-y: auto; /* 스크롤 생기게 */
    }

    /* 수평 정렬된 room-item */
    .room-item {
        display: flex;
        background-color: lightgrey;
        width: 90%;
        margin: 10px auto;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 카드 느낌의 그림자 */
    }

    /* 각 요소의 수평 정렬 */
    .first-col, .second-col, .third-col {
        margin-right: 20px;
    }

    .room-detail {
        display: flex;
        flex-wrap: wrap;
        margin-top: 20px;
    }

    .first-col-detail, .second-col-detail {
        margin-right: 20px;
        flex: 1;
    }
</style>
</head>
<body>

<!-- 메인 컨테이너 -->
<div class="main-container">
z
<!-- 왼쪽 네비게이션 (객실 검색용) -->
<nav>
    <h2>객실 검색</h2>
    <form method="get" action="reserv.do?checkin=20240101&checkout=20240115&headcount=2">
        <div class="mb-3">
            <label for="checkIn" class="form-label">체크인 날짜</label>
            <input type="date" class="form-control" id="checkIn">
        </div>
        <div class="mb-3">
            <label for="checkOut" class="form-label">체크아웃 날짜</label>
            <input type="date" class="form-control" id="checkOut">
        </div>
        <div class="mb-3">
            <label for="guestCount" class="form-label">인원 수</label>
            <input type="number" class="form-control" id="guestCount" value="1" min="1">
        </div>
        <button type="submit" class="btn btn-primary">검색</button>
    </form>
</nav>

<!-- 오른쪽 섹션 -->
<section>
    <!-- 하나의 객실 보여주는 폼 묶음 -->
    <article class="room-item">
        <form action=".addReserv.do" method="post">
            <div class="first-col">
                <img class="card-img rounded-0" src="img/blog/single_blog_1.png" alt="" style="width: 200px">
            </div>
            <div class="second-col">
                <input value="슈페리어 방1"> <br>
                조식: <input value="5000">
            </div>
            <div class="third-col">
                <small>1박 1객실</small><br>
                <input value="200000">원 ~<br>
            </div>

            <!-- 예약하기 버튼 -->
            <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#roomDetail" aria-expanded="false" aria-controls="roomDetail">
                예약하기
            </button>

            <!-- 아코디언 형식으로 펼쳐지는 상세정보 -->
            <div id="roomDetail" class="collapse room-detail">
                <div class="first-col-detail">
                    <h3>옵션사항</h3><br>
                    조식여부: <input value="false"><br>
                    추가 요청사항:<br>
                    <textarea></textarea>
                </div>
                <div class="second-col-detail">
                    <h3>가격</h3><br>
                    <input value="400000">원 ~<br>
                    <input value="2">박<br>
                    <h4>옵션</h4><br>
                    조식 <input value="50000">원<br>
                    <h2>총 예약금액</h2><input value="450000">원
                </div>
            </div>
        </form>
    </article>
    <!-- 하나의 객실 폼 묶음 끝 -->
</section>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>


<!-- [박진석 | 24.09.25] 레이아웃 테스트 중...-->
<!---------------------------------------------->
