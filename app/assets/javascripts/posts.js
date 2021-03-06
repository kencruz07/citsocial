var displayComments = function(id){
  $('.js-comment-form-list[data-post-id=' + id + ']').removeClass('hidden');
  $('.js-post-panel[data-post-id=' + id + ']').css('margin-bottom', '-1px');
}

var hideComments = function (id){
  $('.js-comment-form-list[data-post-id=' + id + ']').addClass('hidden');
  $('.js-post-panel[data-post-id=' + id + ']').css('margin-bottom', '15px');
}

var ready = function() {

  $('.js-body-class').on('click', '.js-comment-show-link', function(e){
    e.preventDefault();
    displayComments($(this).data('post-id'));
  });

  $('.js-body-class').on('click', '.js-comment-hide-link', function(e){
    e.preventDefault();
    hideComments($(this).data('post-id'));
  });

  $('.js-body-class').on('click', '.js-post-delete', function(){
    var deleteConfirmation = confirm('Are you sure you want to delete?'),
        postID = null;

    if (deleteConfirmation){
      postID = $(this).parents('.js-post-entry').data('post-id');
      $.ajax({
        url: '/posts/' + postID,
        type: 'post',
        dataType: 'json',
        data: {'_method' : 'delete'}
      });

      $('.js-post-entry[data-post-id=' + postID + ']').hide();
      $('.js-comment-form-list[data-post-id=' + postID + ']').hide();
    }
  });

  $('.js-body-class').on('click', '.comment-delete', function(){
    var deleteConfirmation = confirm('Are you sure you want to delete?'),
        postID = null,
        commentID = null,
        commentString = null,
        noComments = 0;

    if (deleteConfirmation){
      postID = $(this).parents('.js-comment-index').data('post-id');
      commentID = $(this).parents('.js-comment-entry').data('comment-id');

      $.ajax({
        url: '/comments/' + commentID,
        type: 'post',
        dataType: 'json',
        data: {'_method' : 'delete'}
      });

      $('.js-comment-entry[data-comment-id=' + commentID + ']').remove();

      noComments =
        $('.js-comment-index[data-post-id=' + postID + ']').
        children('.js-comment-entry').length;

      commentString = ' COMMENTS';

      if ( noComments == 0 ){
        $('.js-comment-hide-container[data-post-id=' + postID + ']').
          addClass('hidden');
      }
      else if ( noComments == 1 ){
        commentString = ' COMMENT';
      }
      $('.js-comment-show-link[data-post-id=' + postID + ']').
        text(noComments + commentString);
    }
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
