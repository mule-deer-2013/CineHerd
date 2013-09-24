// use objects
var Image = {
  animate: function() {
    $(this).addClass('notStill')
    Image.setImageVars()
    Image.displayCinemagraph()
  },

  displayCinemagraph: function() {
    $('.notStill').first().attr("src", this.animated_url)
  },

  hideCinemagraph: function() {
    $(this).removeClass('notStill')
    $('.notStill').first().attr("src", Image.gray_url)
  },

  setImageVars: function() {
    this.gray_url = $('.notStill').first().attr("src")
    this.extension = this.gray_url.substring(this.gray_url.length-4, this.gray_url.length)
    this.animated_url = $('.notStill').first().attr("src").substring(0, this.gray_url.length - 10) + this.extension
  }
}

$(document).ready(function(){
  $(".still_photo").on('mouseover', Image.animate);
  $(".still_photo").on('mouseout', Image.hideCinemagraph);
})
