/*document.addEventListener('DOMContentLoaded', function() {
	const loginForm = document.getElementById('loginForm');
	const errorMessage = document.getElementById('errorMessage');

	loginForm.addEventListener('submit', function(e) {
		e.preventDefault();
		const id = document.getElementById('id').value;
		const password = document.getElementById('password').value;

		if (!id || !password) {
			errorMessage.textContent = '아이디와 비밀번호를 모두 입력해주세요.';
			errorMessage.style.display = 'block';
		} else {
			// Here you would typically send the login request to your server
			console.log('Login attempt with:', { id, password });
			// For demo purposes, we'll just log to console and show a success message
			alert('로그인 시도가 완료되었습니다!');
			loginForm.reset();
			errorMessage.style.display = 'none';
		}
	});
});*/

function check(e) {
	e.preventDefault();
	const id = document.getElementById('id').value;
	const password = document.getElementById('password').value;

	fetch('loginVer.do?id=' + id + "&password=" + password)
		.then(resolve => resolve.json())
		.then(result => {
			if (result.retCode == 'OK') {
				document.querySelector('#CheckResult').innerHTML = '<font color=red>아이디 및 비밀번호를 확인해주세요.</font>'
			} else {
				lgoinform.submit();
			}
		})
		.catch(console.log)
}