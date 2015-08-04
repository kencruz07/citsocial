class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.build comment_params
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @comment.post
    else
      flash[:alert] = @comment.errors.full_messages
      redirect_to @post
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to @comment.post
  end

  def comment_params
    params.require(:comment).permit :content
  end
end
