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