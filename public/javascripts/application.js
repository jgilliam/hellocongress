// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.noConflict();

jQuery(document).ready(function() {
  jQuery("abbr[class*=timeago]").timeago();	
  jQuery("input#legislator_name").autocomplete("/legislators.js");
});