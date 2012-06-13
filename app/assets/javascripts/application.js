// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery-ui

$(document).ready(function() {
  $("input[name$='due_date]']").datepicker({ dateFormat: "yy-mm-dd" });
  $("input[name$='deadline]']").datepicker({ dateFormat: "yy-mm-dd" });
  $(function() {
    $( "#dialog" ).dialog({
      autoOpen: false,
      modal: true
    });

    $( "div[name$='statusadd']" ).click(function() {
      $( "#dialog" ).dialog( "open" );
      return false;
    });
  });
});





