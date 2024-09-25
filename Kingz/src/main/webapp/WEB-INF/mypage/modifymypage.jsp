<%@page import="com.yedam.mypage.vo.MypageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="bradcam_area breadcam_bg_2"></div>
<h3>회원수정</h3>

	<form action="modifymypage.do" method="get">
		<table class="table">
			<tr>
				<th>아이디</th>
				<td><p>bannion6</p></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="pass"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><p>Annion</p></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="tel" name="phone"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-primary">저장</button>
					<button class="btn btn-secondary">취소</button>
				</td>
			</tr>
		</table>
	</form>
</html>