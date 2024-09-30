<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
	.single-textarea {
		height: 500px;
	}
	.col-lg-12.col-md-12{
		padding-left: 10%;
		padding-right: 10%;
	}
</style>
<div class="bradcam_area breadcam_bg_2">
	<h3>공지사항 작성</h3>
</div>
<div class="section-top-border text-center">
	<div class="col-lg-12 col-md-12">
		<h3 class="mb-30">공지사항 작성</h3>
		<form action="addBoard.do" method="post">
			<div class="mt-10">
				<input type="text" name="title" placeholder="제목"
					onfocus="this.placeholder = ''" onblur="this.placeholder = '제목'"
					required class="single-input">
			</div>
			<div class="mt-10">
				<textarea class="single-textarea" name="content" placeholder="내용" 
					onfocus="this.placeholder = ''" onblur="this.placeholder = '내용'"
					required></textarea>
			</div>
			<div class="section-top-border text-center">
				<button type="submit" class="genric-btn success radius">등록</button>
			</div>
		</form>
	</div>
</div>