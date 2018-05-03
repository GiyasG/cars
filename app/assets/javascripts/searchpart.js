var ready = function() {
  $(document).on("change", "select#model", function () {
    // $("select#date_year").on("change", function() {
        $.ajax({
            url:  "search_part",
            type: "GET",
            data: { selected_part: $("select#model").val()},
            success: function(response, status) {
              if (response != "") {
                $("div#partit").html(response); }
              }
        });
    });
};

$(document).ready(ready);
$(document).on('page:change', ready);
