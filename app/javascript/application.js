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