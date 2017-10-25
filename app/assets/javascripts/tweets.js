$( document ).ready(function() {
  // Interactions for creating new Tweet 
  $("#tweet_text").focus(function() {
    $("#submit-tweet").show();
  });

  $("#tweet_text").blur(function() {
    if($(this).val()){
      $(this).addClass('has-text');
    } else {
      $(this).removeClass('has-text');
      $("#submit-tweet").hide();
    }
  });

  $("#tweet_text").keyup(function(){
    if($(this).val()){
      $("#submit-tweet").prop("disabled",false);
    } else {
      $("#submit-tweet").prop("disabled",true);
    }
  });
});