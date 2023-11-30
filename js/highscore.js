//Kurs Select
document.addEventListener('DOMContentLoaded', function () {
    var dropdown = document.getElementById('kursSelect');

    dropdown.addEventListener('click', function (event) {
      if (event.target.classList.contains('dropdown-item')) {
        var selectedKurs = event.target.innerText.trim();
        window.location.href = '/highscore?selectedKurs=' + encodeURIComponent(selectedKurs);
      }
    });
  });


  
document.addEventListener('DOMContentLoaded', function () {
  const content = document.querySelector('.content'); // Get the table
  const itemsPerPage = 10;
  let currentPage = 0;
  const items = Array.from(content.getElementsByTagName('tr')).slice(1); // Get all rows in the table

  function showPage(page) {
      const startIndex = page * itemsPerPage;
      const endIndex = startIndex + itemsPerPage;
      items.forEach((item, index) => {
          item.toggleAttribute('hidden', index < startIndex || index >= endIndex);
      });
      updateButtonStates();
  }




  function createPageButtons() {
      const totalPages = Math.ceil(items.length / itemsPerPage);

      // Add Pagination div
      const paginationDiv = document.createElement('div');   
      paginationDiv.classList.add('pagination-buttons');
      document.getElementById('container').appendChild(paginationDiv);
      
      // Add "Previous" button
      const prevButton = document.createElement('button');
      prevButton.classList.add('btn');
      prevButton.textContent = '<';
      prevButton.addEventListener('click', () => {
          if (currentPage > 0) {
              currentPage--;
              showPage(currentPage);
          }
      });
      paginationDiv.appendChild(prevButton);

      // Add "Next" button
      const nextButton = document.createElement('button');
      nextButton.classList.add('btn');
      nextButton.textContent = '>';
      nextButton.addEventListener('click', () => {
          if (currentPage < totalPages - 1) {
              currentPage++;
              showPage(currentPage);
          }
      });
      paginationDiv.appendChild(nextButton);
      
      updateButtonStates(); // Set initial button states
  }

  function updateButtonStates() {
      const totalPages = Math.ceil(items.length / itemsPerPage);
      const prevButton = document.querySelector('.pagination-buttons button:first-child');
      const nextButton = document.querySelector('.pagination-buttons button:last-child');

      prevButton.disabled = currentPage === 0;
      nextButton.disabled = currentPage === totalPages - 1;
  }

  createPageButtons(); // Call this function to create the Next and Previous buttons initially
  showPage(currentPage);
});
