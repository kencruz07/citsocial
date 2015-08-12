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

  $('body').on('click', '.post-delete', function(){
    var delete_confirmation = confirm("Are you sure you want to delete?");
    if(delete_confirmation == true){
      var post_id = $(this).parents('.post-entry').data('post-id');
      $.ajax({
        url: "/posts/" + post_id,
        type: "post",
        dataType: "json",
        data: {"_method":"delete"}
      });
      $('.post-entry[data-post-id='+post_id+']').hide();
      $('.comment-form-list[data-post-id='+post_id+']').hide();
    }
  });

  $('body').on('click', '.comment-delete', function(){
    var delete_confirmation = confirm("Are you sure you want to delete?");
    if(delete_confirmation == true){
      var post_id = $(this).parents('.comment-index').data('post-id');
      var comment_id = $(this).parents('.comment-entry').data('comment-id');
      $.ajax({
        url: "/comments/" + comment_id,
        type: "post",
        dataType: "json",
        data: {"_method":"delete"}
      });

      $('.comment-entry[data-comment-id='+comment_id+']').remove();
      var no_comments =
        $('.comment-index[data-post-id='+post_id+']').
          children('.comment-entry').length;

      var comment_string = ' COMMENTS'
      if(no_comments == 0){
        $('.comment-hide-container[data-post-id='+post_id+']').addClass('hidden');
      }
      else if(no_comments == 1){
        comment_string = ' COMMENT';
      }
      $('.comment-show-link[data-post-id='+post_id+']').text(no_comments+comment_string);
    }
  });

};

$(document).ready(ready);
$(document).on("page:load", ready);
