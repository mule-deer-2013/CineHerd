$(document).ready(function(){
  $("#login_form").bind('ajax:success', function(e, data, xhr, settings){
    $('#nav_div').html(data)
  }).bind('ajax:error', function(e, data){
    $('#errors').html(JSON.parse(data.responseText))
    $('.alert').delay(3000).fadeOut('slow')
  })

  $("#nav_div").bind('ajax:success', '#sign_out_button', function(e, data) {
    $('#nav_div').html(data)
  })
})

