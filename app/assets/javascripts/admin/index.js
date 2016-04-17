// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery
//= require jquery_ujs
//= require flatUI/flat-ui-pro.min
$(document).ready(function(){
  $("#menu-login").hover(function(){
    $(".login_menu").stop(true).delay(200).slideDown("fast");
  },function(){
    $(".login_menu").delay(200).slideUp("fast");
    $(".login_menu").hover(function(){
      $(".login_menu").stop(true).slideDown("fast");
    },function(){
      $(".login_menu").delay(200).slideUp("fast");
    })
  })
  $(':checkbox').radiocheck();
  // Table: Toggle all checkboxes
  $('.table .toggle-all :checkbox').on('click', function () {
    var $this = $(this);
    var ch = $this.prop('checked');
    $this.closest('.table').find('tbody :checkbox').radiocheck(!ch ? 'uncheck' : 'check');
  });

  // Table: Add class row selected
  $('.table tbody :checkbox').on('change.radiocheck', function () {
    var $this = $(this);
    var check = $this.prop('checked');
    var checkboxes = $this.closest('.table').find('tbody :checkbox');
    var checkAll = checkboxes.length === checkboxes.filter(':checked').length;

    $this.closest('tr')[check ? 'addClass' : 'removeClass']('selected-row');
    $this.closest('.table').find('.toggle-all :checkbox').radiocheck(checkAll ? 'check' : 'uncheck');
  });
})
