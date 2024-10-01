document.addEventListener('DOMContentLoaded', function() {
  const tabsContainer = document.getElementById('tabs-container');
  let activeTab = 'reservations';

  function switchTab(tabValue) {
    activeTab = tabValue;
    updateTabStyles();
    renderTabContent();
  }

  function updateTabStyles() {
    const buttons = document.querySelectorAll('.tab-trigger');
    buttons.forEach(button => {
      button.classList.toggle('active', button.dataset.tab === activeTab);
    });
  }

  function renderTabContent() {
    const contentContainer = document.getElementById('tab-content');
    contentContainer.innerHTML = document.getElementById(`${activeTab}-content`).innerHTML;
    initializeAccordions();
  }

  function initializeAccordions() {
    document.querySelectorAll('.accordion-trigger').forEach(trigger => {
      trigger.addEventListener('click', function() {
        const content = this.nextElementSibling;
        content.style.display = content.style.display === 'none' ? 'block' : 'none';
      });
    });
  }

  document.querySelectorAll('.tab-trigger').forEach(trigger => {
    trigger.addEventListener('click', () => switchTab(trigger.dataset.tab));
  });

  renderTabContent();
});

const rateWrap = document.querySelectorAll('.rating'),
				label = document.querySelectorAll('.rating .rating__label'),
				input = document.querySelectorAll('.rating .rating__input'),
				labelLength = label.length,
				opacityHover = '0.5';

let stars = document.querySelectorAll('.rating .star-icon');

checkedRate();

rateWrap.forEach(wrap => {
		wrap.addEventListener('mouseenter', () => {
				stars = wrap.querySelectorAll('.star-icon');

				stars.forEach((starIcon, idx) => {
						starIcon.addEventListener('mouseenter', () => {
								initStars(); 
								filledRate(idx, labelLength); 

								for (let i = 0; i < stars.length; i++) {
										if (stars[i].classList.contains('filled')) {
												stars[i].style.opacity = opacityHover;
										}
								}
						});

						starIcon.addEventListener('mouseleave', () => {
								starIcon.style.opacity = '1';
								checkedRate(); 
						});

						wrap.addEventListener('mouseleave', () => {
								starIcon.style.opacity = '1';
						});
				});
		});
});

function filledRate(index, length) {
		if (index <= length) {
				for (let i = 0; i <= index; i++) {
						stars[i].classList.add('filled');
				}
		}
}

function checkedRate() {
		let checkedRadio = document.querySelectorAll('.rating input[type="radio"]:checked');


		initStars();
		checkedRadio.forEach(radio => {
				let previousSiblings = prevAll(radio);

				for (let i = 0; i < previousSiblings.length; i++) {
						previousSiblings[i].querySelector('.star-icon').classList.add('filled');
				}

				radio.nextElementSibling.classList.add('filled');

				function prevAll() {
						let radioSiblings = [],
								prevSibling = radio.parentElement.previousElementSibling;

						while (prevSibling) {
								radioSiblings.push(prevSibling);
								prevSibling = prevSibling.previousElementSibling;
						}
						return radioSiblings;
				}
		});
}

function initStars() {
		for (let i = 0; i < stars.length; i++) {
				stars[i].classList.remove('filled');
		}
}


function validateForm() {
	
	let a = true;
    const password = document.getElementById('password').value;
    const passwordCheck = document.getElementById('passwordCheck').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 간단한 이메일 형식 정규 표현식
    const phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/; // 예: 123-456-7890 형식의 전화번호

    if (!password) {
        alert("비밀번호를 입력하세요");
        a = false;
    }
    else if (password !== passwordCheck) {
        alert("비밀번호가 일치하지 않습니다.");
        a = false;
    }
    else if (email === "") {
        document.getElementById('email').value = null;
    }
    else if (!emailRegex.test(email)) {
        alert("유효한 이메일 주소를 입력하세요 (예: qwer1234@naver.com");
        a = false;
    }
    else if (phone === "") {
        document.getElementById('phone').value = null;
    }
    else if (!phoneRegex.test(phone)) {
        alert("유효한 전화번호 형식을 입력하세요 (예: 010-1234-5678)");
        a = false;
    }
    
    if (a) {
        Swal.fire({
            title: "저장하시겠습니까?",
            text: "입력되지 않은 정보들은 기존 그대로 유지됩니다.",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "저장"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "저장완료",
                    icon: "success"
                }).then(() => {
                    document.querySelector('form').submit();
                });
            }
        });
    }
	return false;

	
}
