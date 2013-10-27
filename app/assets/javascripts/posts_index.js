$(document).ready(function(){
  $(".still_photo").on('mouseover', function(){
    console.log(this)
    $(this).addClass('notStill')
    setImageVars()
    displayCinemagraph()  
  })
  $(".still_photo").on('mouseout', function(){
    hideCinemagraph()
    $(this).removeClass('notStill')
  })
})


function displayCinemagraph(){
  $('.notStill').first().attr("src", animated_url)
}

function hideCinemagraph(){
  $('.notStill').first().attr("src", gray_url)
}

function setImageVars(){
  gray_url = $('.notStill').first().attr("src")
  extension = gray_url.substring(gray_url.length-4, gray_url.length)
  animated_url = $('.notStill').first().attr("src").substring(0, gray_url.length - 10) + extension
}