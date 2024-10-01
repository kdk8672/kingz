console.log("[reserv.jsp] 화면 도착");



window.onload = function() {
	setSearchParams();
}




// 조식, 포인트 사용할 때 마다 최종 금액 계산해주는 함수
function calTotal() {
	console.log("calTotal - 값 바뀜!");

	let roomPrice = document.querySelector("#roomPrice2").value;
	let sleepDate = document.querySelector("#sleepDay").value;
	let breakfast = document.querySelector("#breakfastPrice").value;
	let point = document.querySelector("#pointPrice").value;
	let result = ((Number(roomPrice) * Number(sleepDate)) + Number(breakfast) - Number(point));

	console.log("roomPrice: " + roomPrice + " | sleepDate: " + sleepDate + " | breakfast: " + breakfast);
	console.log("point: " + point + " | result: " + result);

	document.querySelector("#totalPrice").value = result;

	console.log("calTotal - 바뀐 값 적용됨!")
}




// URL에 파라미터 담겨져올 때 왼쪽 레이아웃과 form에 값 유지시키는 함수
function setSearchParams() {
	let searchParams = new URLSearchParams(location.search);

	let roomType = searchParams.get('roomType');
	let inDate = searchParams.get('inDate'); // 09/30/2024
	let outDate = searchParams.get('outDate');
	let inHeadcount = searchParams.get('inHeadcount');


	console.log("roomType: " + roomType + " | inDate: " + inDate + " | outDate: " + outDate + " | inHeadcount: " + inHeadcount);

	if (roomType != null || roomType != "") {
		document.querySelector("#roomType").value = roomType;
	}

	if (inDate != null || inDate != "") {
		console.log(convertDate(inDate))
		document.querySelector("#datepicker").value = convertDate(inDate);
		document.querySelector("#checkin").value = convertDate(inDate);
	}

	if (outDate != null || outDate != "") {
		document.querySelector("#datepicker2").value = convertDate(outDate);
		document.querySelector("#checkout").value = convertDate(outDate);
	}

	if (inHeadcount != null || inHeadcount != "") {
		document.querySelector("#headcountPicker").value = inHeadcount;
		document.querySelector("#headcount").value = inHeadcount;
	}
}




// 조식 체크박스 눌렀을 때 조식 input에 값 적용
function breakfastCheck(event) {
	let headcount = document.querySelector("#headcount").value;
	let result = 0;

	if (event.target.checked) {
		result = 10000;
	} else {
		result = 0;
	}

	console.log("[breakfastCheck()] headcount: " + headcount + " | result: " + result);

	document.querySelector("#breakfastPrice").value = result * headcount;

	calTotal();
}

function pointCheck(event) {
	let point = 0;
	let memberId = document.querySelector("#memberid").value;
	console.log("포인트 사용하려는 member: " + memberId);

	if (event.target.checked) {

		if (memberId == null | memberId == "") {
			alert("로그인 후 포인트 사용을 할 수 있습니다.");
			return false;
		} else {
			fetch('getPointOneMember.do?memberId=' + memberId)
				.then(resolve => resolve.json())
				.then(result => {
					if (result.point == '' || result.point == null || result.point == 0) {
						alert("적용할 포인트가 없습니다.")
					} else {
						console.log("포인트 가져오기 성공: ");
						point = result.point;	// 쿼리 결과로 나온 1개 값을 point로 지정
						document.querySelector("#pointPrice").value = point;
						calTotal();
					}
				})
				.catch(console.log)
		}

	} else {
		point = 0;
	}


	console.log("[pointCheck()] point: " + point)
	document.querySelector("#pointPrice").value = point;

	calTotal();
}

function KGpay() {

	memId = document.querySelector("#memberid").value

	if (memId == "" || memId == null) {
		alert("회원만 예약을 진행할 수 있습니다.");
		return false;
	} else {

		//-------------------------------------------------
		// [박진석 | 240925] 아이디와 현재 날짜와 시간을 결합하여 고유 결제번호("abc123_240925_2150")를 만듦
		const now = new Date();

		const year = String(now.getFullYear()).slice(2);
		const month = String(now.getMonth() + 1).padStart(2, '0');
		const day = String(now.getDate()).padStart(2, '0');

		const hours = String(now.getHours()).padStart(2, '0');
		const minutes = String(now.getMinutes()).padStart(2, '0');
		const orderId = `${memId}_${year}${month}${day}_${hours}${minutes}`;

		console.log(orderId);
		
		// [박진석 | 240925] 고유 결제번호 만들기 끝
		//---------------------------------------------------

		var IMP = window.IMP; // 생략 가능
		let key = "imp24027004";
		IMP.init(key);

		IMP.request_pay({
			pg: 'html5_inicis.INIpayTest',
			pay_method: 'card',
			merchant_uid: orderId,
			name: document.querySelector("#roomName").value,
			amount: 100,
			//amount: document.querySelector("#totalPrice").value,
			buyer_email: 'iamport@siot.do',
			buyer_name: '구매자이름',
			buyer_tel: '010-1234-5678',
			buyer_addr: '서울특별시 강남구 삼성동',
			buyer_postcode: '123-456'
		}, function(rsp) {
			if (rsp.success) {
				console.log(rsp);
				let msg = '결제가 완료되었습니다.';
				alert(msg);

				let payMethod = rsp.pay_method;
				let totalPaid = rsp.paid_amount;

				//alert("[billing.js] 결제방법: " + payMethod + " | 결제액: " + totalPaid);

				document.querySelector("#paymentMethod").value = payMethod;

				document.getElementById('reservSubmit').click();

			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '\n에러내용 : ' + rsp.error_msg;
				alert(msg);

				console.log(rsp);
			}
		});
		
		
		/*
		document.querySelector("#paymentMethod").value = "card";
		document.getElementById('reservSubmit').click();
		*/
	}
}

