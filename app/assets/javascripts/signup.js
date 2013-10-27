var show_the_modal = function(e){
  e.preventDefault()
  $('.modal').modal('show');
}

$(document).ready(function(){
  $('#modal_link').on('click', show_the_modal)
});