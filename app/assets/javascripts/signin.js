$(document).ready(function(){
  $("#login_form").on('ajax:success', function(e, data, xhr, settings){
    $('#nav_div').html(data)
  }).on('ajax:error', function(e, data){
    $('#errors').html(JSON.parse(data.responseText))
    $('.alert').delay(3000).fadeOut('slow')
  })
})
