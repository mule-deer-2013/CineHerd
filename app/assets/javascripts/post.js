
var SubmitPost = function() {
}

SubmitPost.prototype.afterSubmit = function() {
  $("#new_post_form").on('ajax:success', function(xhr, settings){
    displayLoadingAnimation()
  }).on('ajax:complete', function(e, data, status, xhr){
    console.log(data)
  })
}

var Arrows = function(images){
  this.arrowImages = images
  this.dissableButton = $('#sign_in')
}

Arrows.prototype.disable = function(){
  if (this.dissableButton.length > 0)
  {
    $.each(this.arrowImages, function(index, value){
      $(value).attr('onClick', 'return false')
    })
  }
}


$(document).ready(function(){
  newPost = new SubmitPost()
  newPost.afterSubmit()

  arrowImages = new Arrows($('i'))
  arrowImages.disable()
})
