<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.mf-container {
	font-family: Arial, sans-serif;
	background-color: #e6f7ff;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
	padding: 1rem;
}

.mf-form-container {
	background-color: white;
	padding: 2rem;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 400px;
}

.mf-title {
	margin-top: 0;
	font-size: 1.5rem;
	font-weight: bold;
}

.mf-description {
	font-size: 0.875rem;
	color: #666;
	margin-bottom: 1.5rem;
}

.mf-form-group {
	margin-bottom: 1rem;
}

.mf-label {
	display: block;
	margin-bottom: 0.5rem;
	font-weight: bold;
}

.mf-input, .mf-select {
	width: 100%;
	padding: 0.5rem;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.mf-button-group {
	display: flex;
	gap: 1rem;
}

.mf-button {
	flex: 1;
	padding: 0.5rem;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
}

.mf-button-primary {
	background-color: #0099ff;
	color: white;
}

.mf-button-secondary {
	background-color: #f0f0f0;
	color: #333;
}

.mf-error {
	color: red;
	font-size: 0.75rem;
	margin-top: 0.25rem;
}

.mf-hidden {
	display: none;
}

.mf-email-group {
	display: flex;
	gap: 0.5rem;
	align-items: center;
}

.mf-email-group .mf-input, .mf-email-group .mf-select {
	flex: 1;
}
</style>
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
							<button type="button" onclick="checkId(event)" style="margin: 1px">중복확인</button>
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