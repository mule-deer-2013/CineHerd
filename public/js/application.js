
$(document).ready(function(){
  var show_the_modal = function(e){
    e.preventDefault()
    $('.signup modal').modal('show');
  }
  $('#modal_link').on('click', show_the_modal)

});