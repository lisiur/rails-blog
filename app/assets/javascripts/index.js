// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  if($(".time-line")[0] != undefined){
    left = $(".time-line")[0].offsetLeft;
    width = $(".time-line").width();
    result = left+width/2;
    $(".line").css("left",result);
    $(window).resize(function() {
        left = $(".time-line")[0].offsetLeft
        width = $(".time-line").width();
        result = left+width/2;
        $(".line").css("left",result);
    });
  }
  footer = $("#footer")[0];
  if((footer.offsetTop + footer.clientHeight) < window.outerHeight){
    $(footer).css("position" , "fixed");
  }
})
