class CommentsController < ApplicationController

  def create
    @post = PostDecorator.find params[:post_id]
    @comment = @post.comments.build(comment_params).decorate
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        UserMailer.notification(@comment.user,@comment.content).deliver_now
        format.html { redirect_to @comment.post }
        format.js { render :layout => false }
        format.json { render :json => @comment, :status => :created,
          :location => @comment.post }
      else

        format.html { redirect_to @post }
        format.json { render :json => @comment.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to :back
  end

  def comment_params
    params.require(:comment).permit :content, :attachment_attributes => [:image]
  end

end
