// Form validation
const form = document.getElementById('membershipForm');
const idInput = document.getElementById('id'); // ID 입력 필드 참조 추가
const passwordInput = document.getElementById('password');
const passwordConfirmInput = document.getElementById('passwordConfirm');
const passwordError = document.getElementById('passwordError');
const phoneInput = document.getElementById('phone');
const phoneError = document.getElementById('phoneError');
let isIdChecked = false; // 중복 확인 상태를 추적
let lastCheckedId = ''; // 마지막으로 확인된 ID

function validatePhone(phone) {
    const phoneRegex = /^010-\d{4}-\d{4}$/;
    return phoneRegex.test(phone);
}

// ID 입력 필드 변경 시 중복 확인 여부 초기화
idInput.addEventListener('input', function() {
    isIdChecked = false; // ID가 변경되면 중복 확인 상태를 무효화
    document.querySelector('#idCheckResult').innerHTML = ''; // 중복 확인 결과 초기화
});

form.addEventListener('submit', function(e) {
    e.preventDefault();
    let isValid = true; // 폼 제출 시마다 초기화

    // 비밀번호와 비밀번호 확인 일치 여부 확인
    if (passwordInput.value !== passwordConfirmInput.value) {
        passwordError.classList.remove('mf-hidden');
        isValid = false;
    } else {
        passwordError.classList.add('mf-hidden');
    }

    // 전화번호 형식 확인
    if (!validatePhone(phoneInput.value)) {
        phoneError.classList.remove('mf-hidden');
        isValid = false;
    } else {
        phoneError.classList.add('mf-hidden');
    }

    // 중복 확인 여부와 마지막 확인된 ID가 현재 ID와 같은지 확인
    if (!isIdChecked || lastCheckedId !== idInput.value) {
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
    const userId = idInput.value;

    // ID 중복 확인을 서버로 요청
    fetch('checkId.do?id=' + userId)
    .then(resolve => resolve.json())
    .then(result => {
        console.log(result);
        if (result.retCode === 'OK') {
            document.querySelector('#idCheckResult').innerHTML = '<font color=red>중복된 ID 입니다.</font>';
            isIdChecked = false; // 중복된 ID일 때 false로 설정
        } else {
            document.querySelector('#idCheckResult').innerHTML = '<font color=green>사용가능한 ID 입니다.</font>';
            isIdChecked = true; // 사용 가능한 ID일 때만 true로 설정
            lastCheckedId = userId; // 마지막으로 확인된 ID 저장
        }
    })
    .catch(console.log);
}
