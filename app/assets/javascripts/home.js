(function(){
  $(".preview-node").click(function(){
    $.ajax({
      type: 'POST',
      url: "/articles/preview.js",
      dataType: 'html',
      data: "content=" + $("#article_content").val(),
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

