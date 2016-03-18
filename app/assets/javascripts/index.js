// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery
//= require jquery_ujs
$(document).ready(function(){
    left = $(".time-line")[0].offsetLeft
    width = $(".time-line").width();
    result = left+width/2;
    $(".line").css("left",result);
    $(window).resize(function() {
        left = $(".time-line")[0].offsetLeft
        width = $(".time-line").width();
        result = left+width/2;
        $(".line").css("left",result);
    });
})