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
  $('.comment-form-list[data-post-id='+id+']').show();
  $('.post-panel[data-post-id='+id+']').css('margin-bottom', '-1px');
}

function hide_comments(id){
  $('.comment-form-list[data-post-id='+id+']').hide();
  $('.post-panel[data-post-id='+id+']').css('margin-bottom', '15px');
}
