<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/board/notice.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="bradcam_area breadcam_bg_2">
		<h3>공지사항</h3>
	</div>
	<!-- about_area_start -->
	<div class="about_area">
		<div class="container">
			<c:if test="${logGrade eq '관리자'}">
				<a href="addBoardForm.do" id="addNotice">공지사항 등록</a>
			</c:if>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${list }">
						<tr>
							<td class="number">${board.boardId }</td>
							<td>
								<span class="category">
									<c:choose>
										<c:when test="${board.boardType eq 'NOTICE'}">
											공지사항
										</c:when>
										<c:otherwise>
											${board.boardType }
										</c:otherwise>
									</c:choose>
								</span>
							</td>
							<td class="title"><a href="getNotice.do?id=${board.boardId}">${board.boardTitle }</a></td>
							<td class="date"><fmt:formatDate value="${board.boardDate }"
									pattern="yyyy.MM.dd" />
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- about_area_end -->
	<script src="js/board/board.js"></script>
</body>
</html>