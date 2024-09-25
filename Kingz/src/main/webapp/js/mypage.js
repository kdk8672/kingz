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