
$(function(){
  $('#comment_link').bind("ajax:success", function(xhr, data){
    $('#comment_form').append(data);
  })

  $(document).on('submit', '#form_comment_partial', function(e){
    e.preventDefault();
    var $data = $(this).serialize

    $.ajax({
      url: $data.action,
      type: $data.method
    }).done(function(data){
      console.log(data.comment)
      $('#list_comment').append('hi')
      $('#list_comment').append(data.comment)
    })
  })
})
