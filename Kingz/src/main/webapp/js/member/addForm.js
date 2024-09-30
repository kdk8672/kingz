
// Form validation
const form = document.getElementById('membershipForm');
const passwordInput = document.getElementById('password');
const passwordConfirmInput = document.getElementById('passwordConfirm');
const passwordError = document.getElementById('passwordError');
const phoneInput = document.getElementById('phone');
const phoneError = document.getElementById('phoneError');
let isIdChecked = false;
let isValid = true;

function validatePhone(phone) {
	const phoneRegex = /^010-\d{4}-\d{4}$/;
	return phoneRegex.test(phone);
}


form.addEventListener('submit', function(e) {
	e.preventDefault();

	if (passwordInput.value !== passwordConfirmInput.value) {
		passwordError.classList.remove('mf-hidden');
		isValid = false;

	} else {
		passwordError.classList.add('mf-hidden');
		isValid = true;
	}

	if (!validatePhone(phoneInput.value)) {
		phoneError.classList.remove('mf-hidden');
		isValid = false;
	} else {
		phoneError.classList.add('mf-hidden');
	}

	if (!isIdChecked) {
		swal('중복확인 버튼을 클릭해주세요.');
		isValid = false;
	}

	if (isValid) {
		swal({
			title: "회원가입을 축하합니다.",
			text: "킹즈호텔과 함께해주셔서 감사합니다.",
			icon: "success",
			dangerMode: true,
		})
			.then((willDelete) => {
				if (willDelete) {
					 form.submit();
				}
			});

	}

});

function checkId(e) {
	e.preventDefault();
	const userId = document.getElementById('id').value;

	fetch('checkId.do?id=' + userId)
		.then(resolve => resolve.json())
		.then(result => {
			console.log(result);
			if (result.retCode == 'OK') {
				document.querySelector('#idCheckResult').innerHTML = '<font color=red>중복된 ID 입니다.</font>'
				isIdChecked = true;

			} else {
				document.querySelector('#idCheckResult').innerHTML = '<font color=green>사용가능한 ID 입니다.</font>'
				isIdChecked = true;
				isValid = true;
			}
		})
		.catch(console.log)
}