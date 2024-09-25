<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="bradcam_area breadcam_bg_1">
	<h3>회원 정보</h3>
</div>
<div id="users">
	<c:forEach var="user" items="${users}">
		<div class="progress-table">
			<div class="table-head">
				<div class="serial">#</div>
				<div class="country">아이디</div>
				<div class="visit">비밀번호</div>
				<div class="percentage">이메일</div>
				
			</div>
			<div class="table-row">
				<div class="serial">01</div>
				<div class="country">
					<img src="img/elements/f1.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-1" role="progressbar"
							style="width: 80%" aria-valuenow="80" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="table-row">
				<div class="serial">02</div>
				<div class="country">
					<img src="img/elements/f2.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-2" role="progressbar"
							style="width: 30%" aria-valuenow="30" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="table-row">
				<div class="serial">03</div>
				<div class="country">
					<img src="img/elements/f3.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-3" role="progressbar"
							style="width: 55%" aria-valuenow="55" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="table-row">
				<div class="serial">04</div>
				<div class="country">
					<img src="img/elements/f4.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-4" role="progressbar"
							style="width: 60%" aria-valuenow="60" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="table-row">
				<div class="serial">05</div>
				<div class="country">
					<img src="img/elements/f5.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-5" role="progressbar"
							style="width: 40%" aria-valuenow="40" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="table-row">
				<div class="serial">06</div>
				<div class="country">
					<img src="img/elements/f6.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-6" role="progressbar"
							style="width: 70%" aria-valuenow="70" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="table-row">
				<div class="serial">07</div>
				<div class="country">
					<img src="img/elements/f7.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-7" role="progressbar"
							style="width: 30%" aria-valuenow="30" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="table-row">
				<div class="serial">08</div>
				<div class="country">
					<img src="img/elements/f8.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-8" role="progressbar"
							style="width: 60%" aria-valuenow="60" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

