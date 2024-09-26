package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.admin.control.AdminBalanceControl;
import com.yedam.admin.control.AdminBalanceListControl;
import com.yedam.admin.control.AdminBalanceYearControl;
import com.yedam.admin.control.AdminGradeListControl;
import com.yedam.admin.control.AdminRoomReserveListControl;
import com.yedam.admin.control.AdminUserDeleteControl;
import com.yedam.admin.control.AdminUserListControl;
import com.yedam.contact.ContactControl;
import com.yedam.example.control.TestControl;
import com.yedam.facilities.FacilitiesControl;
import com.yedam.hotel.HotelListControl;
import com.yedam.hotel.RoomDetailControl;
import com.yedam.member.control.AddMemberControl;
import com.yedam.member.control.CheckIdControl;
import com.yedam.member.control.LoginControl;
import com.yedam.member.control.LoginFormControl;
import com.yedam.member.control.MemberAddFormControl;
import com.yedam.mypage.control.ModifyFormControl;
import com.yedam.mypage.control.ModifyMypageControl;
import com.yedam.mypage.control.MyReservationControl;
import com.yedam.mypage.control.MyReviewInfoControl;
import com.yedam.mypage.control.MypageControl;
import com.yedam.reservation.control.AddReservControl;
import com.yedam.reservation.control.ReservCompleteControl;
import com.yedam.reservation.control.ReservControl;
import com.yedam.review.AddReviewControl;

//@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	Map<String, Control> map;
	
	public FrontController() {
		System.out.println("FrontController 생성자");
		map = new HashMap<>();
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// control 추가
		// [조민성] 부대시설 페이지
		map.put("/facilities.do", new FacilitiesControl());
		
		// [조민성] 호텔리스트 페이지
		map.put("/hotelList.do", new HotelListControl());
		
		// [조민성] 호텔 상세페이지
		map.put("/roomDetail.do", new RoomDetailControl());
		
		// [조민성] 리뷰 등록 기능
		map.put("/addReview.do", new AddReviewControl());
		
		// [조민성] 오시는 길 페이지
		map.put("/contact.do", new ContactControl());

		map.put("/main.do", new TestControl());
		
		// [승원] 마이페이지(첫화면 예약내용) 연결
		map.put("/mypage.do", new MypageControl());
		
		// [승원] 내 정보 수정 연결
		map.put("/modifymypage.do", new ModifyMypageControl());
		map.put("/modifyform.do", new ModifyFormControl());
		
		// [승원] 예약내용 연결
		map.put("/myreservation.do", new MyReservationControl());
		
		// [승원] 리뷰내역 연결
		map.put("/reviewinfo.do", new MyReviewInfoControl());
		
		// [권혁태] 회원가입
		map.put("/memberAddForm.do", new MemberAddFormControl()); // 회원가입 창 열기
		map.put("/addMember.do", new AddMemberControl()); // 회원가입 기능 
		map.put("/checkId.do", new CheckIdControl()); // 아이디 중복 값 확인
		map.put("/LoginForm.do", new LoginFormControl()); // 로그인 창 열기
		map.put("/login.do", new LoginControl()); // 로그인 기능
		
		// [박진석] 예약 관련 URI 매핑
		map.put("/reserv.do", new ReservControl());
		map.put("/addReserv.do", new AddReservControl());
		map.put("/reservComplete.do", new ReservCompleteControl());

		// [김건휘] 관리자 기능 관련
		map.put("/userList.do", new AdminUserListControl()); // 회원 관리 페이지 이동
		map.put("/deleteUser.do", new AdminUserDeleteControl()); // 회원 탈퇴
		map.put("/balance.do", new AdminBalanceControl()); // 매출 페이지 이동
		map.put("/balanceList.do", new AdminBalanceListControl()); // 매출액 조회
		map.put("/balanceYear.do", new AdminBalanceYearControl()); // 매출이 있는 년도
		map.put("/gradeList.do", new AdminGradeListControl()); // 등급별 인원 조회
		map.put("/roomReserveList.do", new AdminRoomReserveListControl()); // 방별 예약수 조회

	}

		
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 요청방식이 POST 일 경우에 body 포함된 문자열 인코딩
		
		String uri = req.getRequestURI();
		String context = req.getContextPath(); 
		String page = uri.substring(context.length());
		System.out.println(page);
		
		Control control = map.get(page);
		control.exec(req, resp);
	}
	
}
