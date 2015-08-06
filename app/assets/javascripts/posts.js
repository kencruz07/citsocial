function hello(){
  swal({
    title: 'Are you sure?',
    text: 'You are about to delete your comment.',
    type: 'warning',
    showCancelButton: true,
    confirmButtonClass: 'btn-danger',
    confirmButtonText: 'Delete',
    closeOnConfirm: false
  },
  function(){
    swal('Comment has been deleted!');
  });
}

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

  $('.comment-show-link').on('click', function(e){
    e.preventDefault();
    display_comments($(this).attr('id'));
  });
  $('.comment-hide-link').on('click', function(e){
    e.preventDefault();
    hide_comments($(this).attr('id'));
  });

};

$(document).ready(ready);
$(document).on("page:load", ready);
