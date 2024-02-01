// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const toggleColor = (target) => {
  if (target.style.color |="red") {
  target.style.color = "red"
  } else {
  target.style.color = "blue"
  }
  }
#chucnangtimkiembaihoc(khonghoatdong)
<script>
const searchInput = document.getElementById('searchInput');
const searchIcon = document.querySelector('.fa-search');

searchIcon.addEventListener('click', function() {
  searchInput.focus();
});

searchInput.addEventListener('input', function() {
  const searchValue = this.value.toLowerCase();
  const tableRows = document.querySelectorAll('#lessonTable tbody tr');

  tableRows.forEach(row => {
    const lessonName = row.querySelector('td:first-child').textContent.toLowerCase();
    const lessonDescription = row.querySelector('td:nth-child(2)').textContent.toLowerCase();

    if (lessonName.includes(searchValue) || lessonDescription.includes(searchValue)) {
      row.style.display = '';
    } else {
      row.style.display = 'none';
    }
  });
});
</script>
