<%@page import="com.yedam.mypage.vo.MypageVO"%>
<%@page import="java.util.List"%>
<%@page import="com.yedam.mypage.service.MypageService"%>
<%@page import="com.yedam.mypage.service.MypageServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
    
<%
List<MypageVO> list = (List<MypageVO>) request.getAttribute("MypageList");
%>
<!DOCTYPE HTML>
<div class="bradcam_area breadcam_bg_2"></div>
<h3>내 정보</h3>
<table class="mypage">
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>등급</th>
		</tr>
	</thead>
	<tbody>
		<%
		for (MypageVO mypage : list) {
		%>
		<tr>
			<td><%=mypage.getId()%></td>
			<td><%=mypage.getName()%></td>
			<td><%=mypage.getEmail()%></td>
			<td><%=mypage.getPhone()%></td>
			<td><%=mypage.getGrade()%></td>
		</tr>
		<%
		}
		%>
	</tbody>
</table>