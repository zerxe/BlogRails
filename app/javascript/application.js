// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
//= require tinymce/tinymce.min
document.addEventListener("turbo:before-render", function() {
    tinymce.remove();
});

document.addEventListener("turbo:render", function() {
    tinymce.init({
        height: 500,
        menubar: false,
        selector: 'textarea.tinymce',
        promotion: true,
        toolbar: 'undo redo | blocks | image | bold italic | alignleft aligncenter alignright | bullist numlist outdent indent | removeformat | help',
        plugins: 'insertdatetime lists media table code help wordcount image',
        image_advtab: true,
        automatic_uploads: true,
        images_upload_url: '/blog_posts/upload_image',
    });
});
