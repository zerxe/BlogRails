// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
//= require tinymce/tinymce.min
document.addEventListener("DOMContentLoaded", function() {
    tinymce.init({
        selector: 'textarea.tinymce',
        promotion: false
    });
});


