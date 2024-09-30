/**
 * 
 */
document.querySelectorAll('.delReview').forEach(button => {
	button.addEventListener('click', function(e) {
		let parentElement = e.target.closest('.d-flex');
		let rid = parentElement.dataset.rid;

		Swal.fire({
			title: "리뷰 삭제",
			text: "리뷰를 삭제하시겠습니까?",
			icon: "warning",
			showCancelButton: true,
			confirmButtonColor: "#3085d6",
			cancelButtonColor: "#d33",
			confirmButtonText: "삭제",
			cancelButtonText: "취소",
		}).then((result) => {
			if (result.isConfirmed) {
				fetch("removeReview.do?reviewId=" + rid)
					.then(resolve => resolve.json())
					.then(result => {
						if (result.result == 'OK') {
							Swal.fire({
								title: "리뷰 삭제",
								text: "리뷰가 삭제되었습니다.",
								icon: "success",
								confirmButtonText: "확인"
							});
							parentElement.parentElement.remove();
						} else {
							alert('삭제 처리 중 예외발생');
						}
					})
					.catch(err => console.log(err));
			}
		});
	});
});