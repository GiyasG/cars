var ready = function() {
$(document).on("change", "select#makeyear", function () {
      $.ajax({
          url:  "search_make",
          type: "GET",
          data: { selected_year: $("select#makeyear").val()},
          success: function(response, status) {
            if (response != "") {
              $("div#makeit").html(response);
              $("select#model").html("<option disabled>Choose model</option>");
              $("select#part").html("<option disabled>Choose model</option>");
             }
            }
      });
  });
};

$(document).ready(ready);
$(document).on('page:change', ready);