function calRoomPrice() {
	let checkin = document.querySelector("#checkin").value;
	let checkout = document.querySelector("#checkout").value;
	let roomPrice = document.querySelector("#roomPrice").value;

	if (checkin.indexOf("undefined")) {
		console.log("UNDEFINED 출현!: " + checkin);
		checkin = checkin.substring(10, 20);
	}

	let inDate = new Date(checkin);
	let outDate = new Date(checkout);
	let sleepDate = (outDate - inDate) / (1000 * 60 * 60 * 24);	// 체크인, 체크아웃 날짜를 사용하여 n박을 계산

	console.log("쳌아웃-쳌인*방값: " + (sleepDate * roomPrice));
}

// "예약하기" 버튼 눌렀을 때 세부 input 값 지정하는 함수
function setReservInfo(roomId) {
	document.querySelector('#collapseExample-'+roomId).classList.add('show')	// 특정 묶음 영역만 Collaspe 하게 만들어줌.
																				// TODO 이걸 응용해서 form 값 넘기는 것도 해보자
	
	let checkinDate = (document.querySelector("#checkin").value).replace(/\//g, "-");		// 왼쪽 레이아웃에서 체크인과 체크아웃 값을 Date 형식으로 가져오기
	let checkoutDate = (document.querySelector("#checkout").value).replace(/\//g, "-");		// (2024/01/01 -> 2024-01-01)
	let headcountValue = document.querySelector("#headcount").value;						// 왼쪽 레이아웃에서 인원 수를 가져오기

	let inDate = new Date(checkinDate);
	let outDate = new Date(checkoutDate);
	let sleepDate = (outDate - inDate) / (1000 * 60 * 60 * 24);	// 체크인, 체크아웃 날짜를 사용하여 n박을 계산

	console.log("========== [billing.js] setReservInfo() ==========");
	console.log("checkinDate: " + checkinDate + " | checkoutDate: " + checkoutDate + " | headcountValue: " + headcountValue);
	console.log("inDate: " + inDate + " | outDate: " + outDate + " | n박: " + sleepDate);

	if (checkinDate == "" || checkinDate == null || checkoutDate == "" || checkoutDate == null) {
		alert("예약하기 전, '객실 검색'을 먼저 진행해주세요.")
		return false;
	}

	if (sleepDate < 1) {
		alert("체크인 날짜가 체크아웃 날짜보다 늦습니다.")
		return false;
	}

	let roomPrice = document.querySelector("#roomPrice").value
	let totalPrice = roomPrice * sleepDate;
	console.log("totalPrice: " + totalPrice);

	document.querySelector("#roomPrice2").value = roomPrice;
	document.querySelector("#sleepDay").value = sleepDate;
	document.querySelector("#checkin").value = checkinDate;
	document.querySelector("#checkout").value = checkoutDate;
	document.querySelector("#headcount").value = headcountValue;
	document.querySelector("#totalPrice").value = totalPrice

	console.log("==================================================");

}


function checkSearchValues() {
	let inDate = searchForm.inDate.value;
	let outDate = searchForm.outDate.value;

	let date1 = new Date(inDate);
	let date2 = new Date(outDate);

	if (inDate == "" || inDate == null || outDate == "" || outDate == null) {
		alert("체크인 또는 체크아웃 날짜가 잘못되었습니다.")
		return false;
	} else if (date2 - date1 <= 0) {
		alert("체크인 날짜가 체크아웃 날짜보다 큽니다.");
		return false;
	} else {
		return true;
	}
}

// 날짜 형식을 변환(09/25/2024 -> 24-09-25)
function convertDate(inputDate) {
	const dateParts = inputDate.split('/');

	const year = dateParts[2];
	const month = dateParts[0];
	const day = dateParts[1];

	return `${year}-${month}-${day}`;
}
