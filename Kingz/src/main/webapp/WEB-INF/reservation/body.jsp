<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- [박진석 | 24.09.24] JQuery 및 결제 관련 js import 후 결제 API 작성 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="js/reservation/billing.js"></script>
<!-- [박진석 | 24.09.24] 결제 API 관련 import 끝 -->


<style type="text/css">
	.pjs-search-layout {
		margin: 3rem;
		margin-left: 100px;
	}
	
	.pjs-search-layout {
		margin: 3rem;
		margin-right: 100px;
	}
	
	.pjs-rooms-form input {
		border: 0;
		outline: none;
	}
	
	

	
	
/* 	.accordion-trigger {
	  width: 100%;
	  padding: 0.5rem;
	  text-align: left;
	  background-color: #f3f4f6;
	  border: none;
	  cursor: pointer;
	}
	
	.accordion-content {
	  padding: 1rem;
	  display: none;
	} */
	
	
</style>
</head>
<body>



	<div class="bradcam_area breadcam_bg_2">
		<h3>Reservation</h3>
	</div>
	<div class="section-top-border">
		<div class="row">
			<!-- -------------------------------------- -->
			<!-- [24.09.27 | 박진석] 왼쪽 레이아웃 영역 -->
			<div class="col-lg-3 col-md-4 mt-sm-30 pjs-search-layout">
				<h3 class="mb-30">객실 검색</h3>
				<form action="reserv.do" name="searchForm" onsubmit="return checkSearchValues()">		<!-- 검색 전 유효성 검사 -->
					<div class="input-group-icon mt-10">
						<div class="form-select">
							<select name="roomType" id="roomType">
								<c:forEach var="rtl" items="${roomTypelist}">
									<option value="${rtl.roomType }">${rtl.roomType }</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<!-- [박진석 | 24.09.24] 날짜 선택 폼 -->
						<input name="inDate" id="datepicker" placeholder="Check in date">
						<input name="outDate" id="datepicker2" placeholder="Check out date">
					<!-- [박진석 | 24.09.24] 날짜 선택 폼 끝 -->

					<div>
						인원: <input name="inHeadcount" id="headcountPicker" type="number"
							value="1">
					</div><br>
					<button
						class="genric-btn info radius"
						type="submit">객실 검색</button>
				</form>
			</div>
			<!-- [24.09.27 | 박진석] 왼쪽 레이아웃 영역 끝 -->
			<!-- ----------------------------------------- -->




			<!-- ------------------------------------------- -->
			<!-- [24.09.27 | 박진석] 오른쪽 레이아웃 영역 끝 -->
			<div class="col-lg-8 col-md-8 pjs-rooms-layout">
			
			
				<form name="reserveForm" action="addReserv.do" method="post">
				   <input type="hidden" name="roomName" value="">
				   <input type="hidden" name="roomId" value="">
				   <input type="hidden" name="checkin" value="">
				   <input type="hidden" name="checkout" value="">
				   <input type="hidden" name="headcount" value="">
				   <input type="hidden" name="paymentMethod" value="">
				   <input type="hidden" name="memberid" value="">
				   <input type="hidden" name="roomPrice" value="">
				   <input type="hidden" name="breakfast" value="">
				   <input type="hidden" name="usepoint" value="">
				   <textarea hidden="hidden" name="request" value=""></textarea>
				   <input type="hidden" name="roomPrice2" value="">
				   <input type="hidden" name="sleepDay" value="">
				   <input type="hidden" name="breakfastPrice" value="">
				   <input type="hidden" name="pointPrice" value="">
				   <input type="hidden" name="totalPrice" value="">
				   
				</form>
				
				
				<c:forEach var="rl" items="${roomList}">
				<!-- [24.09.27 | 박진석] 객실 하나 묶음 영역 -->
				<div class="mb-4 border rounded-lg p-4 flex justify-between">
				<%-- <form action="addReserv.do" method="post" class="pjs-rooms-form-${rl.roomId }"> --%>
				<form action="#" class="pjs-rooms-form-${rl.roomId }">
                    <div class="flex">
                    	<div>
	                        <img src="img/rooms/${rl.imageUrl }" alt="Room" class="w-24 h-24 object-cover rounded mr-4" style="width: 200px; float: left;"/>
                    	</div>
                        <div style="width: 300px; float: left;">
                            <input name="roomName" id="roomName-${rl.roomId }" value="${rl.roomName }" style='font-size:25px;' readonly><br>
                            <input name="roomId" id="roomId" value="${rl.roomId }" hidden="hedden">
                            <p>옵션: 조식 포함</p>
                            <input name="checkin" id="checkin" class="checkin" hidden="hidden">
                   			<input name="checkout" id="checkout" class="checkout" hidden="hidden">
                   			<input name="headcount" id="headcount" class="headcount" hidden="hidden">
                   			<input name="paymentMethod" id="paymentMethod" hidden="hidden">
                   			<input name="memberid" id="memberid" value="${id }" hidden="hidden">
                        </div>
                    </div>
                    
                    
                    <div class="text-right">
                        <p>1박 1객실</p>
                        <input name="roomPrice" id="roomPrice-${rl.roomId }" value="${rl.roomPrice }" style='font-size:20px; text-align:right;' readonly>원
                    </div>
                    
                    <!-- 상세정보 폼 묶음(콜랩스) 시작 -->
                    
                    <p>
					  <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample-${rl.roomId }" 
					  		role="button" aria-expanded="false" aria-controls="collapseExample" onclick="setReservInfo(${rl.roomId })" 
					  		style="float: right;">
					    예약하기
					  </a>
					</p>
					<div class="collapse" id="collapseExample-${rl.roomId }">

					  <div class="card card-body">
					    <div class="pjs-first-col-detail" style="display: inline-block;">
            				<h3>옵션사항</h3><br>
            				조식여부: <input name="breakfast" id="breakfast-${rl.roomId }" type="checkbox" onclick="breakfastCheck(event, ${rl.roomId })"><br>
            				포인트 사용: <input name="usePoint" id="usePoint-${rl.roomId }" type="checkbox" onclick="pointCheck(event, ${rl.roomId })"><br>
            				추가 요청사항:<br>
            				<textarea name="request" id="request-${rl.roomId }"></textarea>
           				</div>
           				<div class="pjs-second-col-detail" style="display: inline-block;">
           					<h3>가격</h3><br>
           					객실금액<input name="roomPrice2" id="roomPrice2-${rl.roomId }" value="200000" style="text-align:right;" readonly>원<br>
           					<input name="sleepDay" id="sleepDay-${rl.roomId }" value="1" style="text-align:right;"></input>박<br>
           					<h3>옵션</h3><br>
           					조식 <input name="breakfastPrice" id="breakfastPrice-${rl.roomId }" value="0" style="text-align:right;" readonly>원<br>
           					포인트 <input name="pointPrice" id="pointPrice-${rl.roomId }" value="0" style="text-align:right;" readonly>원<br>
           					<h2>총 예약금액</h2><input name="totalPrice" id="totalPrice-${rl.roomId }" value="123000" style="text-align:right;" readonly>원
           					<a class="genric-btn info circle" onclick='KGpay(${rl.roomId})'>결제하기</a>
           					<input type="button" id="reservSubmit" value="예약확정" hidden="hiddnen" onclick="reserveFormSubmit(${rl.roomId })">
           				</div>
					  </div>
					</div>
                    <!-- 상세정보 폼 묶음 끝 -->
                    </form>
                </div>
                <!-- [24.09.27 | 박진석] 객실 묶음 영역 끝 -->
				</c:forEach>
			</div>
			<!-- [24.09.27 | 박진석] 오른쪽 레이아웃 영역 끝 -->
			<!-- ------------------------------------------- -->
		</div>
	</div>
	<!-- <script>
	  function reserveFormSubmit(roomId) {
		  let val = document.querySelector('#roomName-' + roomId).value;
		  
		  document.reserveForm.roomName.value = val;
		  document.reserveForm.room????.value = val;
		  document.reserveForm.submit();
		  
	  }
	
	</script> -->
</body>
</html>