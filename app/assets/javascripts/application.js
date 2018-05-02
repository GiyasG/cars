// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require tinymce
//= require_tree .

$(function() {
    $("select#date_year").on("change", function() {
        $.ajax({
            url:  "search_make",
            type: "GET",
            data: { selected_year: $("select#date_year").val() }
        });
        $("div#makeit").html("<%= escape_javascript(render partial: 'cars/search_make', locals: { makes: @makes } ) %>");
    });
});
