(function(){
  $(".preview-node").click(function(){
    if ($('.simple_form').attr("class").indexOf("article") != -1) {
      form_data = "content=" + $("#article_content").val();
    } else if ($('.simple_form').attr("class").indexOf("comment") != -1) {
      form_data = "content=" + $("#comment_content").val();
    }

    $.ajax({
      type: 'POST',
      url: "/articles/preview.js",
      dataType: 'html',
      data: form_data,
      success: function(data) {
        $("#edit-form").hide();
        $("#preview-form").show();
        $('#preview-form').html(data);
      },
      error: function(jqXHR, textStatus, errorThrown){
        Blade.ajax_error_alert(jqXHR, textStatus, errorThrown);
      }
    });
    return false;
  })

  $(".edit-node").click(function(){
    $("#edit-form").show();
    $("#preview-form").hide();
    return false;
  });

})()

