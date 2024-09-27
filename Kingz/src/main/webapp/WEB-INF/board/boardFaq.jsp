<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/board/board.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="bradcam_area breadcam_bg_1">
		<h3>FAQ</h3>
	</div>
	<!-- about_area_start -->
	<div class="about_area">
		<div class="container">
			<div class="faq_area section_padding_130" id="faq">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-12 col-sm-8 col-lg-6">
							<!-- Section Heading-->
							<div class="section_heading text-center wow fadeInUp"
								data-wow-delay="0.2s"
								style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
								<h3>
									<span>FAQ </span>
								</h3>
								<p>호텔 및 리조트 이용에 대한 궁금증을 해결해 드립니다.</p>
								<div class="line"></div>
							</div>
						</div>
					</div>
						<div class="row justify-content-center">
							<!-- FAQ Area-->
							<div class="col-12 col-sm-10 col-lg-8">
							<c:forEach var="board" items="${list }">
								<div class="accordion faq-accordian" id="faqAccordion">
									<div class="card border-0 wow fadeInUp" data-wow-delay="0.2s"
										style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
										<div class="card-header" id="headingOne">
											<h6 class="mb-0 collapsed" data-toggle="collapse"
												data-target="#${board.boardId}" aria-expanded="true"
												aria-controls="${board.boardId }">
												Q.${board.boardTitle }<span class="lni-chevron-up"></span>
											</h6>
										</div>
										<div class="collapse" id="${board.boardId }"
											aria-labelledby="headingOne" data-parent="#faqAccordion">
											<div class="card-body">
												<p>A.${board.boardContent }</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<!-- Support Button-->
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
	<!-- about_area_end -->
	<script src="js/board/board.js"></script>
</body>
</html>