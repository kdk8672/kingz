<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/member/addForm.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="bradcam_area breadcam_bg_1">
		<h3>Sign up</h3>

	</div>
	<!-- offers_area_start -->
	<div class="offers_area padding_top">
		<div class="container">
			<div class="row">
				<div class="col-xl-12"></div>
			</div>
			<div class="mf-container">
				<div class="mf-form-container">
					<h1 class="mf-title">회원가입</h1>

					<form action="addMember.do" id="membershipForm" class="mf-form"
						method="POST">
						<div class="mf-form-group">
							<label for="id" class="mf-label">아이디</label> <input type="text"
								name="id" id="id" class="mf-input" placeholder="아이디 입력" required>
							<button type="button" onclick="checkId(event)"
								style="margin: 1px">중복확인</button>
							<p id="idCheckResult"></p>
						</div>

						<div class="mf-form-group">
							<label for="password" class="mf-label">비밀번호</label> <input
								type="password" name="password" id="password" class="mf-input"
								placeholder="비밀번호 입력" required>
						</div>

						<div class="mf-form-group">
							<label for="passwordConfirm" class="mf-label">비밀번호 확인</label> <input
								type="password" id="passwordConfirm" name="passwordConfirm"
								class="mf-input" placeholder="비밀번호 재입력" required>
							<p class="mf-error mf-hidden" id="passwordError">비밀번호가 일치하지
								않습니다</p>
						</div>

						<div class="mf-form-group">
							<label for="name" class="mf-label">이름</label> <input type="text"
								name="name" id="name" class="mf-input" placeholder="이름을 입력해주세요"
								required>
						</div>

						<div class="mf-form-group">
							<label for="phone" class="mf-label">전화번호</label> <input
								type="tel" name="phone" id="phone" class="mf-input"
								placeholder="휴대폰 번호 입력 (예: 010-1234-5678)" required>
							<p class="mf-error mf-hidden" id="phoneError">올바른 전화번호 형식이
								아닙니다</p>
						</div>

						<div class="mf-form-group">
							<label for="email" class="mf-label">이메일 주소</label>
							<div class="mf-email-group">
								<input type="text" name="email" id="email" class="mf-input"
									placeholder="이메일 주소" required> <span>@</span> <select
									id="emailDomain" name="emailDomain" class="mf-select" required>
									<option value="@naver.com">naver.com</option>
									<option value="@gmail.com">gmail.com</option>
									<option value="@daum.net">daum.net</option>
								</select>
							</div>
						</div>

						<div class="mf-button-group">
							<input type="submit" class="mf-button mf-button-primary">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- offers_area_end -->
	<script src="js/member/addForm.js"></script>
</body>
</html>