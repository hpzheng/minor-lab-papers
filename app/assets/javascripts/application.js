// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require_tree .

$(document).ready(function() {
  $("table").tablesorter({
    headers: { 0: { sorter: false }}
  });
  $("#ajax-append").click(function() { 
    $.get("assets/ajax-content.html", function(html) { 
      // append the "ajax'd" data to the table body 
      $("table tbody").append(html); 
      // let the plugin know that we made a update 
      $("table").trigger("update"); 
      // set sorting column and direction, this will sort on the first and third column 
      var sorting = [[2,1],[0,0]]; 
      // sort on the first column 
      $("table").trigger("sorton",[sorting]); 
    }); 
    return false; 
  }); 

  $("input[name$='due_date]']").datepicker({ dateFormat: "yy-mm-dd" });
  $("input[name$='deadline]']").datepicker({ dateFormat: "yy-mm-dd" });
});
