$(document).ready(function(){
  $("#new_post_form").on('ajax:success', function(xhr, settings){
    displayLoadingAnimation()
  }).on('ajax:complete', function(e, data, status, xhr){
    // youre doing nothing.
    console.log(data)
  })
})

// you;re poluting the global namespace.
function displayLoadingAnimation() {
  $("#new_post_button").removeClass('btn-primary').addClass('btn-danger')
  $("#new_post_button").val('Uploading Cinemagraph...')
}
