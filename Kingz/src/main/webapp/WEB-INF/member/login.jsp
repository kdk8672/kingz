<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/member/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="bradcam_area breadcam_bg_1">
		<h3>Login</h3>
	</div>
	<!-- offers_area_start -->
	<div class="offers_area padding_top">
		<div class="container">
			<div class="row">
				<div class="col-xl-12"></div>
			</div>
			<div class="mf-container">
				<div class="mf-form-container">
					<div class="lf-container">
						<div class="lf-card">
							<h1 class="lf-card-title">로그인</h1>
							<br>
							<form action="login.do" method="post" class="lf-form" name="lgoinform">
								<div class="lf-form-group">
									<label for="id" class="lf-label">아이디</label> <input type="text"
										id="id" name="id" class="lf-input" placeholder="아이디를 입력하세요"
										required>
								</div>
								<div class="lf-form-group">
									<label for="password" class="lf-label">비밀번호</label> <input
										type="password" id="password" name="password" class="lf-input"
										placeholder="비밀번호를 입력하세요" required>
								<p id="CheckResult"></p>
								</div>
								<input type="submit" class="lf-button" onclick="check(event)" >
							</form>
							<p id="errorMessage" class="lf-error-message"
								style="display: none;"></p>
							<div class="lf-text-center">
								계정이 없으신가요? <a href="/signup" class="lf-link">회원가입</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- offers_area_end -->
	<script src="js/member/login.js"></script>
</body>
</html>