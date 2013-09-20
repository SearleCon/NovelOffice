// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery.turbolinks
//= require bootstrap
//= require bootstrap-datetimepicker
//= require twitter/bootstrap/rails/confirm
//= require temporal
//= require turbolinks
//= require_tree .

// Detect time zone see http://danilenko.org/2012/7/6/rails_timezones for more info about time and time zones
Temporal.detect();

$.fn.twitter_bootstrap_confirmbox.defaults.title = 'ZenNovel';

// Use this to initialize a datetimepicker for the datetimepicker form input. See also app/inputs for input details
// $('.datetime').datetimepicker();

$(document).on("show hide", ".accordion", function(e) {
    return $(e.target).siblings(".accordion-heading").find(".accordion-toggle i").toggleClass("icon-chevron-down icon-chevron-right");
});


$(document).ready(function(){ 

	$("a[href='#top']").click(function() {
	  $("html, body").animate({ scrollTop: 0 }, "slow");
	  return false;
	});


  var currentYear = (new Date).getFullYear();
  $("#year").text( (new Date).getFullYear() );


});