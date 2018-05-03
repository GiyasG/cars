var ready = function() {
  $(document).on("change", "select#make", function () {
    // $("select#date_year").on("change", function() {
        $.ajax({
            url:  "search_model",
            type: "GET",
            data: { selected_model: $("select#make").val()},
            success: function(response, status) {
              if (response != "") {
                $("div#modelit").html(response); }
              }
        });
    });
};

$(document).ready(ready);
$(document).on('page:change', ready);
