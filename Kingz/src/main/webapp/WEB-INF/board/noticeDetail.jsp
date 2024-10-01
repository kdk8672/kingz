<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/board/noticeDetail.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="bradcam_area breadcam_bg_1">
		<h3>공지사항</h3>
	</div>
	<!-- about_area_start -->
	<div class="about_area">
		<div class="container">
			<div class="notice-header">
				<h1 class="notice-title">${board.boardTitle}</h1>
				<p class="notice-date">
					<fmt:formatDate value="${board.boardDate }" pattern="yyyy.MM.dd" />
				</p>
			</div>

			<div class="notice-body">
				<p>${fn:replace(board.boardContent, replaceChar, "<br/>")}</p>
			</div>

			<div class="notice-footer">
				<c:if test="${logGrade eq '관리자'}">
					<a href="removeBoard.do?boardId=${board.boardId}" id="delNotice">삭제</a>
				</c:if>
				<a href="boardNotice.do?boardType=NOTICE" class="back-link">목록으로 돌아가기</a>
			</div>

		</div>
	</div>
	<!-- about_area_end -->
	<script src="js/board/board.js"></script>
</body>
</html>