class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.build comment_params
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post }
        format.js {}
        format.json { render :json => @comment, :status => :created,
          :location => @comment.post}
      else
        format.html { redirect_to @post }
        format.json { render :json => @comment.errors,
          :status => :unprocessable_entity}
      end
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    # redirect_to @comment.post
    redirect_to :back
  end

  def comment_params
    params.require(:comment).permit :content
  end
end
