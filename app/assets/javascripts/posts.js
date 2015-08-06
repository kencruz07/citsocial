function display_comments(id){
  $('#'+id+'.comment-form-list').show();
  $('#'+id+'.post-panel').css('margin-bottom', '-1px');
}

function hide_comments(id){
  $('#'+id+'.comment-form-list').hide();
  $('#'+id+'.post-panel').css('margin-bottom', '15px');
}

var ready;
ready = function() {

  $('body').on('click', '.comment-show-link', function(e){
    e.preventDefault();
    display_comments($(this).attr('id'));
  });
  $('body').on('click', '.comment-hide-link', function(e){
    e.preventDefault();
    hide_comments($(this).attr('id'));
  });

};

$(document).ready(ready);
$(document).on("page:load", ready);
