console.log("[reserv.jsp] 화면 도착");

function KGpay() {
	
	// 필요한 경우, 여기에 null값 판단, 비회원 검증 등을 if로 구현할 것.
	
	var IMP = window.IMP; // 생략 가능
	let key = "imp24027004";
	IMP.init(key);
	
	IMP.request_pay({
	    pg : 'html5_inicis.INIpayTest',
	    pay_method : 'card',
	    merchant_uid: "order_no_0015"	, // TODO [박진석 | 24.09.24] 상점에서 관리하는 주문 번호: 적절하게 값을 바꾸는 로직이 필요!!
	    name : '주문명:결제테스트',
	    amount : 100,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    if ( rsp.success ) {
			console.log(rsp);
            let msg = '결제가 완료되었습니다.';
            alert(msg);
            
            document.getElementById('reservSubmit').click();
            
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '\n에러내용 : ' + rsp.error_msg;
	        alert(msg);
	        
	        console.log(rsp);
	    }
	});
}


function setReservInfo() {
	let checkinDate = (document.querySelector("#datepicker").value).replace(/\//g, "-");;		// 왼쪽 레이아웃에서 체크인과 체크아웃 값을 Date 형식으로 가져오기
	let checkoutDate = (document.querySelector("#datepicker2").value).replace(/\//g, "-");;		// (2024/01/01 -> 2024-01-01)
	let headcountValue = document.querySelector("#headcountPicker").value;						// 왼쪽 레이아웃에서 인원 수를 가져오기
	
	let inDate = new Date(checkinDate);
	let outDate = new Date(checkoutDate);
	let sleepDate = (outDate - inDate)/(1000 * 60 * 60 * 24);	// 체크인, 체크아웃 날짜를 사용하여 n박을 계산
	
	console.log("========== [billing.js] setReservInfo() ==========");
	console.log("checkinDate: " + checkinDate + " | checkoutDate: " + checkoutDate + " | headcountValue: " + headcountValue);
	console.log("inDate: " + inDate + " | outDate: " + outDate + " | n박: " + sleepDate);
	
	if (checkinDate == "" || checkinDate == null || checkoutDate == "" || checkoutDate == null) {
		alert("체크인 또는 체크아웃 날짜가 잘못되었습니다.")
	}
	
	if (sleepDate < 1) {
		alert("체크인 날짜가 체크아웃 날짜보다 늦습니다.")
	}
	
	let roomPrice = document.querySelector("#roomPrice").value
	let totalPrice = roomPrice * sleepDate;
	
	
	document.querySelector("#checkin").value = checkinDate;
	document.querySelector("#checkout").value = checkoutDate;
	document.querySelector("#headcount").value = headcountValue;
	document.querySelector("#totalPrice").value = totalPrice
	
	// TODO n박, 최종 비용도 계산하기!	
}
