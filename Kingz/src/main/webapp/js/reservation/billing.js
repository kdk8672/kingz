console.log("[reserv.jsp] 화면 도착");

function KGpay() {
	
	// 필요한 경우, 여기에 null값 판단, 비회원 검증 등을 if로 구현할 것.
	
	var IMP = window.IMP; // 생략 가능
	let key = "imp24027004";
	//console.log(key);
	
	/*
	IMP.init(key);	// 판매자 코드
	
	IMP.request_pay({
	    pg : 'html5_inicis.INIpayTest',
	    pay_method : 'card',
	    merchant_uid: "order_no_0010"	, // TODO [박진석 | 24.09.24] 상점에서 관리하는 주문 번호: 적절하게 값을 바꾸는 로직이 필요!!
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
            
            const successHtp = new XMLHttpRequest();			
            successHtp.open('get', 'reservComplete.do');
            successHtp.send();
            
            
			
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	
	    	jQuery.ajax({
	    		//url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	    		url: "/reservComplete.do",
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid,
		    		total_paid : rsp.paid_amount	// [박진석 | 24.09.24] 총 결제금액 값 전달
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		}
	    	}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			
	    			alert(msg);
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});
	    	
	    	console.log(rsp);
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '\n에러내용 : ' + rsp.error_msg;
	        alert(msg);
	        
	        console.log(rsp);
	    }
	});
	
	*/
    
    
    //let href = "/Kingz/reservComplete.do";
    /*
    const successHtp = new XMLHttpRequest();			
    successHtp.open('get', 'reservComplete.do');
    */
   	let imp_uid = "A001";
   	let total_paid = 500;
   
    fetch('reservComplete.do', {													// GET 방식이 아닌 POST 방식으로 통신하려고 할 때는 
		 method: 'post',													// fetch의 두번째 매개변수로 객체를 건네야 함.
		 headers: {'Content-Type': 'application/x-www-form-urlencoded'},	// 객체의 세부 내용은 왼쪽과 동일하게 입력하면 되며
		 body: 'imp_uid=' + imp_uid + '&total_paid=' + total_paid		// POST는 전달할 값을 URL이 아닌 body에 담아 전송하므로
		 																	// 'body'의 value 값으로 해당 내용을 집어넣으면 됨.
	 })		/// 주소표시줄 addReply.do?bno=148&reply=...&replyer=user01
	 .then(resolve => resolve.json)
	 .then(result => {
		 console.log("=============[addReply.do] fetch의 result ===========");
		 console.log(result);		// result의 형태를 반드시 확인하는것이 좋음!
	 })
}
