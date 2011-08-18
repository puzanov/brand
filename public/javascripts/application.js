// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
  $(".logo").click(function(){
    window.location.href = "/";
  });

  $("#properties_block").hide();

  $("#properties_link").click(function(){        
        $("#properties_block").show();
        $("#description_block").hide();      
  });

  $("#description_link").click(function(){
      $("#description_block").show();
      $("#properties_block").hide();
  });

});
