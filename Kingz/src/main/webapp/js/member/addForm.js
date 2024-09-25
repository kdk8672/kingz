
// Form validation
const form = document.getElementById('membershipForm');
const passwordInput = document.getElementById('password');
const passwordConfirmInput = document.getElementById('passwordConfirm');
const passwordError = document.getElementById('passwordError');
const phoneInput = document.getElementById('phone');
const phoneError = document.getElementById('phoneError');
let isIdChecked = false;

function validatePhone(phone) {
	const phoneRegex = /^010-\d{4}-\d{4}$/;
	return phoneRegex.test(phone);
}

let isValid = true;
form.addEventListener('submit', function(e) {
	e.preventDefault();

	if (passwordInput.value !== passwordConfirmInput.value) {
		passwordError.classList.remove('mf-hidden');
		isValid = false;
	} else {
		passwordError.classList.add('mf-hidden');
	}

	if (!validatePhone(phoneInput.value)) {
		phoneError.classList.remove('mf-hidden');
		isValid = false;
	} else {
		phoneError.classList.add('mf-hidden');
	}

	if (!isIdChecked) {
		alert('아이디 중복 확인을 해주세요.');
		isValid = false;
	}

	if (isValid) {
		alert('회원가입을 진심으로 환영합니다.')
		form.submit();
	} else {
		alert('아아디가 중복 되었습니다.')
	}
});

function checkId(e) {
	e.preventDefault();
	const userId = document.getElementById('id').value;

	fetch('checkId.do?id=' + userId)
		.then(resolve => resolve.json())
		.then(result => {
			console.log(result)
			if (result.retCode == 'OK') {
				document.querySelector('#idCheckResult').innerHTML = '<font color=red>중복된 ID 입니다.</font>'
				isIdChecked = true;
				isValid = false;

			} else {
				document.querySelector('#idCheckResult').innerHTML = '<font color=green>사용가능한 ID 입니다.</font>'
				isIdChecked = true;
				isValid = true;
			}
		})
		.catch(console.log)
}