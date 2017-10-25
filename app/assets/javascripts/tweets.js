$( document ).ready(function() {
  // Interactions for creating new Tweet 
  $("#tweet_text").focus(function() {
    $("#submit-tweet").show();
    $("#content-header").addClass('expand-header');
  });

  $("#tweet_text").blur(function() {
    if($(this).val()){
      $(this).addClass('has-text');
      $("#content-header").addClass('expand-header');
    } else {
      $(this).removeClass('has-text');
      $("#content-header").removeClass('expand-header');
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