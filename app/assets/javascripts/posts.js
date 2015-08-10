function display_comments(id){
  $('.comment-form-list[data-post-id='+id+']').removeClass('hidden');
  $('.post-panel[data-post-id='+id+']').css('margin-bottom', '-1px');
}

function hide_comments(id){
  $('.comment-form-list[data-post-id='+id+']').addClass('hidden');
  $('.post-panel[data-post-id='+id+']').css('margin-bottom', '15px');
}

var ready = function() {
  $('body').on('click', '.comment-show-link', function(e){
    e.preventDefault();
    display_comments($(this).data('post-id'));
  });

  $('body').on('click', '.comment-hide-link', function(e){
    e.preventDefault();
    hide_comments($(this).data('post-id'));
  });

};

$(document).ready(ready);
$(document).on("page:load", ready);
